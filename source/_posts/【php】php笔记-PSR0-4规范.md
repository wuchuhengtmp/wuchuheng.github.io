---
layout: layout
title: 「php」php笔记-PSR[0-4]规范(转载)
date: 2018-11-28 21:28:46
categories: 
  - php
keywords: 
  - php规范
  - php代码规范
  - PSR0-4
tags: 
    - php
    - PSR规范
---


`PHP`是世界上最伟大的语言，这一点是毋庸置疑的吧。哈哈哈哈哈哈 。这个霸气的开头不错！(^__^)

但是正是因为伟大，所以用的人也就多了，人一多，再牛逼再伟大的东西，都会产生问题，逐渐就造成了很多的分歧。每个人的习惯不一样，所以在一些`PHP`语法上的一些表现也是千差万别，比如这些问题：

> `function` 函数名是否驼峰命名，
> 花括号{}是否换行写，
> 是该写注释呢还是不写
> 变量名是大写还是小写，
> 一个php文件中是一个类好还是允许有多个
------

<!--more-->

等等一系列的问题，接踵而至，你说你的这种方式屌，我说你傻逼啊我的才好。所以。各种争执声此起彼伏。
特别是当你去接手上任留下的坑的时候，如果你有自己的规范或者你是处女座，你就会骂死那个狗日的一万遍了，每改一次就会改一遍骂：“麻痹的写的都是什么狗shit烂代码啊”。所以，在`PHP`程序员的心中一个共有的心愿诞生了：“能不能他妈的大家都遵守同一规范啊”。
好，既然大家都有共同的心声，那么这样一个的公共的规范就出来了，他就是`PSR-[0-4]`规范，它出来后，大家都觉得挺不错的啊，还蛮符合自己的书写风格的，渐渐的大家都知道了它，也慢慢的接受了它，越来越多的人知道了它，一些大牛的项目都慢慢的遵守了这个规范，然后也一帮菜鸟一看大牛都在用这个规范，我为啥不也尝试着规范一下呢？
所以，渐渐的`PSR-[0-4]`规范成为了`PHP`的一个王牌规范，你写`PHP`就最好必须按照这里面的规范写，全球共享好代码。



## PHP-FIG
在说啥是`PSR-[0-4]`规范的之前，我觉得我们有必要说下它的发明者和规范者：`PHP-FIG`，它的网站是：www.php-fig.org。就是这个联盟组织发明和创造了PSR-[0-4]规范，膜拜吧，屌丝们！

FIG 是 Framework Interoperability Group（框架可互用性小组）的缩写，由几位开源框架的开发者成立于 2009 年，从那开始也选取了很多其他成员进来，虽然不是 “官方” 组织，但也代表了社区中不小的一块。组织的目的在于：以最低程度的限制，来统一各个项目的编码规范，避免各家自行发展的风格阻碍了程序设计师开发的困扰，于是大伙发明和总结了`PSR`，`PSR`是Proposing a Standards Recommendation（提出标准建议）的缩写，截止到目前为止，总共有5套PSR规范，分别是：

> PSR-0 (Autoloading Standard) 自动加载标准 
> PSR-1 (Basic Coding Standard) 基础编码标准 
> PSR-2 (Coding Style Guide) 编码风格向导 
> PSR-3 (Logger Interface) 日志接口 
> PSR-4 (Improved Autoloading) 自动加载的增强版，可以替换掉PSR-0了。
------

接下来的篇目，我们会针对这5套，深入了解下。仔细学习下受万千`PHPer`热捧的这5套规范到底有啥出众之处。

## 0.0 PSR-0 规范
PRS-0规范是他们出的第1套规范，主要是制定了一些自动加载标准（Autoloading Standard），如果你英文比较好，可以直接看官网的这个：PSR-0，很短。我们打开PSR-0的主页时，发现多了一个警告：

> Deprecated - As of 2014-10-21 PSR-0 has been marked as deprecated. PSR-4 is now recommended as an alternative.
------

大概意思：

>不推荐使用 - 在2014年10月21日PSR-0已被标记为过时。PSR-4现在推荐作为替代。
------

