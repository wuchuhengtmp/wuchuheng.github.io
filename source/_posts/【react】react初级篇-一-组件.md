layout: draft
title: 【react】react初级篇(一)-组件
author: 吴楚衡
tags:
  - react
categories:
  - react
date: 2020-08-17 17:19:00
---
![](https://qiniu.wuchuheng.com/images/logo-og.png)

### 1 什么是`react`?
&emsp;`react` 是一个`UI`库，能把数据绑定到页面上并实时渲染出来-这就是`react`的核心。  
&emsp;相对于通过原生的`DOM`对象的来修改数据和事件的绑定，往往很繁琐且事件失效重新绑定的问题，为了解决这2个问题，`react`在内存生成虚拟`DOM`，然后事件的绑定和数据的渲染都直接反映到虚拟`DOM`上，而虚拟`DOM`的修改再反映到真实的浏览器`DOM`对象上上。这样带来的好处就是，开发者需要的事件在`DOM`显式绑定，需要的更改在`DOM`显式绑定且不用去关心原生带的绑定繁琐和事件失效的问题。 
&emsp; 从`MVC`软件模式的角度来看，视图层为数据的渲染和事件的触发，控制层则对事件触发的处理，模型层对数据的`CURD`处理。`react`的虚拟`DOM`使用`V`层成立，按`MVC`模式也就能开发更复杂和更大型的应用。
<!--more-->

#### 2 什么是组件?
&emsp;一个复杂的页面可以分割成若干个简单的部分。这些部分有自己的样式、数据和处理逻辑，这些称为组件。再把这些组件合并起来就是原来的复杂页面了。 

### 2 脚手架初始化

#### 2.1 新建空项目（`typescript`）

``` bash
$  npx create-react-app my-app --typescript 
```

#### 2.2 配置样式预处理器`less`(可选）

##### 2.2.1 安装`less`的`webpack`转译器和`less`

``` bash
$ yarn add less less-loader -D
```

#### 2.2.2 弹出`webpack`的配置并修改打包配置使`less`生效
``` bash
$ yarn run reject
```
目录如下:
``` bash
.
├── README.md
├── config # <--- 弹出的webpack配置目录
├── node_modules
├── package.json
├── public
├── scripts
├── src
├── tsconfig.json
└── yarn.lock
```
要使用`less`生效需要在`config/webpack.config.js`配置3个地方
##### 2.2.2.1 配置style files regexes

``` javascript
...
// style files regexes
const cssRegex = /\.css$/;
const cssModuleRegex = /\.module\.css$/;
const sassRegex = /\.(scss|sass)$/;
const sassModuleRegex = /\.module\.(scss|sass)$/;
// 添加less配置
const lessRegex = /\.less$/;
const lessModuleRegex = /\.module\.less$/ 
...
```

##### 2.2.2.2  修改`getStyleLoaders`函数
``` javascript
...
  const getStyleLoaders = (cssOptions, lessOptions, preProcessor) => {
  ...
  {
        loader: require.resolve('css-loader'),
        options: cssOptions,
      },
      //  <!--config start-->
      　{
        loader: require.resolve('less-loader'),
        options: lessOptions,
      },
      // <!--config end-->
      ...
```
##### 2.2.2.3 模仿`sass`配置加入

``` javascript
                        {
              test: sassRegex,
              exclude: sassModuleRegex,
              use: getStyleLoaders(
                {
                  importLoaders: 3,
                  sourceMap: isEnvProduction && shouldUseSourceMap,
                },
                'sass-loader'
              ),
              // Don't consider CSS imports dead code even if the
              // containing package claims to have no side effects.
              // Remove this when webpack adds a warning or an error for this.
              // See https://github.com/webpack/webpack/issues/6571
              sideEffects: true,
            },
            {
              test: sassModuleRegex,
              use: getStyleLoaders(
                {
                  importLoaders: 3,
                  sourceMap: isEnvProduction && shouldUseSourceMap,
                  modules: {
                    getLocalIdent: getCSSModuleLocalIdent,
                  },
                },
                'sass-loader'
              ),
            },
            // <!--- less config start -->
                            {
              test: lessRegex,
              exclude: lessModuleRegex,
              use: getStyleLoaders(
                  {
                    importLoaders: 3,
                    sourceMap: isEnvProduction && shouldUseSourceMap,
                  },
                  'less-loader'
              ),
              sideEffects: true,
            },
            {
              test: lessModuleRegex,
              use: getStyleLoaders(
                  {
                    importLoaders: 3,
                    sourceMap: isEnvProduction && shouldUseSourceMap,
                    modules: {
                      getLocalIdent: getCSSModuleLocalIdent,
                    },
                  },
                  'less-loader'
              ),
            }, 
            ...
            
            // <!-- less config end -->
```

#### 2.2.3 加入`tslint`支持

``` bash
$ yarn add --dev typescript tslint tslint-config-prettier tslint-plugin-prettier tslint-react prettier
$ yarn add @types/node @types/react @types/react-dom @types/jest 
```

项目根目录添加`tslint.json`
``` json
{
  "extends": [
    "tslint:recommended",
    "tslint-react",
    "tslint-config-prettier"
  ],
  "rulesDirectory": [
    "tslint-plugin-prettier"
  ],
  "rules": {
    "prettier": true,
    "interface-name": false
  }
}
```
根目录添加`.prettierrc`
``` json
{
    "trailingComma": "es5",
    "printWidth": 100,
    "semi": false,
    "singleQuote": true
}
```

根目录`package.json` 添加
``` json
"scripts": {
    ...
    "tslint-check": "tslint-config-prettier-check ./tslint.json",
    "lint": "tslint -c tslint.json src/**/*.{ts,tsx} --fix --format verbose"
  },
```

注: `tslin` 参考自[github gist](https://gist.github.com/rimatla/a5a2c5dcf831c5744a656cfe81fadf52) 的配置 ,至于行不行，还没验证，如果没有问题的话，就加进试试


### 3 初始化组件
``` bash 
$ npx generate-react-cli component Test 

? Does this project use TypeScript? Yes
? Does this project use CSS modules? No
? Does this project use a CSS Preprocessor? less
? What testing library does your project use? Testing Library
? Set the default path directory to where your components will be generated in? src/pages
? Would you like to create a corresponding stylesheet file with each component you generate? Yes
? Would you like to create a corresponding test file with each component you generate? No
? Would you like to create a corresponding story with each component you generate? No
? Would you like to create a corresponding lazy file (a file that lazy-loads your component out of the box and ena
bles code splitting: https://reactjs.org/docs/code-splitting.html#code-splitting) with each component you generate
? No
The "generate-react-cli.json" config file has been successfully created on the root level of your project.

You can always go back and update it as needed.

Happy Hacking!


Stylesheet "Test.less" was created successfully at src/pages/Test/Test.less
Component "Test.tsx" was created successfully at src/pages/Test/Test.tsx

```
注: 函数式组件和类组件的定义和说明请参考《[官方文档-component and props](https://reactjs.org/docs/components-and-props.html)》

#### 3.1 组件的`props`

{% note warning %}
注: 组件的`props`官方文档《[官方文档-component and props](https://reactjs.org/docs/components-and-props.html)》有说明，这里进行下类型的补充
{%  endnote %}

``` typescript
import React from 'react'

interface testProps {
  timeString: string // <--- 指定组件参数名，类型为string
  timeStampNumber2: number // <--- 指定组件参数名可以有，类型为number

}

export default class Test2 extends React.Component<testProps, any> { // <--- 指定继承类型
  public constructor(props: testProps) { // <--- 指定传进来的组件参数类型约束
    super(props)
  }

  public render(): React.ReactNode {
    return (<React.Fragment> {this.props.timeString}  </React.Fragment>) // 以空标签的形式输出传入的参数
  }
}
```

### 4 组件的`state`
&emsp; 关于	

&emsp;以类组件来说明，`state`其实就是



