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


### `Vue.directive`的使用-自定义指令

``` html
<html>
    <head>
        <title>directive 用法</title>
        <meta charset="utf-8"/>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    </head>
    <body>
        <div id="root">
            <!--使用指令，可以在任意标签内的属性中 -->
            <div v-loading="isLoading">{{data}}</div>
            <button  @click="update_data">更新</button>
        </div>
        <script>
            // 注册指令
            Vue.directive('loading', {
                update(el, binding, vnode) {
                    if (binding.value) {
                        const div = document.createElement('div');
                        div.innerText = '加载中...';
                        div.setAttribute('id', 'loading');
                        div.style.position = 'fixed';
                        div.style.left = '0';
                        div.style.top = '0';
                        div.style.width = '100%';
                        div.style.height = '100%';
                        div.style.display = 'flex';
                        div.style.justifyContent = 'center';
                        div.style.alignItems = 'center';
                        div.style.color = 'white';
                        div.style.background = 'rgba(0, 0, 0, .7)';
                        document.body.append(div);
                    } else {
                        document.body.removeChild(document.getElementById('loading'));
                    }
                }
            });
            new Vue({
                el: "#root",
                data: {
                    isLoading: false,
                    data: ''
                },
                methods: {
                    update_data() {
                        this.isLoading = true;
                        setTimeout(() => {
                            this.data = '用户数据';
                            this.isLoading = false;
                        }, 3000)
                    }
                }
            });
        </script>
    </body>
</html>
```

&emsp; 以上`demo`演示当数据加载时，页面覆盖一层半透明遮蔽层`div`,相对以往的侵入式，在注册好指令后可以在多个组件进行调用而不用在多个页面上重复地写.

### 2 `Vue.component`的用法
&emsp; 新建组件demo
``` html
<html>
    <head>
        <title>Vue.Conponent 用法</title>
        <meta charset="utf-8"/>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    </head>
    <body>
        <div id="root">
                <Test :msg="message"></Test>
        </div>
        <script>
            Vue.component('Test', {
                template: '<div>{{msg}}</div>',
                props: {
                    msg: {
                        type: String,
                        default: 'default message'
                    }
                }
            });
            new Vue({
                el: '#root',
                data: () => {
                    return {
                        message: "test Component"
                    }
                }
            });
        </script>
    </body>
</html>
```

### 3  `Vue.extend`用法

&emsp;`Vue.extend`同上的一样，都是新建组件的。
``` html
<html>
    <head>
        <title>Vue.extend 用法</title>
        <meta charset="utf-8"/>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    </head>
    <body>
        <div id="root">
                <Test :msg="message"></Test>
        </div>
        <script>
            const component = Vue.extend({
                template: '<div>{{msg}}</div>',
                props: {
                    msg: {
                        type: String(),
                        default: 'default message'
                    }
                }
            });
            Vue.component('Test', component);
            new Vue({
                el: '#root',
                data: () => {
                    return {
                        message: "test Extend Component"
                    }
                }
            });
        </script>
    </body>
</html>
```

#### 3.2 用`Vue.extend`封装通用的加载庶罩层

&emsp; 在组件内暴露的调用接口为：
*  使用: `Vue.prototype.loading(:String arg)`;
*  关闭 `Vue.prototype.loadiong()()`
``` html
<html>
    <head>
        <title>Vue.extend 用法</title>
        <meta charset="utf-8"/>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <style>
            #loading-wrapper {
                position: fixed;
                top: 0;
                left: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, .7);
                color: #ffffff;
            }
        </style>
    </head>
    <body>
        <div id="root">
            <button @click="showLoading">显示loading</button>
        </div>
        <script>
            function Loading(msg) {
                const LoadingComponent = Vue.extend({
                    template: '<div id="loading-wrapper">{{msg}}</div>',
                    props: {
                        msg: {
                            type: String,
                            default: 'loading...'
                        }
                    }
                }, 'LoadingComponent');
                const div = document.createElement('div');
                div.setAttribute('id', 'loading-wrapper');
                document.body.append(div);
                new LoadingComponent({
                    props: {
                        msg: {
                            type: String,
                            default: msg
                        }
                    }
                }).$mount('#loading-wrapper');
                return () => {
                    document.body.removeChild(document.getElementById('loading-wrapper'));
                }
            }
            Vue.prototype.$loading = Loading;
            new Vue({
                el: '#root',
                methods: {
                    showLoading() {
                        const hide = this.$loading('正在加载中...');
                        setTimeout(() => {
                            hide();
                        }, 2000)
                     }
                }
            });
        </script>
    </body>
</html>
```