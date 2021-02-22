layout: draft
title: 【前端】npm学习笔记—如何用ts创建npm包
author: 吴楚衡
tags:
  - npm
categories:
  - 前端
date: 2021-02-22 03:31:00
---
![](https://qiniu.wuchuheng.com/image/npm.png)

## 准备工作
* 一个`npm`账号，用来后面发布包用的，以及账号关联的邮件要认证通过，不然，包是不给发布上去的。这是[官网](https://www.npmjs.com/)
* 要有`node`环境和`npm`管理工具，这2个通常是一起的。且`npm`源只能是官方的，如果已经使用了别的镜像源，则运行`npm config delete registry`还原为官方默认源，才能确保包能发布出去。、

<!--more-->

## 1基本部分
&emsp;这个部分只说明一个`ts`包的基本能用的就行了的简化版包。
### 1.1 初始项目 
``` bash
$ mkdir jequest # 建立一个名为jequest的空目录
$ cd jequest/  # 进入这个空目录
$ jequest npm init -y #初始package.json文件
Wrote to /Users/wuchuheng/tmp/jequest/package.json:
{
  "name": "jequest",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```
### 1.2 添加`ts`依赖和配置`ts`配置文件
``` bash 
$ npm i -D typescript # 添加ts依赖
$ npx tsc --init      # 生成ts的配置文件
message TS6071: Successfully created a tsconfig.json file.
```
#### 1.2.1 在`tsconfig.json`添加`declaration": true`  
&emsp; 这个配置将把`ts`的类型导出到最后构建的js文件目录中名为`*.d.ts`文件，用于当这个包被调用时，这些导出的类型能提供接口约束。
#### 1.2.2 配置包的入口文件和类型声明
&emsp;在`package.json`加入:
``` json
...
"main": "dist/index.js",
"types": "dist/index.d.ts"
...
```
这个配置是在告诉包的消费者，包的入口文件和类型。

#### 1.2.3 修改`tsconfig.json`的配置和`ts`的构建
&emsp; 经过上面的`npx tsc --init`而生成的`tsconfig.json`配置
``` json
{
  "compilerOptions": {
    /* Visit https://aka.ms/tsconfig.json to read more about this file */

    /* Basic Options */
    // "incremental": true,                   /* Enable incremental compilation */
    "target": "es5",                          /* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019', 'ES2020', or 'ESNEXT'. */
    "module": "commonjs",                     /* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 'umd', 'es2015', 'es2020', or 'ESNext'. */
    // "lib": [],                             /* Specify library files to be included in the compilation. */
    // "allowJs": true,                       /* Allow javascript files to be compiled. */
    // "checkJs": true,                       /* Report errors in .js files. */
    // "jsx": "preserve",                     /* Specify JSX code generation: 'preserve', 'react-native', or 'react'. */
    // "declaration": true,                   /* Generates corresponding '.d.ts' file. */
    // "declarationMap": true,                /* Generates a sourcemap for each corresponding '.d.ts' file. */
    // "sourceMap": true,                     /* Generates corresponding '.map' file. */
    // "outFile": "./",                       /* Concatenate and emit output to single file. */
    // "outDir": "./",                        /* Redirect output structure to the directory. */
    // "rootDir": "./",                       /* Specify the root directory of input files. Use to control the output directory structure with --outDir. */
    // "composite": true,                     /* Enable project compilation */
    // "tsBuildInfoFile": "./",               /* Specify file to store incremental compilation information */
    // "removeComments": true,                /* Do not emit comments to output. */
    // "noEmit": true,                        /* Do not emit outputs. */
    // "importHelpers": true,                 /* Import emit helpers from 'tslib'. */
    // "downlevelIteration": true,            /* Provide full support for iterables in 'for-of', spread, and destructuring when targeting 'ES5' or 'ES3'. */
    // "isolatedModules": true,               /* Transpile each file as a separate module (similar to 'ts.transpileModule'). */

    /* Strict Type-Checking Options */
    "strict": true,                           /* Enable all strict type-checking options. */
    // "noImplicitAny": true,                 /* Raise error on expressions and declarations with an implied 'any' type. */
    // "strictNullChecks": true,              /* Enable strict null checks. */
    // "strictFunctionTypes": true,           /* Enable strict checking of function types. */
    // "strictBindCallApply": true,           /* Enable strict 'bind', 'call', and 'apply' methods on functions. */
    // "strictPropertyInitialization": true,  /* Enable strict checking of property initialization in classes. */
    // "noImplicitThis": true,                /* Raise error on 'this' expressions with an implied 'any' type. */
    // "alwaysStrict": true,                  /* Parse in strict mode and emit "use strict" for each source file. */

    /* Additional Checks */
    // "noUnusedLocals": true,                /* Report errors on unused locals. */
    // "noUnusedParameters": true,            /* Report errors on unused parameters. */
    // "noImplicitReturns": true,             /* Report error when not all code paths in function return a value. */
    // "noFallthroughCasesInSwitch": true,    /* Report errors for fallthrough cases in switch statement. */
    // "noUncheckedIndexedAccess": true,      /* Include 'undefined' in index signature results */

    /* Module Resolution Options */
    // "moduleResolution": "node",            /* Specify module resolution strategy: 'node' (Node.js) or 'classic' (TypeScript pre-1.6). */
    // "baseUrl": "./",                       /* Base directory to resolve non-absolute module names. */
    // "paths": {},                           /* A series of entries which re-map imports to lookup locations relative to the 'baseUrl'. */
    // "rootDirs": [],                        /* List of root folders whose combined content represents the structure of the project at runtime. */
    // "typeRoots": [],                       /* List of folders to include type definitions from. */
    // "types": [],                           /* Type declaration files to be included in compilation. */
    // "allowSyntheticDefaultImports": true,  /* Allow default imports from modules with no default export. This does not affect code emit, just typechecking. */
    "esModuleInterop": true,                  /* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies 'allowSyntheticDefaultImports'. */
    // "preserveSymlinks": true,              /* Do not resolve the real path of symlinks. */
    // "allowUmdGlobalAccess": true,          /* Allow accessing UMD globals from modules. */

    /* Source Map Options */
    // "sourceRoot": "",                      /* Specify the location where debugger should locate TypeScript files instead of source locations. */
    // "mapRoot": "",                         /* Specify the location where debugger should locate map files instead of generated locations. */
    // "inlineSourceMap": true,               /* Emit a single file with source maps instead of having a separate file. */
    // "inlineSources": true,                 /* Emit the source alongside the sourcemaps within a single file; requires '--inlineSourceMap' or '--sourceMap' to be set. */

    /* Experimental Options */
    // "experimentalDecorators": true,        /* Enables experimental support for ES7 decorators. */
    // "emitDecoratorMetadata": true,         /* Enables experimental support for emitting type metadata for decorators. */

    /* Advanced Options */
    "skipLibCheck": true,                     /* Skip type checking of declaration files. */
    "forceConsistentCasingInFileNames": true  /* Disallow inconsistently-cased references to the same file. */
  }
}

```
&emsp;当下经过添加修改后，默认配置不算，起作用的配置就这些(其它的先保留注释):
``` json
{
  "compilerOptions": {
    "target": "es5",                          /* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019', 'ES2020', or 'ESNEXT'. */
    "module": "commonjs",                     /* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 'umd', 'es2015', 'es2020', or 'ESNext'. */
     "lib": ["es2017", "es7", "es6", "dom"],                             /* Specify library files to be included in the compilation. */
     "declaration": true,                   /* Generates corresponding '.d.ts' file. */
     "outDir": "dist",                        /* Redirect output structure to the directory. */
    "strict": true,                           /* Enable all strict type-checking options. */
    "esModuleInterop": true,                  /* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies 'allowSyntheticDefaultImports'. */
    "skipLibCheck": true,                     /* Skip type checking of declaration files. */
    "forceConsistentCasingInFileNames": true  /* Disallow inconsistently-cased references to the same file. */
  },
  "exclude": [
    "node_modules",
    "dist"
  ]
}
```
&emsp; 分别配置了,`ts`最后要生成`es5`，导出的目录和编译时忽略的目录等。  
&emsp; 然后在`package.json`加入：
``` json
...
"scripts": {
	"prepublish": "npm run build",
    "build": "tsc"
},
...
```
&emsp;当执行`npm publish`发布时，会先执行构建命令。会使用生成的`dist`让它包含进发布包中。
*注: 如果在后面要发布时并没有调用到`prepublish`这个钩子，那么用`yarn`来代替下也是一样的。

#### 1.2.4 可以写包的代码了
``` bash
$ mkdir src && touch src/index.ts
```
如写上: 
``` typescript
// src/index.ts

export const sayHello = (foo: string): string => {
    return `hello! ${foo}!!!`
}
```

#### 1.2.7 发布
``` bash
$ npm login # 登录，然后根据提示输入信息
npm notice Log in on https://registry.npmjs.org/
Username: wuchuheng
Password: 
Email: (this IS public) wuchuheng@163.com
$ npm publish #然后直接发布
npm notice 
npm notice 📦  jequest@1.0.8
npm notice === Tarball Contents === 
npm notice 458B  .idea/jequest.iml
npm notice 174B  .idea/misc.xml   
npm notice 266B  .idea/modules.xml
npm notice 74B   dist/index.d.ts  
npm notice 176B  dist/index.js    
npm notice 237B  package.json     
npm notice 99B   src/index.ts     
npm notice 1.2kB tsconfig.json    
npm notice === Tarball Details === 
npm notice name:          jequest                                 
npm notice version:       1.0.8                                   
npm notice filename:      jequest-1.0.8.tgz                       
npm notice package size:  1.5 kB                                  
npm notice unpacked size: 2.7 kB                                  
npm notice shasum:        d3cac51dbc046c01a80214ffe7ddf63df89d1999
npm notice integrity:     sha512-MRnBAXRBo9spQ[...]eMRAReGhobShA==
npm notice total files:   8                                       
npm notice 
+ jequest@1.0.8
```

&emsp;然后我们就可像使用他人的包一样，把包下载回来然后然后用了。如：
``` bash 
$ mkdir tmp && cd tmp && npm init -y # 比如这是正在开发的项目
$ npm i request # 把发布出去的包下载回来就可以用了
$ echo 'const {sayHello} = require("jequest"); console.log( sayHello("foo") )' > index.js
$ node index.js
hello! hello!!!
```
最终的`package.json`和`tsconfig.json`为:
``` json
{
  "name": "jequest",
  "version": "1.1.14",
  "description": "",
  "main": "index.js",
  "scripts": {
    "prepublish": "npm run build",
    "build": "tsc"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "typescript": "^4.1.5"
  }
}
```
``` json
{
  "compilerOptions": {
    "target": "es5",                          /* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019', 'ES2020', or 'ESNEXT'. */
    "module": "commonjs",                     /* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 'umd', 'es2015', 'es2020', or 'ESNext'. */
    "lib": ["es2017", "es7", "es6", "dom"],                             /* Specify library files to be included in the compilation. */
    "declaration": true,                   /* Generates corresponding '.d.ts' file. */
    "outDir": "dist",                        /* Redirect output structure to the directory. */
    "strict": true,                           /* Enable all strict type-checking options. */
    "esModuleInterop": true,                  /* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies 'allowSyntheticDefaultImports'. */
    "skipLibCheck": true,                     /* Skip type checking of declaration files. */
    "forceConsistentCasingInFileNames": true  /* Disallow inconsistently-cased references to the same file. */
  },
  "exclude": [
    "node_modules",
    "dist"
  ]
}
```


#### 1.2.8 做下收尾
&emsp;到了这里，一个能用包就已经发布并能使用了，但在发布的包也包含有一些没有必要包含进行的文件，如:
``` bash 
    echo "idea" > .npmignore # 发布时候不包含idea目录 一般只保留dist目录和配置文件，其它可以不包含在发布中，减小包的大小
```
&emsp; 而`.gitignore`也是：
``` bash
.idea
node_modules
dist
```
&emsp; 这是最终的代码自己，[`wuchuheng/jequest`](https://github.com/wuchuheng/jequest/tree/648d2bed6d2b29f46cdac8b22a7d2dae18788908)  
&emsp;一个单纯能用的包基本的部分大概就这些，后面就是一些测试之类附加的再说吧。