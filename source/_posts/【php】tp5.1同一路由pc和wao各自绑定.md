---
layout: layout
title: 【php】tp5.1同一路由pc和wao各自绑定.md
date: 2019-04-21 00：40
tags: TP5.1
category: php
---

``` php
use think\facade\Request;

Route::group('/', function(){
    if (Request::isMobile()) {
        Route::rule('', 'mobile/index/index');
    } else {
        Route::rule('', 'index/index/index');
    }
});

```
