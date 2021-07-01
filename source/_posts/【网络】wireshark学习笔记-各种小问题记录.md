layout: draft
title: 【网络】wireshark学习笔记-各种小问题记录
author: 吴楚衡
tags:
  - 网络
categories: []
date: 2021-04-01 18:35:00
---
<div center>
  ![](https://qiniu.wuchuheng.com/image/20210402103814.png)

  </div>
### 1在mac 网卡权限问题
运行`sudo chmod 777 /dev/bpf*`

<!--more-->

wireshark抓取环回链路数据包

为什么wireshark抓包抓不到本机自己跟自己的通信包，因为本机发完本机的数据包不会经过网卡,
而是经过环回链路返回本机，如果要监听环路链路，wireshark需要监听Loopback:lo0