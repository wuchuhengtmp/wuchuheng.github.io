---
layout: layout
title: 【php】php数据验证类
date: 2018-05-23 17:02:34
category: php
tags: php算法
---

```php
class validate
{

    /**
     *校对上次数据是当前参数一致
     *@param unknown param
     *@return boolean
     *@注：当前的session命名有问题，当另外的方法调用时会出现判
     断不正确，应该结合如debug_stack()来定义唯一的变量名称
     */
    public function isNewParam($param)
    {
        if($_SESSION['prevData'] !== $param OR empty($_SESSION['prevData'])) {
            $_SESSION['isNewParam'] = true;
        }else{
            $_SESSION['isNewParam'] = false;
        }
        $_SESSION['prevData'] = $param;
        if($_SESSION['isNewParam'] === false) {
            return false; 
        }else{
            return true;
        }
    }

}
```
