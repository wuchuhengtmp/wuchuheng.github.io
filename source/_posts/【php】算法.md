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

### 无限分级数组树

``` 
function _arrToTree($items, $pid = 'parentId')
{
    $map  = [];
    $tree = [];
    foreach ($items as &$it){
        $el = &$it;
        $map[$it['id']] = &$it;
    }  //数据的ID名生成新的引用索引树
    foreach ($items as &$it){
        $parent = &$map[$it[$pid]];
        if($parent) {
            $parent['children'][] = &$it;
        }else{
            $tree[] = &$it;
        }
    }
    return $tree;
}

// 例子
$arr = [
['id' => 1, 'name' => 'A1', 'parentId' => 0],
    ['id' => 2, 'name' => 'A1-B1', 'parentId' => 1],
    ['id' => 3, 'name' => 'A1-B2', 'parentId' => 1],
    ['id' => 4, 'name' => 'A1-B2-C1', 'parentId' => 3],
    ['id' => 5, 'name' => 'B1', 'parentId' => 0],
    // ...
    ];
    var_dump(_arrToTree($arr));
    // 结果
array(2) {
  [0]=>
  array(4) {
    ["id"]=>
    int(1)
    ["name"]=>
    string(2) "A1"
    ["parentId"]=>
    int(0)
    ["children"]=>
    array(2) {
      [0]=>
      array(3) {
        ["id"]=>
        int(2)
        ["name"]=>
        string(5) "A1-B1"
        ["parentId"]=>
        int(1)
      }
      [1]=>
      array(4) {
        ["id"]=>
        int(3)
        ["name"]=>
        string(5) "A1-B2"
        ["parentId"]=>
        int(1)
        ["children"]=>
        array(1) {
          [0]=>
          array(3) {
            ["id"]=>
            int(4)
            ["name"]=>
            string(8) "A1-B2-C1"
            ["parentId"]=>
            int(3)
          }
        }
      }
    }
  }
  [1]=>
  array(3) {
    ["id"]=>
    int(5)
    ["name"]=>
    string(2) "B1"
    ["parentId"]=>
    int(0)
  }
}
```
