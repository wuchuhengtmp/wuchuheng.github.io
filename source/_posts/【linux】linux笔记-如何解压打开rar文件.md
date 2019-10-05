---
layout: layout
title: 【linux】linux笔记-linux如何解压打开rar文件(转)
date: 2019-10-05 22:28:35
categories: linux
tags: 
  - rar
toc: true
---
### How to Open, Extract and Create RAR Files in Linux

&emsp; RAR is a most popular tool for creating and extracting compressed archive (.rar) files. When we download an archive file from the web, we required a rar tool to extract them.
&emsp; RAR is available freely under Windows operating systems to handle compressed files, but unfortunately, rar tool doesn’t pre-installed under Linux systems.
&emsp; This article explains how to install unrar and rar command-line tools using official binary tar file under Linux systems to open, extract, uncompress or unrar an archive file.

Step 1: How to Install Unrar in Linux
--
On Debian and Ubuntu based distributions, you can easily install unrar package using the apt-get or apt program as shown.
<!--more-->
```  bash
$ sudo apt-get install unrar
Or
$ sudo apt install unrar
```

&emsp;If you are using Fedora distribution, you can use the dnf command to install it.

``` bash
$ sudp dnf install unrar
```
&emsp;iIf you are using a CentOS / RHEL distribution, you need to download the latest unrar/rar file and install it using following commands.


``` bash
--------------- On 64-bit --------------- 
# cd /tmp
# wget https://www.rarlab.com/rar/rarlinux-x64-5.6.0.tar.gz
# tar -zxvf rarlinux-x64-5.6.0.tar.gz
# cd rar
# sudo cp -v rar unrar /usr/local/bin/

--------------- On 32-bit --------------- 
# cd /tmp
# wget https://www.rarlab.com/rar/rarlinux-5.6.0.tar.gz
# tar -zxvf rarlinux-5.6.0.tar.gz
# cd rar
# sudo cp -v rar unrar /usr/local/bin/
```

Step 2: How to Open/Extract a RAR File in Linux
--

&emsp; To open/extract a RAR file in current working directory, just use the following command with unrar e option.

``` bash
# unrar e tecmint.rar

UNRAR 4.20 beta 3 freeware      Copyright (c) 1993-2012 Alexander Roshal

Extracting from tecmint.rar

Extracting  index.php                                                 OK
Extracting  index.html                                                OK
Extracting  xyz.txt                                                   OK
Extracting  abc.txt                                                   OK
All OK
```

&emsp; To open/extract a RAR file in specific path or destination directory, just use the unrar e option, it will extract all the files in specified destination directory.

``` bash 
# unrar e tecmint.rar /home/

UNRAR 4.20 beta 3 freeware      Copyright (c) 1993-2012 Alexander Roshal

Extracting from tecmint.rar

Extracting  /home/index.php                                           OK
Extracting  /home/index.html                                          OK
Extracting  /home/xyz.txt                                             OK
Extracting  /home/abc.txt                                             OK
All OK
```
To open/extract a RAR file with their original directory structure. just issue below command with unrar x option. It will extract according their folder structure see below output of the command.

``` bash 
# unrar x tecmint.rar

UNRAR 4.20 beta 3 freeware      Copyright (c) 1993-2012 Alexander Roshal

Extracting from tecmint.rar

Creating    tecmint                                                   OK
Extracting  tecmint/index.php                                         OK
Extracting  tecmint/index.html                                        OK
Extracting  tecmint/xyz.txt                                           OK
Extracting  tecmint/abc.txt                                           OK
Creating    default                                                   OK
Extracting  default/index.php                                         OK
Extracting  default/index.html                                        OK
Creating    include                                                   OK
Extracting  include/abc.txt                                           OK
Creating    php                                                       OK
Extracting  php/xyz.txt                                               OK
All OK
```

Step 3: How to List a RAR File in Linux
-- 
To list a files inside a archive file use unrar l option. It will display the list of files with their sizes, date, time and permissions.

```  bash 

unrar l tecmint.rar

UNRAR 4.20 beta 3 freeware      Copyright (c) 1993-2012 Alexander Roshal

Archive tecmint.rar

 Name             Size   Packed Ratio  Date   Time     Attr      CRC   Meth Ver
 -------------------------------------------------------------------------------
 index.php           0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 index.html          0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 xyz.txt             0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 abc.txt             0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 index.php           0        8   0% 18-08-12 19:22 -rw-r--r-- 00000000 m3b 2.9
 index.html          0        8   0% 18-08-12 19:22 -rw-r--r-- 00000000 m3b 2.9
 abc.txt             0        8   0% 18-08-12 19:22 -rw-r--r-- 00000000 m3b 2.9
 xyz.txt             0        8   0% 18-08-12 19:22 -rw-r--r-- 00000000 m3b 2.9
 -------------------------------------------------------------------------------
 8                0       64   0%
```

Step 4: How to Test a RAR File in Linux
--
To test an integrity of a archive file, use option unrar t. The below command will perform a complete integrity check for each file and displays the status of the file.

