title: 开源
date: 2020-03-30 07:33:52
---
## 1 php类

### 1.1.1 二维码背景图片合并.
#### Installing

``` php
$ composer require wuchuheng/qr_merge -vvv
```
#### Usage
``` php
include_once  './vendor/autoload.php';

use Wuchuheng\QrMerge\QrMerge;
$QrMerge = new QrMerge();
$backgroud_file = './test.png';
$x = 100,
$y = 100,
$size = 3;
$qr_content = 'hello world';
$imgbinary = $QrMerge->generateQr($backgroud_file, $x, $y, $size, $qr_content);
$pngBase64 = $QrMerge->toBase64($imgbinary, 'png');
var_dump($pngBase64); // data:image/png;base64,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
```


	

 

## 2  前端 

### 2.1.1 路由解析器
#### Installing

``` typescript
$ npm i @wuchuhengtools/promise-router
```
#### Usage
``` typescript
import router from '@wuchuhengtools/promise-router'
// ...
router('/me/devices/:id/files/:fileId', '/me/devices/11111/files/22222').then(e => {
    console.log(e) // { "routeParams": { "id": "sdfasdfadsfasd", "fileId": "22222" } 
})
```
### 2.1.1 GBK中文转码解析器

[![Build Status](https://travis-ci.org/wuchuhengtools/gbk-parser.svg?branch=master)](https://travis-ci.org/wuchuhengtools/gbk-parser)
[![codecov](https://codecov.io/gh/wuchuhengtools/gbk-parser/branch/master/graph/badge.svg?token=R4VV625A4V)](https://codecov.io/gh/wuchuhengtools/gbk-parser)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fwuchuhengtools%2Fgbk-parser.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fwuchuhengtools%2Fgbk-parser?ref=badge_shield)

## Installing

```shell
$ npm i @wuchuhengtools/gbk-parser

```

## Usage

``` typescript
import {decodeByHex} from "@wuchuhengtools/gbk-parser"
// ...
 const rest = decodeByHex("d4c1414243303031")
console.log(rest) //粤ABC001


```
