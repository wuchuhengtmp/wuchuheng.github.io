layout: layut
title: 「nginx」nginx笔记-入手准备
keywords:
  - nginx
  - nginx入门
  - nginx安装
tags:
  - nginx
  - 跨域
categories:
  - linux
date: 2018-11-09 17:17:00
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

### 2 跨域响应头字段声明

``` json
 add_header Access-Control-Allow-Origin *;
 add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
 add_header Access-Control-Allow-Headers 'DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization';
```