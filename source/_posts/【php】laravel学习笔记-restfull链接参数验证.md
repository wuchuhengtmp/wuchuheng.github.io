title: 【php】laravel学习笔记-表单验证
author: 吴楚衡
tags:
  - laravel
  - 表单验证
categories:
  - php
date: 2019-12-13 10:48:00
---
### 1 laravel restfull链接参数验证

#### 说明
{% note info %}
   链接的参数默认是不能参与请求类的验证的，但`restfull`风格的参数基本集成在链接上，这时是需要验证的
{% endnote %}

#### 环境参数

| 参数 | 说明 |
|---- | ---- |
|laravel 5.8 | 这个就不说明了|


<!--more-->

#### 开始

 生成请求文件, 命令行输入 ` php artisan make:request GenerateCreditPreOrder` :
 
``` php 
	<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GenerateCreditPreOrder extends FormRequest
{
    protected function validationData()
    {
        return $this->route()->parameters();
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [

        ];
    }
}

```

然后在类文件中加入
``` php 
    protected function validationData()
    {
        return $this->route()->parameters();
    }

```

方法来重写`validationData` 

* [解决思路来自](https://stackoverflow.com/questions/30238285/laravel-5-how-to-validate-route-parameters)

### 2 自己定义规则

&emsp;生成规则文件`php artisan make:rule GoodsMustbeExits`，会生成这个文件`App/Rules/GoodsMustbeExits` : 
``` php
<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class GoodsMustbeExits implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        // 
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return '//';
    }
}

```
其中`passes`方法用来定义处理的逻辑，返回 `boolean`，`message`方法则定义错误消息,`attribute`和`value` 为要验证的参数名和参数值。这是示例:
``` php
<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class GoodsMustbeExits implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $aop = $this->getAopInstance();
        $Goodes = Goods::where('id', $value)
            ->where('status', 1)
            ->get();
        return $Goodes->isEmpty() ? false : true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return '这个商品不存在';
    }
}

```

然后在请求层进行验证(`goods_id`为上传的参数)
``` php
<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\GoodsMustbeExits;

class GenerateCreditPreOrder extends FormRequest
{
    protected function validationData()
    {
        return $this->route()->parameters();
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'goods_id' => ['required', new GoodsMustbeExits()]
        ];
    }
}
```

















