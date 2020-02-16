layout: draft
title: 【前端】vue学习笔记
author: 吴楚衡
tags:
  - vue
categories:
  - 前端
date: 2020-02-13 20:03:00
---
### 1 emit和on的用法

&emsp; `emit`用于调用自定义事件是事件是消费方，`on`用于指明事件要调用的方法是调度方。
``` html
<!DOCUMENT>
<html>
    <header>
        <meta charset="utf-8">
        <script src="./vue_demo.js"></script>
    </header>
    <body>
        <div id="root">
            <button @click="boost">触发事件</button>
        </div>
    <script>
        new Vue({
            el: "#root",
            data() {
                return {
                    message: 'hello world'
                }
            },
            created() {
                this.$on('my_events', this.handleEvents);  // 指明要调度的事件方法1
                this.$on('my_events', this.handleEvents1); // 指明要调度的事件方法2
                this.$on('my_events', this.handleEvents2); // 指明要调度的事件方法3
            },
            methods: {
                handleEvents(e, a) {
                    console.log(this.message, e)
                },
                handleEvents1(e) {
                    console.log(this.message, e)
                },
                handleEvents2(e) {
                    console.log(this.message, e)
                },
                boost() {
                    this.$emit('my_events', 'my params'); //消费方
                }
            }
        });
    </script>
    </body>
</html>
```
<!--more-->
&emsp;那这个有什么用呢？还不知道，由于叫事件，通常用于全局使用吧，这样能对代码进行切片，降低耦合。
