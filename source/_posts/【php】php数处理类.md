---
layout: layout
title: 【php】php数处理类
author: 吴楚衡
date: 2018-08-09 12:44:38
tags:
---
``` php

/**
 * @info     在指定的范围内，指定输出数量中，输出指定的数以及相邻的几个数字
 * @return 	  string
 *
 */
 function generateList()
    {

        $currentPage = 10; //当前数字
        $total       =  100; //数字的范围
        $uplimit    = 5;//游标容量上限,多少个值
        $limit      = $total >= $uplimit ? $uplimit : $total;
        $centerLimit  = floor($limit/2); //游标中心
        $pageListHtml = $currentPage;
        $frontPageNum = 0;
        $backPageNum  = 0;
        for($i=1;$i<=$limit;$i++){
            if($i <= $centerLimit && $currentPage > $i){
                //尝试向前游标
                $frontPageNum++;
                $front  = $currentPage - $frontPageNum;
                $pageListHtml = $front.','.$pageListHtml;
            }else{
                $backPageNum++;
                //尝试向后游标
                $back   = $currentPage + $backPageNum;
                $pageListHtml .= ','.$back;
            }
        }
        return $pageListHtml;

    }

```
