---
layout: layout
title: 「linux」manjaro学习笔记-安装manjaro-xfce
author: 吴楚衡
date: 2018-10-01 09:57:44
keywords: 
   - manjaro
   - archlinux
   - manjaro安装
tags:
   - manjaro
categories: 
   - linux 
---
#### 1 制作U盘启动
* [Rufus官网](https://rufus.akeo.ie/)下载U盘制作工具。
* 从[清华镜像](https://mirrors.tuna.tsinghua.edu.cn/manjaro-cd/)下载镜像文件，根据自己芯片架构选择版本。
<!--more-->

#### 2 镜像制作
*  本地将U盘FAT32格式。，
* 打开镜像制作工具选择U盘，导入镜像。
* U盘制作工具选择DD模式制作。
* 开始制作。

#### 3 安装系统
* 接入U盘，开机按F12（有些可能是F8），U盘启动。
* 进入到manjaro向导页面。根据提示自己设置。
* 最后选中manjaro启动，回车进入系统安装配置界面。
* 如要安装timeshift快照工具，就要分出一个空白区。用于存放快照并挂载到系统中，如`/home/snapshot`
* 根据提示按照自己的需求来选择，并完成了本次的系统安装过程。

#### 4 安装manjaro其它版本
* 安过程基本同上。追求性能就xfce版本，追求现代化桌面就gnome，界面好看也吃内存。

#### 5 改为国内源
``` bash
	sudo pacman-mirrors -i -c China -m rank  # 选择项会写入/etc/pacman.d/mirrorlist
    sudo echo -e "[archlinuxcn]\nServer =  https://mirrors.shu.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf #配置软件源
    sudo pacman -Syyu # 更新
    sudo  pacman -S archlinuxcn-keyring
    sudo pacman -Syy
```

#### 6 更新到GLIBC_2.28
`GLIBC_2.28`是较新的版本，很软件都要依赖它，不然启动不了。
``` bash 
sudo strings /lib64/libc.so.6 | grep GLIBC_ #查看本地GLIBC版本，已经有的版本库没有到2.28就安装更新
sudo pacman -S glibc lib32-glibc --force 直接安装
```
GLIBC_2.28更新可参考[Linux(manjaro)安装glibc指定版本](https://blog.csdn.net/HD2killers/article/details/81163166)
#### 7 安装timeshift
安装tiemshift。以便于备份回滚，不过存放快照的地方要新建一个空白分区用于存放快照。
``` bash 
sudo pacamn -S timeshift 
```
#### 8 更新pacman并安装yaourt 
``` bash 
sudo pacman -S  yaourt 
```
#### 9 安装常用软件
 * tim `sudo yaourt -S deepin.com.qq.offic` community源。
 * qq `sudo yaourt -S deepin.com.qq.im`。
 * wps `pacman -S wps-office ttf-wps-fonts`。
 * chrome `sudo pacman -S chromium` community源。
 * 网易音乐 `sudo pacman -S netease-cloud-music`。
####  10 五笔输入法
 * `sudo pacman -S fcitx fcitx-im fcitx-configtool`
 * 编辑 ~/.xprofile
 ``` bash 
 #fcitx
 export GTK_IM_MODULE=fcitx 
 export QT_IM_MODULE=fcitx 
 export XMODIFIERS="@im=fcitx"
```
* 根据提示配置下后重新启动下输入法
* [参考资料](https://wiki.archlinux.org/index.php/Fcitx)

#### 11 修复tim不能输入汉字问题
在/opt/deepinwine/apps/Deepin-TIM/run.sh中加入
``` bash 
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
```
重启tim就行了,[参考资料](http://blog.sciencenet.cn/blog-117412-1137251.html)

#### 12  安装字体
* 查找你要安装的字体 `pacman -Ss font`，然后安装如`sudo pacman -S extra/ttf-dejavu` 
* ` fc-cache -vf`  更新字体缓存
* [官方说明文档]（https://wiki.archlinux.org/index.php/Fonts）
* `sudo pacman  -Sy ttf-google-fonts-git`大字体

