title: 【laravel】dingo api自定义异常格式
author: 吴楚衡
tags:
  - laravel
  - dingo
categories:
  - php
date: 2019-12-04 01:14:00
---
#### dinggo api 自定义异常格式
在`app/Pviders/AppServiceProvider`的`register`方法加入.
``` php 
\API::error(function (\Illuminate\Validation\ValidationException $exception){
  $data =$exception->validator->getMessageBag();
   $msg = collect($data)->first();
   if(is_array($msg)){
     $msg = $msg[0];
   }
   return response()->json(['message'=>$msg,'status_code'=>400], 200);
 });
 \API::error(function (\Dingo\Api\Exception\ValidationHttpException $exception){
   $errors = $exception->getErrors();
   return response()->json(['message'=>$errors->first(),'status_code'=>400], 200);
 });
```