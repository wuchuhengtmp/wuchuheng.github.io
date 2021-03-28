layout: draft
title: 【安卓】在手机运行个外网可以访问的web服务
author: 吴楚衡
date: 2021-03-24 13:49:27
tags:
---
<div style="">
![](https://qiniu.wuchuheng.com/image/mobile-phone-flagships-psd.jpeg)
</div>
&emsp;在手机运行个外网可以访问的web服务可行的。材料有:
* 手机电信卡(这里用移动)
* 一只安卓手机（这里是用红米note 8 pro）
* 一个域名（这里用[m.wuchuheng.com:8000](http://m.wuchuheng.com:8000)做演示）
让一个`web`服务能稳定地被外网访问，需要通过电信卡把手机设置成`ipv4/ipv6`的联网方式，从而拿到公网的`ipv6`,然后域名解析到这个`ipv6`上， 然后把`web`服务执行文件传送到手机并运行起来， 然后就可以访问了。最后作下开机自启和动态解析就可以了。
<!--more-->

### 1 手机获取公网ipv6
{% fullimage https://qiniu.wuchuheng.com/image/20210324224303.png, alt, title %}
