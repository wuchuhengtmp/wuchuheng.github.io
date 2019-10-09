layout: layout
title: 【mySQL】mySQL学习笔记-基本常识
catogery: mySQL
tags: mySQL
date: 2018-06-10 23:33:12
---
#### 1.基本操作
- 1.1查看表结构
``` mysql
describe <table name> --查看表结构、
```

#### 1.1 数据表增删改查
#### 1.1.1 新建表格
``` mysql 
CREATE TABLE IF NOT EXISTS `runoob_tbl`(
   `runoob_id` INT UNSIGNED AUTO_INCREMENT,
   `runoob_title` VARCHAR(100) NOT NULL,
   `runoob_author` VARCHAR(40) NOT NULL,
   `submission_date` DATE,
   PRIMARY KEY ( `runoob_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

```
##### 1.1.2 删除和添加主键
 ``` mysql  	
--先删除主键
ALTER  TABLE  `table_name` DROP  PRIMARY KEY(字段);
-- 增加主键
ALTER TABLE `table_name` ADD PRIMARY KEY(字段)；
 
```

#### 2. 数据导出
- 2.1 导出数据库
``` bash
mysqldump <databaseName> -r <username> -p<passwd> > <echoName>.sql;
```
#### 3. 数据读写

##### 3.1 自增更新
``` 
UPDATE `videos` SET `views`=views+1 WHERE `id` = 1}
```
##### 3.2 指定字段部分内容替换更新
``` 
update tableName set columnName = replace(columnName,'string','targetString')
```

#### 2. 权限操作

##### 2.1 数据库用户授权
``` mysql 
grant all privileges on <database_name>.* to '<user_name>'@'<host>';

```
