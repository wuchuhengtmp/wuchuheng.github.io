layout: draft
title: 【php】反射类笔记
author: 吴楚衡
tags:
  - 反射
  - composer
categories:
  - php
date: 2020-02-08 09:08:00
---
### 1反射实例一个类
#### 1.1 `composer` 初始化
``` bash 
$ composer init; # 一路回车
```
&emsp;文件内容
```json
{
    "name": "www/tmp",
    "authors": [
        {
            "name": "wuchuheng",
            "email": "root@wuchuheng.com"
        }
    ],
    "require": {},
    "autoload": {
        "psr-4": {
            "App\\": "app/"
        }
    }
}
```
&emsp;配置好`composer.json`后运行`composer dump-autoload` 使配置生效

<!--more-->
#### 1.2 启动文件和要实例化的文件

&emsp;示例类`app/Index.php`
``` php
<?php

namespace App;

class Index
{
    public function say()
     {
       return 'hello world';
    }
}
```
&emsp;在根目录下新建开始文件`start.php`
``` php
<?php

require"./vendor/autoload.php";

$Re = new \ReflectionClass(App\Index::class);
$contents = $Re->newInstanceArgs()->say();
var_dump($contents); // hello world

```
