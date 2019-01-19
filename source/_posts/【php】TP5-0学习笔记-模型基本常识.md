---
layout: layout
title: 「php」TP5.0学习笔记-模型基本常识
date: 2018-06-10 22:07:45
tags: TP5.0
category: php
---

#### 1. 模型内置的查询方法
注:在控制器中引入模型后直接调用
``` php
    //查表的id数据单条数据
    modleName::get($id); 
    modleName::find($id);
    //查多条数据
    modleName::all();
    modleName::select();
```
<!--more-->
#### 2. Db另一种查询条件的法
注：不能在里面where的闭包中使用select()方法
``` php
    Db::name(<table name>)
    ->where(function($query)use($id,$gid){
        $query->where("id={$id}")->where("gid={$gid}")->where...;
            })
    ->select();
```