那么也就是说PSR-0已！经！过！时！了！，别哭，`PHP`代码狗。虽说已经过时，但是我们也可以看看嘛，这不影响我们的学习，好了。废话不说了，开始吧：
PSR-0强制性要求几点：

> * 一个完全合格的namespace和class必须符合这样的结构：“\< Vendor Name>(< Namespace>)*< Class Name>”
> * 每个namespace必须有一个顶层的namespace（"Vendor Name"提供者名字）
> * 每个namespace可以有多个子namespace
> * 当从文件系统中加载时，每个namespace的分隔符(/)要转换成 DIRECTORY_SEPARATOR(操作系统路径分隔符)
> * 在类名中，每个下划线(_)符号要转换成DIRECTORY_SEPARATOR(操作系统路径分隔符)。在namespace中，下划线(_)符号是没有（特殊）意义的。
> * 当从文件系统中载入时，合格的namespace和class一定是以 .php 结尾的
> * verdor name,namespaces,class名可以由大小写字母组合而成（大小写敏感的）
------

是不是有点看不懂啊。什么namespace啊，什么autoloading啊。所以，如果你对命名空间还不是特别懂的话，可以google下namespace 和 自动加载相关的php知识。或者看下一篇，我专门来讲讲他们：namespace 和 autoloading
好，我们接着一条条举例来分析下：

### 0.1 第1条
比如我的文件 /Doctrine/Common/IsolatedClassLoader.php 这样子的一个类文件，那么你的namespace命名就必须声明称这样：


> 声明：namespace  \Doctrine\Common\
> 调用：\Doctrine\Common\IsolatedClassLoader
------
其中，Doctrine 表示一个模块目录 Vendor name, common就是namesapce, IsolatedClassLoader是class name。这样一看就知道这个文件的目录层次，一目了然。
再比如：/path/to/project/lib/vendor/Symfony/Core/Request.php 文件：

> 声明：namespace \Symfony\Core
> 调用：\Symfony\Core\Request
------

### 0.2-0.3 第2，3条
``` php
namespace \Zend\Acl => /path/to/project/lib/vendor/Zend/Acl.php
namespace \Zend\Mail\Message => /path/to/project/lib/vendor/Zend/Mail/Message.php
```
必须有一个顶级的zend的namespace, zend 下面可以有message子命名空间。

### 0.4 第4条
看这个例子，我们需要new 一个这样的类
``` php
new \Symfony\Core\Request
```
那么我再加载这个类文件时候，就要将分隔符 \ 转换成 目录，也就是去 Vendor -> Symfony->Core->Request.php 一层层的目录找到这个文件。其实也就是和第1,2,3是反过来的对应关系。

### 0.5 第5条
第5条是说`namespace`命名中的这个_ 符号 没有任何用处，就是用来表示目录分隔符的，但是注意在PRS-4中已经取消了这个_ ，那么我们还是看一下，这个过时的规定是怎么样的：
``` php
\namespace\package\Class_Name => /path/to/project/lib/vendor/namespace/package/Class/Name.php
\namespace\package_name\Class_Name => /path/to/project/lib/vendor/namespace/package_name/Class/Name.php
```
以上2个namespace中的 _ 其实是目录分隔符。并不是class name就是那样的。现在PSR-4出来后，确实觉得这样的规定有点不好。怪怪的。

### 0.6 第6条
第6条不用多说。既然你用`php`，文件名当然是得用`.php` 后缀结尾。这个规定的原因，我大致猜一下，估计是有人用 `.php3` 后缀的。好吧。这个是个神话了。因为在apache的配置文件中是允许的：
``` apache
<IfModule dir_module>
    DirectoryIndex index.php index.php3 index.html index.htm
</IfModule>
```
所以，老老实实的用.php作为后缀名吧。

### 0.7 第7条
文件大小写的问题，这个其实是很重要的。因为Linux系统下是区分文件名和目录名大小写的，而在Windows下是不区分的。所以就会经常出现问题，比如：
``` php
namespace  \Doctrine\Common\IsolatedClassLoader
```
在Linux下就去严格按照大小写去找目录和文件了。但是如果你在Windows下开发，全是小写也不会报错，你一发布到Linux上就悲剧了，提示找不到文件。所以，大小写太重要了。

