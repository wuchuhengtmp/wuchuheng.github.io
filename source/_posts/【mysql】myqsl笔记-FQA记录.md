---
layout: layout
title: 【mysql】myqsl笔记-FQA记录
date: 2019-10-10 22:27:55
categories: mysql
tags: 
    - mysql_fqa
toc: true
---

#### 1 The user specified as a definer ('xxx'@'%') does not exist when
{% note success %}
当从另一台服务器的迁移一个库过来时并将数据库导入到另的用户(跟迁移过来的数据库的原来的用户名不同), 且原来的数据库的用户名并没有重新创建会报这个错误， 错误提示是原来数据库创建的`view` 当前的数据库找不到这个用户。 可以创建原来数据库的账户并把数据库的权限给TA。数据库授权参考[《【mySQL】mySQL学习笔记-基本常识》](/2018/06/10/【mySQL】mySQL学习笔记-基本常识/)
{% endnote %}
