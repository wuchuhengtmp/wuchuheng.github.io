layout: draft
title: 【前端】vue学习笔记-组件通信
author: 吴楚衡
tags:
  - vue
categories:
  - 前端
date: 2020-04-17 04:23:00
---
### 1 `v-on`属性监听实现下级组件向上级组件通信

#### 1.1 父组件

``` html
<template>
  <div>
    {{val}}
    <son v-on:val="changeVal"/>
  </div>
</template>

<script>
import Son from './components/Son'

export default {
  name: 'Index',
  // eslint-disable-next-line vue/no-unused-components
  components: { Son },
  data() {
    return {
      val: 0
    }
  },
  methods: {
    changeVal(val) {
      this.val = val
    }
  }
}
</script>

```
<!--more-->

#### 1.2 子组件

``` html
<template>
  <div></div>
</template>

<script>
export default {
  name: 'Son',
  created() {
    setInterval(
      () => {
        this.$emit('val', Math.random())
      }, 1000
    )
  }
}
</script>


```
#### 1.3 小结
{% note success %}
	子组通过事件发布，改变父组件监听的属性，从而触发父组件的事件从而修改父组件的属性
{% endnote %}