## 1.0 PSR-1 规范
还是那句话，如果你英文比较好，可以直接看官网的这个：PSR-1，也不长，基本能看懂。但是如果你英语不好，那么还是请继续往下看

> -` PHP`源文件必须只使用 <?php 和 <?= 这两种标签
> - 源文件中php代码的编码格式必须是不带字节顺序标记(BOM)的UTF-8。
> - 一个源文件建议只用来做声明（类(class)，函数(function)，常量(constant)等）或者只用来做一些引起副作用的操作（例如：输出信息，修改.ini配置等），但不建议同时做这两件事。
> - 命名空间(namespace)和类(class) 必须遵守PSR-0标准。
> - 类名(class name) 必须使用骆驼式(StudlyCaps)写法 (注：驼峰式(cameCase)的一种变种，后文将直接用StudlyCaps表示)。
> - 类(class)中的常量必须只由大写字母和下划线(_)组成。
> - 方法名(method name) 必须使用驼峰式(cameCase)写法。
------
好，就是上面的基本7大点，有些很简单，就不过多说明，第3点需要仔细说下。

### 1.1 第1条
这个基本都是大家都懂得的，`PHP`代码必须只使用长标签`(<?php ?>)`或者短输出式标签`(<?= ?>)`；而不要使用其他标签。
之所以说这个，是因为我们在学习`PHP`的时候，一般的教材都告诉我们说，php有4种标记风格：`php`的4种标记风格 所以，很多人就乱来了。特别是`asp`风格的兼职是折磨好么！！！

### 1.2 第2条
这个不多说，保存的时候格式必须是`无BOM的UTF-8`格式，否则会出现很多无法解释的千奇百怪的问题。千万别傻逼的用Windows下的text文本编辑器保存文件啊

### 2.3 第3条
这个通俗的说呢。就是别把一些输出和修改的操作(副作用) 和 类文件混合在一起，专注一点，这个文件专门来声明`Class`, 那个文件专门来修改配置文件，别混在一起写：
所以，以下的这个文件是有问题的，最好不要这样：
``` php
// 副作用：修改了ini配置
ini_set('error_reporting', E_ALL);
 
// 副作用：载入了文件
include "file.php";
 
// 副作用：产生了输出
echo "<html>\n";
 
// 声明 function
function foo()
{
    // 函数体
}
```
你看上面看起来多乱啊。最好全部分开来写:
``` php
namespace Lib;
 
class Name
{
    public function __construct()
    {
        echo __NAMESPACE__ . "<br>";
    }
 
    public static function test()
    {
        echo __NAMESPACE__ . ' static function test <br>';
    }
}
```
*修改ini:*
``` php
ini_set('error_reporting', E_ALL);
```
*require 文件：*
``` php
require DIR . '/loading.php';
spl_autoload_register("\\AutoLoading\\loading::autoload");
```
你看是不是整齐好看多了。当然这个是很难约束的。自己仔细划分。

### 1.4 第4条
第4条是约束namespace的，前面已经说过，不多说。值得说的是名字要是驼峰方式来

### 1.5 第5条
class name必须要用驼峰方式写，驼峰又分小驼峰和大驼峰（小驼峰是第一个字母是小写）这样写看着舒服也比较规范，不做要求，反正是驼峰就可以了。我喜欢用小驼峰：
``` php
class getUserInfo
{


}
```
### 1.6 第6条
是规定类中的常量名(const)声明必须要全部大写，如果有多个单词，就用_分开：
``` php
class getUserInfo
{
    // 全部大写
    const NAME = 'phper';

    // 用_隔开
    const HOUSE_INFO = '已经深圳买房';

    public function getUserName()
    {
        //
    }
}
```
### 第7条
method name必须要用驼峰方式写，大小驼峰都可以，不做要求，我喜欢用小驼峰：
``` php
class getUserInfo
{
    public function getUserName()
    {
        //
    }
}
```
## *PRSR-2 规范*
`PSR-2` 规范的官网链接在此：`PSR-2` 这一规范主要是约束代码风格的，可是说是所有里面最关键最重要的，也是需要好好规范和共同遵守的。
我们一个个来看下，只能我大略的写一些比较重要的，或者说平时用的最多的。
### 2.1 源文件
> - 文件末尾必须空一行。
> - 必须使用Unix LF(换行)作为行结束符。
> - 纯PHP代码源文件的关闭标签?>必须省略。
------

