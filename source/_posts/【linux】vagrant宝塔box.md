layout: draft
title: 【linux】关于在windows下使用docker的手记
author: 吴楚衡
tags:
  - vagrant
categories: []
date: 2020-03-13 20:03:00
---
#### 1,关于`docker`在`windows`运行起来的说明。
&emsp;`docker`的容器基本上是基本`linux`内核之上来运行的，所以`windows`上是跑不起来`docker`，在，而在`windows`能运行的起来是基于虚拟机来实现，在`windows`上运行虚拟机，而虚拟机运行`linux`，而有了`linux`,`docker`也就能运行的起来了。本质上还是2个系统。
<!--more-->

#### 2, FQA记录

##### 2.1 `docker-compose.yml`挂载卷失败,并提示`{"Message":"Unhandled exception: Drive has not been shared"}.`
这个可能是当前的硬盘没给权限。在`docker`的`
Settting > Resources > FLE SHARING ` 中把要挂载的卷的盘符打勾.
#### 2.2 如何在`windows`和`linux`统一挂载的路径
&emsp; 由于`windows`的文件路径是有盘符的，跟`linux`不是一致的，可以在`windows`的环境变量添加` COMPOSE_CONVERT_WINDOWS_PATHS=1`或者在项目的根据目录下的`.env`文件下加入，最后的路径以类`unix`为准,如`C:\B\A\`则是`/C/B/A/`

#### 3.2 关于镜像下载慢的问题
&emsp; 可以在把:
``` bash
    "http://ovfftd6p.mirror.aliyuncs.com",
    "http://registry.docker-cn.com",
    "http://docker.mirrors.ustc.edu.cn",
    "http://hub-mirror.c.163.com"
```
加入到 `setting > Docker Engine` 下的`registry-mirrors`,以数组的形式