layout: draft
title: 【前端】npm和yarn踩坑录
author: 吴楚衡
tags:
  - yarn
  - npm
categories:
  - 前端
date: 2020-04-03 00:27:00
---
### 1 `yarn`全局安装包找不到的问题?

&emsp;找出包安装包的`bin`启动目录

``` bash
$ export PATH="$(yarn bin):$PATH"
$ export PATH="$(yarn global bin):$PATH"
```
以上的路径不一定对，最终以全局安装包的实际`.bin`目录为准，写入`.bashrc`或`.zshrc`

<!--more-->

### 2 代理

``` bash
$ # 设置
$ npm config set proxy=http://<host>:<port>
$ npm confit set https-proxy http://<username:password@><host>:<port>
$ # 重置
$ npm config delete proxy
$ npm config delete https-proxy
```
### 3 靠谱源

``` bash
$ npm config set registry https://registry.npm.taobao.org
$ # 官方源
$ npm config delete registry
```