layout: draft
title: 【php】hyperf笔记-依赖注入
author: 吴楚衡
tags:
  - 依赖注入
  - hyperf
categories:
  - php
date: 2020-02-04 06:41:00
---
### 什么是依赖注入？
&emsp;依赖注入就是`AOP`切面编程，把一个需求实例化的类通过反射机制在一个统一的地方进行实例化，期间通过类型提示的参数对应的依赖类赋值给这个类，然后返回这个实例。
<div style="display:none">
  

``` mermaid
classDiagram
class 容器
class 实例{
    <<instance>>
    - $userInfo : object App\User
}
class Dependence{
    <<config>>
    // 类型提示对应要注入的类
    ...
    'App\UserInterface' => 'App\User' 
    ...
}
class UserInfo{
    <<class>>
}
class User{
    <<class>>
    - $userInfo: Object 
    + __construct(App\UserInterface::class $userInfo) : void
}
容器 --> 实例: 5返回实例
实例 --> 容器:1
容器 <-- User : 2 User类载入容器
Dependence --|> 容器 : 3 查看UserInterface对应的注入类
容器 <|-- UserInfo : 4 根据依赖关系注入
```
</div>
![](/images/202002051532.PNG
<!--more->
官方的`Di`解释是:即“依赖注入”：组件之间依赖关系由容器在运行期决定,由容器动态的将来依赖关系注入到对象之中。  
&emsp;由于实例都是统一从容器中获取，使得只要修改类型提示关联的类就能全局生效，或者类的单例使用。