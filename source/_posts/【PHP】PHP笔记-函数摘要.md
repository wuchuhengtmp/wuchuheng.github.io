layout: layout
title: 【PHP】PHP笔记-函数摘要
author: 吴楚衡
tags:
  - php
categories:
  - php
date: 2019-10-28 23:27:44
---

#### 1 json__decode() 格式化输出

``` shell
   $json = '"{"status":"1","count":"1","info":"OK","infocode":"10000","lives":[{"province":"\u5e7f\u4e1c","city":"\u6df1\u5733\u5e02","adcode":"440300","weather":"\u6674","temperature":"20","winddire                                                                                                 ction":"\u897f\u5317","windpower":"\u22643","humidity":"74","reporttime":"2019-10-28 23:15:45}]}"';
   json_encode($json, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT); 
```
{% note info }
    加了参数`JSON_PRETTY_PRINT`和`JSON_UNESCAPED_UNICODE`后会格式化，在命令行打印就没那么乱了
{% endnote %}
<!--more-->
