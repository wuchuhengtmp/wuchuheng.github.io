---
layout: layout
title: 【vim】vim学习笔记-多重复制插件
tags:
  - vim
categories:
  - vim
date: 2018-06-15 13:16:00
---
#### 1. 说明
&emsp;在vim的文本编辑中有时会用到以前的历史复制记录，而vim又只能够支持一次复制。我很不理解，不过有一个叫**YankRing.vim**的插件实现了这个功能(多重复制)。
<!--more-->

---

#### 2. 使用
``` bash
Bundle 'vim-scripts/YankRing.vim' "在sfp13-vim中的.vimrc.local
```
``` bash
:source %
:PluginInstall
```
`:YRShow`查看复制的历史记录，用`j`和`k`来选择。驾车确定。