第3点其实是蛮重要的，我之前还老写闭合，现在不写了。这可以避免在 `PHP` 结束标记之后万一意外加入了空格或者换行符，会导致 PHP 开始输出这些空白，而脚本中此时并无输出的意图。

### 2.2 缩进
必须使用4个空格来缩进，不能使用`Tab`键。当然你如果把Tab在编辑器里手动设置为4个空格也可以。这样的目的是因为：每个人的机器上的Tab键都不一样，有些是4个空格，有些是8个空格，在你的机器上看着很爽的代码，在别人机器上了就各种恶心了。所以，统一搞成4个空格，不管在哪里打开都是美观的。

### 2.3 行
一行推荐的是最多写80个字符，多于这个字符就应该换行了，一般的编辑器是可以设置的。

### 2.4 关键字和 True/False/Null
`php`的关键字，必须小写，`boolean`值：`true`，`false`，`null `也必须小写
下面是`php`的`keyword`，必须小写。
> '__halt_compiler', 'abstract', 'and', 'array', 'as', 'break', 'callable', 'case', 'catch', 'class', 'clone', 'const', 'continue', 'declare', 'default', 'die', 'do', 'echo', 'else', 'elseif', 'empty', 'enddeclare', 'endfor', 'endforeach', 'endif', 'endswitch', 'endwhile', 'eval', 'exit', 'extends', 'final', 'for', 'foreach', 'function', 'global', 'goto', 'if', 'implements', 'include', 'include_once', 'instanceof', 'insteadof', 'interface', 'isset', 'list', 'namespace', 'new', 'or', 'print', 'private', 'protected', 'public', 'require', 'require_once', 'return', 'static', 'switch', 'throw', 'trait', 'try', 'unset', 'use', 'var', 'while', 'xor'
------

### 2.5 命名空间(Namespace)和导入(Use)声明
先简单文字描述下：
- 命名空间(`namespace`)的声明后面必须有一行空行。
- 所有的导入(`use`)声明必须放在命名空间(`namespace`)声明的下面。
- 一句声明中，必须只有一个导入(`use`)关键字。
- 在导入(`use`)声明代码块后面必须有一行空行。
*用代码来说明下：*  

``` php
<?php
namespace Lib\Databases; // 下面必须空格一行

class Mysql
{

}
```

*`namespace`下空一行，才能使用`use`，再空一行，才能声明`class`*

``` php 
<?php
namespace Lib\Databases; // 下面必须空格一行
 
use FooInterface; // use 必须在namespace 后面声明
use BarClass as Bar;
use OtherVendor\OtherPackage\BazClass; // 下面必须空格一行
 
class Mysql
{
    //
}
```

### 2.6 类(`class`)，属性(`property`)和方法(`method`)
（1）、继承(`extends`) 和实现(`implement`) 必须和 `class` `name` 写在一行，切花括号要换行写。
``` php
<?php
namespace Lib\Databaes;
 
class Mysql extends ParentClass implements \PDO, \DB // 写一行
{ // 换行写{
     
}
```
（2）、属性(`property`)必须声明其可见性，到底是 `public` 还是 `protected` 还是 `private`，不能省略，也不能使用`var`, `var`是`php`老版本中的什么方式，等用于`public`。
``` php
<?php
namespace Lib\Databaes;
 
class Mysql extends ParentClass implements \PDO, \DB // 写一行
{
    public $foo = null;
    private $name = 'yangyi';
    protected $age = '17';
}
```

