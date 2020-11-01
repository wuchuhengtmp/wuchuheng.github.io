layout: draft
title: 【linux】国内快速更新debian系的仓库源
author: 吴楚衡
tags:
  - ubuntu源
categories: []
date: 2020-03-09 19:13:00
---
### 用代理的方式
&emsp; 修改`/etc/apt/apt.conf.d/proxy.conf`:
``` json
Acquire {
  HTTP::proxy "http://<host>:<port>";
  HTTPS::proxy "http://<host>:<port>";
  FTP::proxy "http://<host>:<port>";
}
```

<!--more-->

## 更换源方式来实现这
&emsp;这是阿里的`ubuntu`国内加速源，修改`/etc/apt/sources.list`为以下内容试试:

``` bash
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
```

