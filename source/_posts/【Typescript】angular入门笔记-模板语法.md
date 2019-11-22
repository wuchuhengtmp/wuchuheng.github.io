title: 【Typescript】angular入门笔记-模板语法
author: 吴楚衡
tags:
  - angular
categories:
  - Typescript
date: 2019-11-21 11:51:00
---
#### 结构指令


##### 1, 遍历指令
``` html 
	<div *ngFor="let product of products"> 
      {{ product.name }}
    </div>
```
<!--more-->
#### 2,流程判断指令

``` HTML 
	<p *ngIf="product.descript"></p>
```
{% note info %}
不为空则输出<p>
{% endnote %}
  
#### 3,文本绑定输出

``` HTML 
<h3>
	{{ product.name }}      
</h3>
```

#### 4 标签属性绑定

``` HTML

<a [title]="product.name + 'detail'">
</a>
```

#### 5,事件点击绑定

``` HTML
<button (click)="share()">
</button>
```

[更多模板语法](https://angular.io/guide/template-syntax)