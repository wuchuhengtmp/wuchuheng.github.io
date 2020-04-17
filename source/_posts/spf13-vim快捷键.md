---
layout: layout
title: 【Vim】spf13-vim快捷键
date: 2018-05-18 21:25:30
category: vim
tags: vim
toc: true
---
## Installation
### Requirements
事实上只需在Vim里`:help plugin_name`就可以查看帮助内容，我只是为自己常用的做个速查。
To make all the plugins work, specifically [neocomplete](https://github.com/Shougo/neocomplete.vim), you need [vim with lua](https://github.com/Shougo/neocomplete.vim#requirements).
### Linux, \*nix, Mac OSX Installation

The easiest way to install spf13-vim is to use our [automatic installer](https://j.mp/spf13-vim3) by simply copying and pasting the following line into a terminal. This will install spf13-vim and backup your existing vim configuration. If you are upgrading from a prior version (before 3.0) this is also the recommended installation.

*Requires Git 1.7+ and Vim 7.3+*

```bash

    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
```

<!--more-->
If you have a bash-compatible shell you can run the script directly:
```bash

    sh <(curl https://j.mp/spf13-vim3 -L)
```

## [](#NERDCommenter注释工具 "NERDCommenter注释工具")[NERDCommenter](http://spf13.com/post/vim-plugins-nerd-commenter)注释工具

| 快捷键 | 功能 |
| --- | --- |
| ,c`<Space>` | 切换当前行或选中内容是否注释，根据首行判断 |
| ,ci | 切换当前行或选中内容是否注释，每行自己判断 |
| ,cs | 有格式地注释 |
| ,cy | 复制内容，然后注释 |
| ,ca | 在行末添加注释符并进入insert mode |
| ,cl | 在行首添加注释符并进入insert mode |
| ,ca | 在两种注释符之间切换，如/**/和// |

## [](#NERDTree文件导航工具 "NERDTree文件导航工具")[NERDTree](https://github.com/scrooloose/nerdtree/blob/master/doc/NERD_tree.txt)文件导航工具

| 快捷键 | 功能 |
| --- | --- |
| Ctrl+e | 打开/关闭NERDTree |
| ? | 显示快速帮助 |
| o或Ctrl+R | 打开文件、目录和书签 |
| go | 打开选中文件，不过光标仍在NERDTree中 |
| t | 在新tab中打开选中节点/书签 |
| T | 功能与t相同，不过焦点仍在当前tab |
| i | 在新split打开选中文件 |
| gi | 与i相同，不过光标仍在NERDTree中 |
| s | 在新vsplit中打开选中文件 |
| gs | 与s相同，不过光标仍在NERDTree中 |
| O | 打开选中目录所有子目录 |
| x | 关闭当前节点父节点 |
| X | 关闭当前节点所有子节点 |
| D | 删除当前书签 |
| P | 跳到根节点 |
| p | 跳到当前节点父节点 |
| K | 跳到本层级第一个节点 |
| J | 跳到本层级最后一个节点 |
| C | 设置选中目录为根结点 |
| u | 根结点向上跳出一级 |
| U | 与u相同，只是老根结点保持打开 |
| r | 刷新当前目录所有子目录 |
| R | 刷新当前根目录所有子目录 |
| m | 显示NERDTree的菜单 |
| cd | 将当前工作目录改为选中节点 |
| CD | 将根结点改为当前工作目录 |
| f | 切换是否打开文件过滤 |
| F | 切换是否显示文件 |
| B | 切换书签列表是否显示 |
| A | 最大最小化NERDTree窗口 |

## [](#ctrlp搜索file-buf-mru-tag工具 "ctrlp搜索file/buf/mru/tag工具")[ctrlp](http://kien.github.io/ctrlp.vim/)搜索file/buf/mru/tag工具

mru是Most Recently Used。

| 快捷键 | 功能 |
| --- | --- |
| Ctrl+p | 打开ctrlp并定位在file mode |
| ? | 查看帮助 |
| F5 | 刷新当前目录 |
| Ctrl+f,Ctrl+d | 在mode间左右切换 |
| Ctrl+r | 切换正则表达式mode |
| Ctrl+j,Ctrl+k | 在搜索结果间上下移动 |
| Ctrl+t | 在新tab打开选中结果 |
| Ctrl+v | 在新vsplit打开选中结果 |
| Ctrl+x | 在新split打开选中结果 |
| Ctrl+z then Ctrl+o | 先标记多个文件，然后一起打开 |
| .. | 向上跳一层级 |
| :25 | 跳转到文件第25行 |
| `:/any\:\ string` | 跳转到第一个`any: string` |
| :+setfiletype\ myfiletype &#124; 25 | 将文件类型设为myfiletype并跳转到第25行 |
| `:diffthis` | 对前4个用Ctrl+z标记的文件比较不同 |

## [](#Surround处理所有”‘-’”等 "Surround处理所有”‘{[()]}’”等")[Surround](https://github.com/tpope/vim-surround)处理所有”‘{[()]}’”等

最适用于HTML/XML文件。

| 快捷键 | 功能 |
| --- | --- |
| ds. | 删除包围结构。当光标在`(Hello *world)`中处于*位置时按`ds)`会得到结果Hello world! |
| cs. | 改变包围结构。当光标在`(Hello *world)`中处于*位置时按`cs)]`会得到结果[Hello world!] |
| ysiw. | 包围当前词。当光标在`Hello w*orld`中处于*位置时按`ysiw)`会得到结果Hello (world)! |
| yss. | 包围当前行。当光标在`Hello w*orld`中处于*位置时按`yss)`会得到结果(Hello world!) |

## [](#neocomplcache自动补全工具 "neocomplcache自动补全工具")[neocomplcache](https://github.com/Shougo/neocomplcache.vim)自动补全工具

| 快捷键 | 功能 |
| --- | --- |
| Ctrl+u或Ctrl+n或Ctrl+p | 在原始输入与补全方案间切换 |

## [](#Fugitive集成git工具 "Fugitive集成git工具")Fugitive集成git工具

| 快捷键 | 功能 |
| --- | --- |
| ,gs | 查看git状态`:Gstatus` |
| ,gd | :Gdiff |
| ,gc | :Gcommit |
| ,gb | :Gblame |
| ,gl | :Glog |
| ,gp | :Git push |

## [](#Tabularize-对齐工具 "[Tabularize]对齐工具")[Tabularize]对齐工具

## [](#Tagbar-Tag工具 "[Tagbar]Tag工具")[Tagbar]Tag工具

使用前要先安装exuberant-ctags。执行命令`sudo apt-get install exuberant-ctags`。

| 快捷键 | 功能 |
| --- | --- |
| ,tt | 打开关闭tagbar，显示文件函数 |
| ? | 显示帮助 |
| p | 跳转到tag所在处，光标留在tagbar |
| P | 在预览窗口打开tag |
| Space | 显示tag声明 |
| o | 切换文件夹打开关闭状态 |
| zj | 跳转到下一文件夹 |
| zk | 跳转到上一文件夹 |
| s | 改变排序方式 |
| x | 最大最小化窗口 |
| q | 关闭窗口 |

## [](#EasyMotion跳转工具 "EasyMotion跳转工具")[EasyMotion](https://github.com/Lokaltog/vim-easymotion)跳转工具

| 快捷键 | 功能 |
| --- | --- |
| ,, | 后跟任何正常功能的motion键 |

[本文转自] [http://conglang.github.io/2015/04/06/spf13-vim-cheat-sheet/](http://conglang.github.io/2015/04/06/spf13-vim-cheat-sheet/)


