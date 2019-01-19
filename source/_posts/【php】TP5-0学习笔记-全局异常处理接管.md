---
layout: layout
title: 「php」TP5.0学习笔记-全局异常处理接管
tags: TP5.0
category: php
date: 2018-06-11 17:03:48
---
#### 1. 说明
&emsp; 感谢做微信小程序的那位(抱歉，忘记他的名字了)基于TP5.0给我演示全局异常处理的AOP编程思想。顾名思义，全局异常处理就是程序抛出异常后统一在一个地方处理。这样做的好处就是当程序出现异常时不用写大量重复的代码来，减少代码的数量，减少维护成本。
&emsp;其实很简单官方文档也写了，无非就3步：1，在一个地方写好异常处理的类;2，把类的路径写入配置文件中;3，抛出异常或者代码运行错误就会去执行这个类。
<!--more-->

-----

#### 2.好，开干！ 
##### 2.1 先写用于处理异常的类
``` bash
$ php think build --module lib #TP5.0的根目录新建一个lib模块
$mkdir application/lib/exception ; 
$ vim application/lib/exception/ExceptionHandle.php ; #编辑自定义异常类
```
``` php
<?php
/**
 *用于自定义异常处理
 */
 
namespace app\lib\exception;

use think\exception\Handle;
use Exception; //引入php内置抛出类
use think\Request;
use think\Log;
use think\Config;
use app\lib\exception\BaseException; //引入自定义错误类
class ExceptionHandle extends Handle
{
    private $code;
    private $msg;
    private $errorCode;
    private $url;
    /**
     *当配置好后，TP5.0的错误作息会在这个方法中处理
     *@return mix
     */
    public function render(\Exception $e) 
    {
    		//判断抛出的错误是否自定义，是不返回自定义错误信息
        if($e instanceof BaseException){ 
            $this->code = $e->code;
            $this->msg = $e->msg;
            $this->errrorCode = $e->errorCode;
        }else{
            if(Config::get("app_debug")){
                return parent::render($e); //返回tp5内置异常,用于服务器调试用。
            }else{
                $this->code = 500;
                $this->msg  = "服务器内部错误，不能告诉你";
                $this->errorCode = 999;
                $this->recordErrorLog($e);
            }
        }
        $url = (Request::instance())->url();
        $result =  [
            "msg" => $this->msg,
            "code" => $this->code,
            "requestURL" => $url
        ];
       return json($result,$this->code);
    }
    /*
     *将异常写入日志
     *
     */
    private function recordErrorLog(\Exception $e)
    {
        Log::init([
            "type" => "File",
            "path" => LOG_PATH,
            "level"     => ["error"]
         ]);
       Log::record($e->getMessage(), "error");
    }

}

```
``` php
<?php
/**
 *用配置错误信息的基类
 *
 */
namespace app\lib\exception;
use think\Exception; //引入TP5.0异常类
class BaseException extends Exception
{
    public $code = 400;
    public $msg  = "参数错误";
    public $errorCode = 10000;

    public function __construct($params=[])
    {
        if(!is_array($params)){
            return;
        }
        if(array_key_exists('code',$params))
        {
            $this->code = $params['code'];
        }
        if(array_key_exists('msg',$params))
        {
            $this->msg = $params['msg'];
        }
        if(array_key_exists('errorCode',$params))
        {
            $this->errorCode = $params['errorCode'];
        }
    }
}

```
``` php
<?php
/**
 *定义错误参数类
 *
 */
namespace app\lib\exception;
use app\lib\exception\BaseException;
class BannerMissException extends BaseException
{
    public $code = 404;
    public $msg  = "Banner不存在";
    public $errorCode = 40000;
}

```
##### 2.2 配置配置文件
框架支持异常页面由开发者自定义类进行处理，需要配置参数`exception_handle`
``` php
// 异常处理handle类 留空使用 \think\exception\Handle
'exception_handle'       => '\\app\lib\exception\\ExceptionHandle',

```

##### 2.3 好了，可以进行抛出了
``` php
	throw new \app\lib\exception\BannerMissException();
   //也可以修改下参数
   throw new \app\lib\exception\BannerMissException([
   		'code'=>1,
       'msg'=>2,
       'errorCode'=>3
   ]);
   
```

#### 3.总结
&emsp;这个异常抛出有2种情况。一种是代码自己的异常，默认的错误信息`['code'=>500,'msg'=>'服务器内部错误，不能告诉你','errorCode'=>999]`,一种是主动抛出的。如`throw new \app\lib\exception\BannerMissException();` 。它的这个执行机制是，把一个类比如`BannerMissException`抛出后，由自定义异常类判断是否是属于其基类`BaseException`的这种异常的错误信息格式，如果是，就抛出`BannerMissException`的错误信息，如果不是，就抛出默认的错误信息`['code'=>500,'msg'=>'服务器内部错误，不能告诉你','errorCode'=>999]`。
&emsp;这种情况，TP5.0手册都有写的，可以查看 https://www.kancloud.cn/manual/thinkphp5/126075 。
