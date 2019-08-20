---
title: 【php】算法
date: 2019-08-20 22:42:27
tags:
  - php算法
categery:
  - php
---

### 冒泡从小到大排序 
``` php 
$a = array(23,15,43,25,54,2,6,82,11,5,21,32,65);
for ($i = 0; $i < count($a) ; $i++) {
    for ($j = $i+1; $j < count($a); $j++) {
        if ($a[$i] > $a[$j]) {
            $tem = $a[$i]; 
            $a[$i] = $a[$j]; 
            $a[$j] = $tem; 
        }
    }        
}

```
<!--more-->
