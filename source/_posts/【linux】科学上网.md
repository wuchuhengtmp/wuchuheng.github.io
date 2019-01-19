title: ' 【linux】科学上网'
author: 吴楚衡
tags:
  - 科学上网
categories:
  - linux
date: 2019-01-07 01:45:00
---
#### 1 简单的ssh隧道实现代理上网
如果你有国外的服务器或者vps，(现在亚马逊云主机第一年免费)，你可以自己搭建代理服务。
但是vpn (pptp / openvpn) 架设和管理还是相对复杂的, 部分运营商还有限制。
除非你有手机用代理等需要，一定要vpn，如果是web上网的话用ssh隧道代理本地端口，简单，效果好。
<!--more-->
#### 1.1 本地ssh客户端转发
注：windowns系统可以安装个`git`命令行客户端当成ssh用户端用。回车输入密码，登录启动转发。
``` bash
ssh -N -D 127.0.0.1:端口 用户名@服务器  
```
#### 1.2 chrome 浏览器端口转发
安装个[`SwitchyOmega`](https://github.com/FelisCatus/SwitchyOmega/releases),选择`crx`后缀文件名下载，并打开谷歌扩展->选择开发者模式->把下载的插件安装文件拖过去。

#### 1.3 配置SwitchyOmega
![](/images/20190107175729.png)

#### 1.4 使用
![](/images/20190107184002.png)
