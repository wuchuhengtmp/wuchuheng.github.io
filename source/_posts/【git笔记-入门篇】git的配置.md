title: 【git笔记-入门篇】git的配置（1）
author: 吴楚衡
date: 2019-01-25 01:20:17
tags:
---
![](/images/20190125/201901250916.png)

#### 1 ~/.minttyrc gitbash 终端配置
&emsp;使用`~/.mittyrc`的配置能个性化自己的`gitbash`终端显示。由于对个项目参数的知道的不多，所以就晒下个人一直用精简版的配置。 
<!--more-->

``` bash 
Font=DejaVu Sans Mono for Powerline
FontHeight=13

ForegroundColour=131,148,150
BackgroundColour=0,43,54
CursorColour=220,50,47

#Black=7,54,66
#BoldBlack=0,43,54
#Red=220,50,47
#BoldRed=203,75,22
#Green=133,153,0
#BoldGreen=88,110,117
#Yellow=181,137,0
#BoldYellow=101,123,131
#Blue=38,139,210
#BoldBlue=131,148,150
#Magenta=211,54,130
#BoldMagenta=108,113,196
#Cyan=42,161,152
#BoldCyan=147,161,161
#White=238,232,213
#BoldWhite=253,246,227
BoldAsFont=-1
FontSmoothing=full
FontWeight=700
FontIsBold=yes
#Locale=C
Charset=UTF-8

Columns=110
Rows=26
CursorType=block
Locale=C
Charset=UTF-8
```
#### 2 	`git`输出配色开启
``` bash
git config --global color.ui true
```