layout: draft
title: 【php】hyperf笔记-路由注解
author: 吴楚衡
tags:
  - hyperf
  - 路由注解
categories:
  - php
date: 2020-02-04 05:41:00
---
### 1 什么是路由注解? 
&emsp;路由注解是写在类或方法上的，用于的绑定方法和UR并配置请求方式。

### 2 路由前缀


``` PHP
<?php

declare(strict_types=1);

namespace App\Controller;

...
use Hyperf\HttpServer\Annotation\AutoController;

/**
 * @AutoController(prefix="/users")
 *
 */
class IndexController extends AbstractController
{
    public function index()
    {
        $user = $this->request->input('user', 'Hyperf');
        $method = $this->request->getMethod();

        return [
            'method' => $method,
            'message' => "Hello {$user}.",
        ];
    }
...
```
&emsp;`GET`请求`index`方法的链接为`/users`。
> 路由如果要使用注解的方式，在不配置前缀的前提下， 则心命名空间加类名为`URI`前缀.
<!--more-->