``` bash 

unrar t tecmint.rar

UNRAR 4.20 beta 3 freeware      Copyright (c) 1993-2012 Alexander Roshal

Testing archive tecmint.rar

Testing     tecmint/index.php                                         OK
Testing     tecmint/index.html                                        OK
Testing     tecmint/xyz.txt                                           OK
Testing     tecmint/abc.txt                                           OK
Testing     default/index.php                                         OK
Testing     default/index.html                                        OK
Testing     include/abc.txt                                           OK
Testing     php/xyz.txt                                               OK
All OK
```

The unrar command is used to extract, list or test archive files only. It has no any option for creating RAR files under Linux. So, here we need to install RAR command-line utility to create archive files.

Step 5: How to Install Rar in Linux
--
To install RAR command option in Linux, just execute following command.
```  bash 
# sudo apt-get install rar
# sudo dnf install rar
# yum install rar
```

Sample Output
---

``` bash 
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
Dependencies Resolved
=========================================================================================
Package            Arch            Version             Repository          Size
=========================================================================================
Installing:
rar               i386            3.8.0-1.el5.rf      rpmforge            264 k

Transaction Summary
    =========================================================================================
    Install       1 Package(s)
Upgrade       0 Package(s)

Total download size: 264 k
Is this ok [y/N]: y
Downloading Packages:
rar-3.8.0-1.el5.rf.i386.rpm                                       | 264 kB     00:01
Running rpm_check_debug
Running Transaction Test
Finished Transaction Test
Transaction Test Succeeded
Running Transaction
Installing     : rar                                          1/1

Installed:
rar.i386 0:3.8.0-1.el5.rf

Complete!

```


Step 6: How to Create Rar File in Linux
--- 

To create a archive(RAR) file in Linux, run the following command with rar a option. It will create archive file for a tecmint directory.

``` bash 
rar a tecmint.rar tecmint

RAR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Evaluation copy. Please register.

Creating archive tecmint.rar

Adding    tecmint/index.php                                           OK
Adding    tecmint/index.html                                          OK
Adding    tecmint/xyz.txt                                             OK
Adding    tecmint/abc.txt                                             OK
Adding    tecmint                                                     OK
Done
```

Step 7: How to Delete files from Archive
---- 
``` bash 
rar d filename.rar
```

Step 8: How to Recover Archives
---
To recover or fix a archive file or files, run the command with option rar r.

``` bash 
rar r filename.rar

RAR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Building fixed.tecmint.rar
Scanning...
Data recovery record not found
Reconstructing tecmint.rar
Building rebuilt.tecmint.rar
Found  tecmint\index.php
Found  tecmint\index.html
Found  tecmint\xyz.txt
Found  tecmint\abc.txt
Found  tecmint
Done
```

Step 9: How to Update Archives
___

To update or add files to existing archive file, use the following command with option rar u.
```  bash 
rar u tecmint.rar tecmint.sql

RAR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Evaluation copy. Please register.

Updating archive tecmint.rar

Adding    tecmint.sql                                                 OK
Done
```
Now, verify that the file tecmint.sql is added to archive file.

``` bash  
rar l tecmint.rar

RAR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Archive tecmint.rar

 Name             Size   Packed Ratio  Date   Time     Attr      CRC   Meth Ver
 -------------------------------------------------------------------------------
 index.php           0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 index.html          0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 xyz.txt             0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 abc.txt             0        8   0% 18-08-12 19:11 -rw-r--r-- 00000000 m3b 2.9
 tecmint             0        0   0% 18-08-12 19:23 drwxr-xr-x 00000000 m0  2.0
 tecmint.sql 0 8 0% 18-08-12 19:46 -rw-r--r-- 00000000 m3b 2.9
 -------------------------------------------------------------------------------
 6                0       40   0%
```

Step 10: How to Set Password to Archives
----

``` bash 
rar a -p tecmint.rar

Enter password (will not be echoed):

Reenter password:

AR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Evaluation copy. Please register.

Updating archive tecmint.rar

Updating  tecmint.sql                                                 OK
Done
```
Now verify it by extracting the archive file and see whether it will prompt us to enter password that we have set above.

```bash 
rar x tecmint.rar

RAR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Extracting from tecmint.rar

Creating    tecmint                                                   OK
Extracting  tecmint/index.php                                         OK
Extracting  tecmint/index.html                                        OK
Extracting  tecmint/xyz.txt                                           OK
Extracting  tecmint/abc.txt                                           OK
Enter password (will not be echoed) for tecmint.sql:

Extracting  tecmint.sql                                               OK
All OK
```

Step 11: How to Lock Archives
---

Another interesting lock feature from rar tool, it provides a option to lock a particular archive file from extracting it.

``` bash 
rar k tecmint.rar

RAR 3.80   Copyright (c) 1993-2008 Alexander Roshal   16 Sep 2008
Shareware version         Type RAR -? for help

Processing archive tecmint.rar
Locking archive
Done
```
Conclusion
--
For mor RAR and Unrar options and usage, run the following command it will display a list of options with their description.

``` bash 
# man unrar
# man rar
```
We have presented almost all of the options above for rar and unrar commands with their examples. If you feel that we’ve missed anything in this list and you would like us to add, please update us using comment form below.

Sharing is Caring...

[文章来源](https://www.tecmint.com/how-to-open-extract-and-create-rar-files-in-linux/)
