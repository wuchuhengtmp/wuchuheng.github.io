layout: layout
title: 【Javascript】Javascript笔记-函数摘要
keywords:
  - Javascript
categery:
  - Javascript
tags:
  - Javascript
date: 2019-09-29 06:48:13
---
#### 复制函数
``` javascript
function copyStringToClipboard (str) {
   // Create new element
    var el = document.createElement('textarea');
    // Set value (string to be copied)
    el.value = str;
    // Set non-editable to avoid focus and move outside of view
    el.setAttribute('readonly', '');
    el.style = {position: 'absolute', left: '-9999px'};
    document.body.appendChild(el);
    // Select text inside element
    el.select();
    // Copy text to clipboard
    document.execCommand('copy');
    // Remove temporary element
    document.body.removeChild(el);
}

```
#### 使用 
```  javascript
// Usage example:
copyStringToClipboard("abc123");
```
[摘要来源](https://techoverflow.net/2018/03/30/copying-strings-to-the-clipboard-using-pure-javascript/)
<!--more-->

#### 加载完成文件再执行