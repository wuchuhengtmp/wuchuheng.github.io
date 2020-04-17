---
layout: layout
title: 【前端】css图片占位
author: 吴楚衡
tags:
  - 前端
categories: []
date: 2018-08-11 15:28:00
---
``` css
        img {
            position: relative;
        }
        
        img::after {
            content: "";
            height: 100%;
            width: 100%;
            position: absolute;
            left: 0;
            top: 0;
            background: url(iphonex.png ) no-repeat center;
        }
```
