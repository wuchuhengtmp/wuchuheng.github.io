title: 【vscode】vscode使用笔记
author: 吴楚衡
tags:
  - vscode
categories:
  - web
date: 2020-01-10 14:08:00
---
### 配置gitbash

{% note info %}
	在`windowns`下把`git bash`集成到里去
{% endnote %}

 在点击设置搜索`terminal`，选中`terminal`在这相选项中找出`edit in setting jeson`，点击并修改里的终端配置字段`terminal.integrated.shell.window`修改为
 ```json
     "terminal.integrated.shell.windows": "C:\\Program Files (x86)\\Git\\bin\\bash.exe"
 ```
 意思是把数据输入和输出的交互处理交给`git-bash`的执行文件来处理