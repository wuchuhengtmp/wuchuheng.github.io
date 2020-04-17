---
layout: layout
title: 【php】php安全类
date: 2018-05-22 17:20:39
categories: php
tags: 
    - php算法
---
``` php
class safety
{
/**
 *访问时间间隔判断
 *@param  array ['secondLimit' => int]
 *@return  boolean true 当前访问已过倒计时 false反之
 */
public function isTimeLimit($param)
{  
    $isPass = empty($_SESSION['submitTime']) ? true : false;
    if(empty($_SESSION['submitTime']) OR $_SESSION['submitTime'] > time()) {
        $_SESSION['submitTime'] = time();
    }
    if(time() - $_SESSION['submitTime'] < $param['secondLimit'] && !$isPass) {
       return false;        
   }else{
        $_SESSION['submitTime'] = time();
    return true;
   }
}
}
```
