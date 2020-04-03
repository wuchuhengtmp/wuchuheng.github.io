title: 【linux】git使用ssh通道代理访问仓库
author: 吴楚衡
date: 2019-01-24 15:38:36
tags:
---
&emsp;在国内访问github真的很慢，原因你懂的。通过`ssh`代理来提高访问速度的前提是防火墙外要有一个做代理的主机才可行。
![](http://qiniu.wuchuheng.com/20190124-235445.png)
<!--more-->

#### 1 https代理设置
##### 1.1 git客户端配置 
``` bash
git config --global https.proxy https://127.0.0.1:<port>
git config --global https.proxy http://127.0.0.1:<port>
```
***注*** 撤消： 
``` bash
git config --global --unset https.proxy
git config --global --unset http.proxy
```
##### 1.2 ssh转发配置
``` bash
ssh -N -D 127.0.0.1:<port> <user>@<romote host>
```
*** 注*** ：端口同上

##### 1.3 使用
&emsp; 正常使用`git clone https://github.com/<user>/<rep>`就行。

还有`socks5`方式和`ssh`方式，等我需要用的时候再来总结。拜拜！！！
