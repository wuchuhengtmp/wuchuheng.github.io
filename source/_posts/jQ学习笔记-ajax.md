---
layout: layout
title: 【前端】jQ学习笔记-ajax
date: 2018-05-13 08:56:37
categories: 前端
tags: javascript
toc: true
---

1.基本使用
--
 &emsp;说明:AJAX 是与服务器交换数据的一项技术，它可以在不重新加载整个网站的情况下更新网页的某部分。

``` html
<div class='demo1'>
    <span> AJAX就是:</span>
    <button>点击我你就知道</button>
</div>
<script src='/library/static/js/jquery-2.1.4.js'></script>
<script type='text/javascript' charset='utf-8'>
    $('.demo1 button').click(function(){
        $.ajax({
            url: '/library/static/html/demo/ajax.html',
            type: 'GET',
            data: {'values1':1,'values2':2},
            dataType: 'json',
            success: function(result){
                $('.demo1  span').append(result.msg);
            },
            error: function(result){
                console.log(result);
            }
        });
});

```
<!--more-->

运行结果:
---
<div class='demo1'>
    <span> AJAX就是:</span>
    <button>点击我你就知道</button>
</div>
<script src='/library/static/js/jquery-2.1.4.js'></script>
<script type='text/javascript' charset='utf-8'>
    $('.demo1 button').click(function(){
        $.ajax({
            url: '/library/static/html/demo/ajax.html',
            type: 'GET',
            data: {'values1':1,'values2':2},
            dataType: 'json',
            success: function(result){
                $('.demo1  span').append(result.msg);
            },
            error: function(result){
                console.log(result);
            }
        });
});
</script>

**注:JSON对象格式**
``` json
{
    "name" : "吴楚衡",
    "email" : "wuchuheng@163.com",
    "github" : "https://github.com/wuchuheng"
}
```

[查看更多](http://www.jb51.net/article/89028.htm)
2.表单提交
---
&emsp;ajax提交表单，字面上的意思。使用ajax方式来提交表单。相对于非异步提交，ajax交换数据少，速度快，不闪屏的友好显示方式。一定程度提高浏览体验。
<form action='/library/static/html/demo/ajax_form.html' method='get' enctype='multipart/form-data'>
    

</form>

