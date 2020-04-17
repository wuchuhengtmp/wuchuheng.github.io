layout: draft
title: 【php】laravel学习笔记-契约
author: 吴楚衡
tags:
  - laravel
  - 契约
categories:
  - php
date: 2020-02-26 02:33:00
---
### 1 什么是契约?
&emsp;什么是契约？为什么要用契约?契约能带来什么好处？  
&emsp;契约其实就是`DI`依赖注入的注入类的声明关系，它在`register`方法中声明了什么样的类型提示要注入时对应什么样的类？关于依赖注入不明白的可以参考[《【php】hyperf笔记-依赖注入》](/2020/02/03/【php】hyperf笔记-依赖注入/)的说明。  
&emsp;为什么要用契约?契约能带来什么好处？  
&emsp; 上面说了，依赖注入是根据类型提示符来注入对应的类，如果在程序中各个地方使用这种（实际上laravel只能在控制器能使用依赖注入）基于提示符来注入依赖，哪天要修改替换为哪一个类时也只需要修改类型提示符关联的类就行了，从使所以的通过依赖注入的实例都生效。还有由于依赖注的实例统一在一个地方生成的，可以进行干预处理，从而影响到全局的程序，也就是面向切面(AOP);  
&emsp;而用契约能使代码看起更明确，更统一。

<!--more-->

### 2 示例代码


#### 2.1 订单服务类

``` php

<?php
namespace App\Http\Service;

use EasyWeChat\Factory;
use App\Model\{
    CaseOrder as CaseOrderModel,
    PayTimes as PayTimesModel
};
use App\Model\Cases as CasesModel;
use Illuminate\Support\Facades\Storage;

class  CaseOrder extends Base
{
	  /**
     * 分期表
     *
     */
    public function getPayTimesById($order_id)
    {
        $PayTimes = (new PayTimesModel())->where('order_id', $order_id)
            ->get()
            ->makeHidden(['created_at', 'updated_at', 'order_id']);
        return $PayTimes->toArray();

    }

}
```

#### 2.2 声明依赖

``` php
<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Http\Service\{
    CaseOrder  as CaseOrderService
};

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        // 契约注册 提示符 对应类
        $this->app->bind(CaseOrderService::class, CaseOrderService::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}

```

#### 2.3 控制器使用

``` php
<?php

namespace App\Http\Controllers\Api;

use App\Http\Service\{
    CaseOrder as CaseOrderService
};

class CaseOrderController extends Controller
{
    

    /**
     * 分期表
     *
     */
    public function payTimesIndex(CaseOrderService $CaseOrderService)
    {
        $pay_times_list = $CaseOrderService->getPayTimesById($Request->id);
        return $this->responseSuccessData($pay_times_list);
    }
}
```
