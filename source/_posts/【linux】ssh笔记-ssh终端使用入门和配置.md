layout: layout
title: 【linux】ssh笔记-ssh终端使用入门和配置
author: 吴楚衡
keywords:
  - ssh入门
  - ssh使用
  - ssh怎么用
  - ssh掉线
  - ssh长连接
tags:
  - ssh
categories:
  - linux
date: 2018-11-11 21:05:44
---
#### 1 `ssh`保持连接
  &emsp;`ssh`如果连接后没有操作就会被防火墙断开,也为防止这种情况出现,以每隔一定的间隔时间向远程端发送空数据包来保持连接.在`~/.ssh/config`添加:
``` bash
Host    *                #任何主机
ServerAliveInterval 60   #每60秒发送空数据包给远端
ServerAliveCountMax 3    #远端连续不响应3次,断开
```
或者在服务端口`/etc/ssh/sshd_config`的` ClientAliveInterval 300`（默认0),区别于以上的是，这是从服务器发送心跳。
更多参考[linux ssh_config和sshd_config配置文件学习](https://www.cnblogs.com/panda2046/p/5933498.html)

<!--more-->
#### 2 `ssh`别名免密登录
{% note info %}别名免码登录是指通过自定义的别名和本地的密钥的方式来登录远程机。经常登录主机要打用户名的,主机名和密码，别名能省略当中操作,降低登录的人工成本{% endnote %}
   &emsp;如果没有密钥，输入`ssh-keygen -t rsa -C "<your email>"`后一路回车。然后`ssh-copykey [user]@[host] -p [port]`输入密码，把本地公钥复制到远程主机上。然后在`~/.ssh/config`加入以下配置。
``` bash 
    Host             alias          #别名
    User             root           #登录名
    Hostname         127.0.0.1      #主机地址
    IdentityFile    ~/.ssh/id_rsa   #密钥文件
    Port            22              #远程主机端口
```
最后终端输入`ssh alias`驾车就能登录。
 


#### 3 `ssh`终端僵死退出快捷键
`sssh`连接不加心跳，过一段时间会断开并僵死。按`回车~.`来退出。

#### 4 把ssh会话切换回本地
当我们连接了远程主机时，需要临时把切换回本地操作，又不想断开远程的连接时，按`~ CTRl+z` 就可以回到本地并远程的连接作为后台任务隐藏起来。
当需要再次回来远程连接时，输入`fg`或`fg <任务>`编号重新切换到连接会话。





