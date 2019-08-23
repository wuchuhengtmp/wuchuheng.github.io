---
title: 【mysql】数据表千万级初探
date: 2019-08-22 16:41:51
tags:
  - mysql
categories: mysql  
---

#### 开篇明议 
  昨天一家公司的面试官问了个问题，有2个表就是快递详情表和快递轨迹表，每天有百万个
快递，数据表的每张表少说都不少于千万条，问题是怎么根据用户的id快速查找用户的快递单
和运动轨迹?最好查询时间控制在600毫秒下。  
  这是一个一对多的关系，就一个快递单子有多个轨迹点。 

#### 测试机子环境
`OS`: `homestead:8.0.1(debian) 64位`
`内存` : `8G`
`mysql version`:  `5.7.27`

<!--more-->

#### 建表和添加测试数据

``` mysql 
create database test; -- 测试数据库

-- 快递订单表
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `uid` int(15) NOT NULL COMMENT '用户id',
  `order_number` int(15) NOT NULL COMMENT '快递单号',
  `p_from` varchar(50) NOT NULL COMMENT '发件人',
  `p_to` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '收件人',
  `is_receive` int(1) NOT NULL DEFAULT '0' COMMENT '是否收件 0否 1收',
  `create_time` int(10) NOT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--- 轨迹表
CREATE TABLE `track` (
`id`  int(255) NOT NULL AUTO_INCREMENT ,
`y`  float(10,0) NULL COMMENT 'y座标' ,
`x`  float(10,0) NULL COMMENT 'x座标' ,
`order_number`  int(22) NULL COMMENT '单号' ,
PRIMARY KEY (`id`),
INDEX `order_number` (`order_number`) 
)
COMMENT=' 轨迹表';
 
-- 添加测试数据 
create procedure add_test_data()
begin
    declare num int;
    declare order_number int;
         declare track_num int;
        declare track_while int;
    set num=1;
    while num <= 10 do
       set order_number = FLOOR(RAND() * RAND() * 10000);
        insert into express(uid,order_number, p_from, p_to, is_receive, create_time) values(FLOOR(RAND()*RAND()*1000), order_number, CONCAT('from_', floor(rand()*1000)), CONCAT('to_', floor(rand()*1000)),0, UNIX_TIMESTAMP(NOW()));
        set num=num+1;
        set track_while = floor(rand() * 10);
        set track_num = 1;
        while track_num <= track_while do
           INSERT INTO `test`.`track` ( `y`, `x`, `order_number`) VALUES (rand()*rand()*100, rand()*rand()*100, order_number);
           set track_num = track_num + 1;
        end while;
    end while;
end;

call add_test_data();

```
有1亿条左右的数据，预计没有半天时间是生成不完的。
![](/images/1566528906.png)
 
 
