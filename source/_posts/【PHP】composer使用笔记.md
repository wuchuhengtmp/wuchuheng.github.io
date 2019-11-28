title: 【PHP】composer使用笔记
author: 吴楚衡
tags:
  - composer
  - laravel
categories:
  - php
date: 2019-11-28 16:09:00
---
### laravel 全局函数文件配置（摘抄）
An easy and efficient way of creating a global functions file is to autoload it directly from Composer. The autoload section of composer accepts a files array that is automatically loaded.

Create a `functions.php` file wherever you like. In this example, we are going to create in inside `app/Helpers`.

Add your functions, but do not add a class or namespace.

``` php
<?php

function global_function_example($str)
{
   return 'A Global Function with '. $str;
}
```
<!--more-->

In `composer.json` inside the autoload section add the following line:

`"files": ["app/Helpers/functions.php"]`
Example for Laravel 5:
``` json

"autoload": {
    "classmap": [
        "database"
    ],
    "psr-4": {
        "App\\": "app/"
    },
    "files": ["app/Helpers/functions.php"] // <-- Add this line
},
```
Run composer dump-autoload

Done! You may now access `global_function_example('hello world')` form any part of your application including Blade views.
[来源](https://stackoverflow.com/questions/32419619/how-do-i-make-global-helper-functions-in-laravel-5/32422699)