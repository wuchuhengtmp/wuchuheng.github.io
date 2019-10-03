---
layout: layout
title: 【php】学习笔记-基于workerman定时类定时任务
date: 2018-06-11 16:24:32
tags: TP5.0
category: php
---

别人问怎么做定时任务？我说当然是`crontab`啊！！！做为一个`PHPER`
只会用`crontab`真不好意思。不过，以下是基于常驻进程框架结合`mysql`
做的定时信号。至少实现了定时不是？
<!--more-->
* 1,在项目要根目录安装依赖`composer require workerman/workerman`
* 2,创建`start.php`并写入
``` php 
<?php 
/**
 * 使用说明   
 * 先切换到项目根目录下
 * 启动 php start.php start  这是调试模式，信息会直接echo出来 停止 按ctrl+c
 * 后台启动  php start.php  start -d 如果在调试模式下测试没有问题了。 真正使用的用后台模式，这样就算你人离线了程序也会在后台运行
 * 关闭后台  php start.php  stop
 *
 */
require_once __DIR__ . "/vendor/autoload.php";

use \Workerman\Worker;
use \Workerman\Lib\Timer;
// 检查扩展
if(!extension_loaded('pcntl')) exit("需要pcntl扩展");
if(!extension_loaded('posix')) exit("需要posix扩展");
if(!extension_loaded('pdo')) exit("需要pdo扩展");
if(!extension_loaded('pdo_mysql')) exit("需要pdo_mysql扩展");

$task = new Worker();
// 开启多少个进程运行定时任务，注意业务是否在多进程有并发问题
$task->count = 1;
$task->onWorkerStart = function($task)
{
    // 定时让程序每60秒执行一次
    $time_interval = 60;
    Timer::add($time_interval, function()
    {
      //连接数据库
			$db = new \Workerman\MySQL\Connection(
				'127.0.0.1', // host
			  '3306', //port
			  'root',  //username
				'123qwe', //password
			  'crontab' //db_name 数据名
			);
			$has_data = $db->query("SELECT * FROM `task`");
       if ($has_data) {
           //当前时间
           date_default_timezone_set("PRC");
           $minute = date('i', time()); //当前分
           $hour   = date('H', time()); //当前时
           $today  = date('d', time()); //当前天
           $month  = date('m', time()); //当前月
           $week   = date('w', time()); //当前周
           foreach($has_data as $task)
					 {
				       switch($task['type']) {
			             case 1 : 
                       //每小时任务
                       if($task['minute'] == $minute) {
                             echo $task['task'] . "\n";
                       }
	                      break;
                   case 2 : // 每天任务
                       if($task['hour'] == $hour && $task['minute'] == $minute) {
                             echo $task['task'] . "\n";
												}
	                      break;
                   case 3 : // 每月任务
                       if($task['hour'] == $hour && $task['minute'] == $minute && $task['day'] == $today) {
                             echo $task['task'] . "\n";
												}
                   break;
                   case 4 : // 每星期每小时任务
                       if($task['week'] == $week && $task['minute'] == $minute) {
                             echo $task['task'] . "\n";
												}
                   break;
                   case 5 : // 每星期任务
                       if($task['week'] == $week && $task['minute'] == $minute && $task['hour'] == $hour) {
                             echo $task['task'] . "\n";
												}
                   break;
							 }
					 }
			 }
    });
};

// 运行worker
Worker::runAll();

```
* 3，数据库 
``` mysql 
-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 03, 2019 at 06:48 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crontab`
--

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `t_id` int(10) NOT NULL,
  `minute` int(2) DEFAULT NULL COMMENT '分',
  `hour` int(2) DEFAULT NULL COMMENT '时',
  `day` int(2) DEFAULT NULL COMMENT '日',
  `month` int(2) DEFAULT NULL COMMENT '月',
  `week` int(2) DEFAULT NULL COMMENT '周',
  `task` varchar(250) DEFAULT NULL COMMENT '任务',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '类型1每小时，2每天，3每月，4每个星期每小时，5每个星期每小时'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`t_id`, `minute`, `hour`, `day`, `month`, `week`, `task`, `type`) VALUES
(1, 34, NULL, NULL, NULL, NULL, '每小时任务：你的任务是每个小时34分执行一次', 1),
(2, 35, 14, NULL, NULL, NULL, '每天任务：你的任务是14：35执行一次', 2),
(3, 36, 14, 3, NULL, NULL, '月期任务：你的任务是每个月 3号14：36执行一次', 3),
(4, 37, NULL, NULL, NULL, 3, '周期每小时任务：你的任务是每个星期3每个小时的37分执行一次', 4),
(5, 38, 14, NULL, NULL, 3, '周期小时任务：你的任务是每个星期01:01执行一次', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `t_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

```
