layout: draft
title: 【产品】关于开发websocket测试工具说明
author: 吴楚衡
date: 2020-11-04 12:13:34
tags:
---
### 1 开发原因
$emsp; 当前`websocket`还有没有找到一个自己趁手的测试工具来测试`websocket`的工具，所以想做一个出来，参考的典型对象是`postman`;

### 功能说明

&emsp; 由于`websocket`是长连接，连接一次就可以了，没有`http`的状态码概念，要测试的数据是返回的数据类型结构是否符期待。
发送数据期望是类型`http`那样有请求头部和体部。返回数据期望参数`umi`的`http json` 结构