layout: draft
title: 【配置】mac配置小结
author: 吴楚衡
tags:
  - mac
categories:
  - 配置
date: 2020-05-19 06:49:00
---
![](http://qiniu.wuchuheng.com/images/2019-mac-family.jpeg)
&emsp;`mac`确实对开发很友好,但也是要配置下才能符合使用习惯啊。所以这一篇个人习惯配置过程记录。

### 1 `v2rayu`代理工具
&emsp;第一个要安装的软件绝对是代理工具，不然后面的配置难以进行。在国内，使用代理工具可以解决国外数据源访问慢（如：github),访问卡(如:`npm`)等等网络数据不通的问题。`v2ray`是首选，`v2rayv`是`mac`下的基于`v2ray`开发的`mac`用户端的工具之一，用过都说好。工具下载好还需要自己搭建下代理服务器，搭建方法可以去`github`找`v2ray`的官方源码说明，也可以参考这个一键[安装脚本](https://github.com/233boy/v2ray/tree/master)  
下载用户端下载地址:  
[【最新版】github下载](https://github.com/yanue/V2rayU/releases)  
[【七牛云】下载](http://qiniu.wuchuheng.com/tools/V2rayU.dmg)
<!--more-->

### 2 配置`bash`环境代理
&emsp; `v2rayv`安装好后并配置好要使用的代理服务器后，启动并在点击启动图标，下面有个选项，让你复制代理代码,默认是:
``` bash 
$ export http_proxy=http://127.0.0.1:1087/;export https_proxy=http://127.0.0.1:1087/;
```
运行后当前`bash`环境下的`http`请求会经过代理来处理.
#### 2.2 `ssh` 连接代理
如果对一台机直接`ssh`连接也能通过代理来连接。在`~/.ssh/config`中加入
``` bash 
Host *
    ProxyCommand nc -X 5 -x localhost:1087 %h %p
```
意思是对`ssh`下的连接由于本地的`localhost:1087`来代理。`*`是连接别名通配的意思。

### 3 `homebrew`安装
``` bash 
$ mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
```
由于官方推荐安装到个人的目录下，所以以上的命令会把`homebrew`安装到个人目录的`~/homebrew`,需要把启动文件加入环境变量才能使用`brew`,执行:
``` bash
$export PATH="~/homebrew/bin:$PATH"
```

### 4 安装`oh my zsh`

``` bash 
$sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```
#### 4.1 配置`zsh`默认配置文件`~/.zshrc`
##### 4.1.1 默认代理
安装完后，系统会默认安装好`zsh`,想要之前的代理默认生效需要在`～/.zshrc`加入:
``` bash 
export http_proxy=http://127.0.0.1:1087/;
export https_proxy=http://127.0.0.1:1087/;
```
也可以定义命名别名来实现启动和关闭,在`~/.zshrc`加入
``` bash
alias setproxy="export https_proxy=http://127.0.0.1:1087/;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:1087/;echo \"Set proxy successfully\" "
alias unsetproxy="unset http_proxy;unset https_proxy;unset all_proxy;echo \"Unset proxy successfully\" " 
alias ipcn="curl myip.ipip.net"
alias ip="curl ip.sb"
# 上面这几个 alias 是自定义的命令
# unsetproxy 取消代理
# setproxy 设置代理
# ip & ipcn  查看 IP
```
注: 以上的命令行[参考处](https://www.xbug.me/post/60589.html)

##### 4.1.2 默认`brew`
由于`brew`是安装在自己的目录下的，需要在`~/.zshrc`中加入环境变量配置，才能默认生效。
``` bash
export PATH="~/homebrew/bin:$PATH"
```

更多[`oh my zsh`配置参考《【linux】Oh-My-Zsh使用笔记》](/2018/05/22/【linux】Oh%20My%20Zsh使用笔记/)

### 5 安装`iterm2`
[官方下载地址]（https://www.iterm2.com/）

### 6 安装字体
&emsp;  如果要对`oh my zsh`进行配置的话，会出现字体乱的情况，下载字体就是为了解决这个问题。
``` bash
$ brew tap homebrew/cask-fonts
$ brew cask install font-hack-nerd-font
```
安装好后，在`item2`选择字体为`hack nerd font mono`就行了
注: [字体来源](https://github.com/ryanoasis/nerd-fonts)

### 7 安装`nvm`

``` bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
```
