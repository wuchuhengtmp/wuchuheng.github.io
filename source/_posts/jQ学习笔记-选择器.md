---
layout: layout
title: 【前端】jQ学习笔记-选择器
date: 2018-05-10 20:23:30
categories: 前端
tags: javascript
toc: true
---
多节点选中
--
``` html
<script src='/libery/static/js/jquery-3.3.1.min.js'></script>
<div class='demo1'>
    输入框1:<input type='text' class='input1' value='输入框1' /><br>
    输入框2:<input type='text' class='input2' value='输入框2' /><br>
    输入框3:<input type='text' class='input3' value='输入框3' /><br>
    根据选项框选中状态:<select>
        <option>1</script>
        <option>2</script>
        <option>3</script>
    </select><br>
    选中单选的节点:
        男:<input type='radio' name='sex' checked='checked' value='1' />
        女:<input type='radio' name='sex' value='0' />
        选中结果:<span class='result'></span>
    </br>
    <button>修改输入框1,3</button>
    <button>修改全部输入框</button>
    <button>选中框选中第3个选项</button>
</div>
<script type='text/javascript' charset='utf-8'>
    //节点选中
    $('.demo1 button:first').click(function(){
        $('.input1,.input3').val('你已点击第一个按钮');
    });
    //子节点选中
    $('.demo1 button').eq(1).click(function(){
        $(".demo1 input[type='text']").val('你已经点击第二个按钮');
    });
    //状态节点选中
    $('.demo1 select').change(function(){
        var currentNode = $('.demo1 select option:selected');
        currentNode.text('修改当前选中项');
    });
    //修改选中框选中状态
    $('.demo1 button').eq(2).click(function(){
        $('.demo1 select option').attr('selected',true);
    })
    //选中单选的节点
    $('.demo1 input[type=radio]').change(function(){
        var text = $('.demo1 input[type=radio]:checked').val();
        $('.result').text(text);
    })
</script>
```
<!--more-->
运行结果:  
--
<script src='/library/static/js/jquery-3.3.1.min.js'></script>
<div class='demo1'>
    输入框1:<input type='text' class='input1' value='输入框1' /><br>
    输入框2:<input type='text' class='input2' value='输入框2' /><br>
    输入框3:<input type='text' class='input3' value='输入框3' /><br>
    根据选项框选中状态:<select>
        <option>1</script>
        <option>2</script>
        <option>3</script>
    </select><br>
    选中单选的节点:
        男:<input type='radio' name='sex' checked='checked' value='1' />
        女:<input type='radio' name='sex' value='0' />
        选中结果:<span class='result'></span>
    </br>
    <button>修改输入框1,3</button>
    <button>修改全部输入框</button>
    <button>选中框选中第3个选项</button>
</div>
<script type='text/javascript' charset='utf-8'>
    //节点选中
    $('.demo1 button:first').click(function(){
        $('.input1,.input3').val('你已点击第一个按钮');
    });
    //子节点选中
    $('.demo1 button').eq(1).click(function(){
        $(".demo1 input[type='text']").val('你已经点击第二个按钮');
    });
    //状态节点选中
    $('.demo1 select').change(function(){
        var currentNode = $('.demo1 select option:selected');
        currentNode.text('修改当前选中项');
    });
    //修改选中框选中状态
    $('.demo1 button').eq(2).click(function(){
        $('.demo1 select option').attr('selected',true);
    })
    //选中单选的节点
    $('.demo1 input[type=radio]').change(function(){
        var text = $('.demo1 input[type=radio]:checked').val();
        $('.result').text(text);
    })
</script>




