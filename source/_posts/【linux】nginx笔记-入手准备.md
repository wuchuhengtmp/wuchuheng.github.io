---
layout: layut
title: 「nginx」nginx笔记-入手准备
date: 2018-11-10 01:17:45
keywords: 
    - nginx
    - nginx入门
    - nginx安装
tags:
    - nginx
categories: 
    - linux
---
### 1.安装
* centos7 yum 源安装，新增官方源文件`/etc/yum.repos.d/nginx.repo`,内容如下:
```bash
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
```
&emsp;接着运行`sudo yum clean all && sudo yum makecache && sudo yum install -y nginx`进行安装。
<!--more-->