（3）、方法(method)，必须声明其可见性，到底是public还是protected还是private，不能省略。并且，花括号{必须换行写。如果有多个参数，第一个参数后紧接,,再加个空格，且函数name和(之间必须要有个空格：`function_name($par,$par2,$pa3)`,如果参数有默认值，也要用左右空格分开。
``` php
<?php
namespace Lib\Databaes;
 
class Mysql extends ParentClass implements \PDO, \DB // 写一行
{
    public getInfo ($name, $age, $gender = 1) // 函数名getInfo和(之间有个空格，参数之间也要有空格。默认参数也要左右都有空格
    { // 必须换行写 {
    }
}
```

（4）、当用到抽象(`abstract`)和终结(`final`)来做类声明时，它们必须放在可见性声明 （`public` 还是`protected`还是`private`）的前面。而当用到静态(`static`)来做类声明时，则必须放在可见性声明的后面。
*直接上代码：*
``` php
<?php
namespace Vendor\Package;

abstract class ClassName
{
    protected static $foo; // static放后面

    abstract protected function zim(); // abstract放前面

    final public static function bar() // final放前面，static放最后。
    {
        // 方法主体部分
    }
}

```
### 2.7 控制结构
*控制接口，就是 `if else while switch`等。这一类的写法规范也是经常容易出现问题的，也要规范一下*
``` php 
<?php
if ($expr1) { // 左右空格
    // if body
} elseif ($expr2) { // elesif 连着写
    // elseif body
} else {
    // else body;
}
```
*（2）、switch，case 注意左右空格和换行，还是直接上规范代码*
``` php 
<?php
switch ($expr) { // 左右空格
    case 0:
        echo 'First case, with a break'; // 对齐
        break; // 换行写break，也对齐。
    case 1:
        echo 'Second case, which falls through';
        // no break
    case 2:
    case 3:
    case 4:
        echo 'Third case, return instead of break';
        return;
    default:
        echo 'Default case';
        break;
}

```
*（3）、`while`，`do` `while` 的写法也是类似，要左右空格，上代码：*
``` php
<?php
while ($expr) { // 左右空格
    // structure body
}
 
do {
    // structure body; // 左右空格
} while ($expr);

```
*（4）、`for`的写法*
``` php
<?php
for ($i = 0; $i < 10; $i++) { // 注意几个参数之间的空格
    // for body
}

```
*（5）、`foreach` 的写法*
``` php
<?php
foreach ($iterable as $key => $value) { // 还是空格问题
    // foreach body
}
```
 *（6）、`try catch`的写法*
 ``` php
 <?php
try {
    // try body
} catch (FirstExceptionType $e) { // 同样也是注意空格。
    // catch body
} catch (OtherExceptionType $e) {
    // catch body
}
 ```
基本用到的就是这些了，其他什么闭包啥的用的不多就不过多的累述了。


## 3.0 `PSR-3 `规范
PSR-3规范主要是来规范日志接口(Logger Interface)的，老实讲，其实平常接触的不是特别多，所以就不说了，可以去看官网的  
[PSR-3](http://www.php-fig.org/psr/psr-3/)

## `PSR-4 `规范
`PSR-4`规范是刚出没多久的一条新的规范，它也是规范 自动加载(`autoload`)的，是对`PSR`-0的修改，属于补充规范，
> - 我简单说下，主要是以下几点： 
> - 废除了PSR-0中_就是目录分割符的写法，_下划线在完全限定类名中是没有特殊含义了。 
> - 类文件名要以 .php 结尾。 
> - 类名必须要和对应的文件名要一模一样，大小写也要一模一样。
------

## 参考资料
[https://www.zybuluo.com/phper/note/65033](https://www.zybuluo.com/phper/note/65033)
[http://segmentfault.com/a/1190000000380008](http://segmentfault.com/a/1190000000380008)
[http://www.4wei.cn/archives/1002186](http://www.4wei.cn/archives/1002186)
[http://wenku.baidu.com/view/7a21e44b48d7c1c708a14577.html#10002-tsina-1-87843-e29b4784eda5d1f51fb0c2a97a15da08](http://wenku.baidu.com/view/7a21e44b48d7c1c708a14577.html#10002-tsina-1-87843-e29b4784eda5d1f51fb0c2a97a15da08)
[https://github.com/hfcorriez/fig-standards](https://github.com/hfcorriez/fig-standards)

声明：namespace  \Doctrine\Common\
调用：\Doctrine\Common\IsolatedClassLoader
