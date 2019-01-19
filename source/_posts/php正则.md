---
layout: layout
title: 「php」php正则
date: 2018-05-31 17:31:03
category: php
tags: php正则
---
1,验证中文
``` php
    preg_match('/^([\x{4e00}-\x{9fa5}]{2,})$/u','<被验证中文字符串>') ? true : false;
```
