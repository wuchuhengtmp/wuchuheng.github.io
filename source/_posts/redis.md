---
title: 【redis】php笔记-RedisException:-read-error-on-connection-in
date: 2019-07-14 06:12:29
tags: redis
---

`php`在使用`redis`的消息后，出现隔一段时间没连接会报`redis`断开的异常。
在`$redis`这个连接实例修改下属性`$redis->setOption(Redis::OPT_READ_TIMEOUT, -1);`
就行了。具体的原因我还不太明确。 
