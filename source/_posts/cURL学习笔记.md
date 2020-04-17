---
layout: layout
title: 【php】cURL学习笔记
date: 2018-06-03 12:26:55
categories: php
tags: 
    - php算法
toc: true
---

#### 说明
&emsp;cURL官方义:cURL is a command line tool for transfering data whith URL syntax (使用URL语法传输数据的命令行工具)。

#### 简单示例
``` php
    /**
     *获取百度html页面
     *@return string $html
     */
    function getHtml()
    {
        $url = 'http://www.baidu.com'
        $ch   = curl_init();
        curl_opset($ch,CURLOPT_URL,$url);
        curl_opset($ch,CURLOPT_RETURNTRANSFER,true);//不打印
        $html = curl_exec($ch);
        curl_close($ch);
        return $html;
    }
    
```
<!--more-->
