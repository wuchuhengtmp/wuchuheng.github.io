---
layout: layout
title: 【linux】为archlinux选择国内镜像(转)
date: 2019-06-01 15:33:35
categories: linux
tags: linux
toc: true
---
许多镜像站没在官方的列表里,可以手动添加到你的镜像列表里,但这些镜像有可能很长时间没有更新了,可以从[这里](https://www.archlinux.org/mirrors/status/)检查镜像状态.

*   电信

        *   [http://mirror.bit.edu.cn/archlinux/](http://mirror.bit.edu.cn/archlinux/) - 北京理工大学
    *   [http://mirrors.aliyun.com/archlinux/](http://mirrors.aliyun.com/archlinux/) - 阿里巴巴
*   联通

        *   [http://mirrors.sohu.com/archlinux/](http://mirrors.sohu.com/archlinux/)
    *   [http://mirrors.yun-idc.com/archlinux/](http://mirrors.yun-idc.com/archlinux/)
*   教育网

        *   [http://ftp.sjtu.edu.cn/archlinux/](http://ftp.sjtu.edu.cn/archlinux/) - 上海交通大学y
    *   [http://mirrors.4.tuna.tsinghua.edu.cn/archlinux/](http://mirrors.4.tuna.tsinghua.edu.cn/archlinux/) (ipv4 only)
    *   [http://mirrors.6.tuna.tsinghua.edu.cn/archlinux/](http://mirrors.6.tuna.tsinghua.edu.cn/archlinux/) (ipv6 only)
    *   [http://mirror.lzu.edu.cn/archlinux/](http://mirror.lzu.edu.cn/archlinux/) - 兰州大学
    *   [https://mirrors.nju.edu.cn/archlinux/](https://mirrors.nju.edu.cn/archlinux/) - 南京大学

## <a name="t1"></a>启用镜像
<!--more-->

取消你想启用的镜像前的注释 

注意,使用http协议的比使用ftp的更快 

刷新镜像列表

<pre class="prettyprint" name="code">`pacman <span class="hljs-attribute">-Syyu</span><div class="hljs-button signin" data-title="登录后复制"></div>`


要注意镜像并不是越多越好,pacman默认只会连接第一个镜像地址,除非第一个不可用才会尝试链接第二个.

因此可以尝试将镜像按速度排序

## <a name="t2"></a>将镜像按速度排序

*   使用`rankmirrors`
    备份现在的镜像文件

<pre class="prettyprint" name="code">`<span class="hljs-keyword">cp</span> mirrorlist mirrorlist<span class="hljs-preprocessor">.backup</span><div class="hljs-button signin" data-title="登录后复制"></div>`


使用rankmirrors将mirrorlist.back里的镜像按速度排序,找出前6个放到镜像文件里

<pre class="prettyprint" name="code">`rankmirrors -n <span class="hljs-number">6</span> mirrorlist<span class="hljs-preprocessor">.backup</span> &gt; mirrorlist<div class="hljs-button signin" data-title="登录后复制"></div>`


*   使用reflector
    直接把最近同步的镜像按速度排序覆盖 `/etc/pacman.d/mirrorlist`

<pre class="prettyprint" name="code">`<span class="hljs-comment">reflector</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">verbose</span> <span class="hljs-literal">-</span><span class="hljs-comment">l</span> <span class="hljs-comment">200</span> <span class="hljs-literal">-</span><span class="hljs-comment">p</span> <span class="hljs-comment">http</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">sort</span> <span class="hljs-comment">rate</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">save</span> <span class="hljs-comment">/etc/pacman</span><span class="hljs-string">.</span><span class="hljs-comment">d/mirrorlist</span><div class="hljs-button signin" data-title="登录后复制"></div>`


因此要一个个测试连接速度,可以比较慢,耐心等就好
          </div>
          <link href="https://csdnimg.cn/release/phoenix/mdeditor/markdown_views-258a4616f7.css" rel="stylesheet">
                  </div>
  </article>
  来源：https://blog.csdn.net/kxp9545/article/details/76136190
