layout: layout
title: 【mysql】phpmyadmin学习笔记-配置
categories:
  - mysql
tags:
  - phpmyadmin
toc: true
date: 2019-10-03 09:25:00
---
1 输入主机地址
--
`phpmyadmin`不配置是默认本地地址的，启用地址可以登录其它的主机上，出于这个用途，修改`./libraries/config.default.php`
`$cfg['AllowArbitraryServer'] = true`
[官方文档说明](https://docs.phpmyadmin.net/en/latest/config.html#cfg_AllowArbitraryServer)

2, 登录时长
--

`phpmyadmin`有登录时长,默认1440秒不操作自动退出登录，对于经常用的人来说，好烦的。 直接修改`./libraries/coonfig.default.php` `$cfg['LoginCookieValidity']=1440`,根据自己的情况来写。
[官方文档说明](https://docs.phpmyadmin.net/en/latest/config.html#cfg_LoginCookieValidity)

<!--more-->


