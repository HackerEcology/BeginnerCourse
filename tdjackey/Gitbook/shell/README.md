## 什么是Shell脚本
### 示例
看个例子吧：

	#!/bin/sh
	cd ~
	mkdir shell_tut
	cd shell_tut

	for ((i=0; i<10; i++)); do
		touch test_$i.txt
	done

### 示例解释

- 第1行：指定脚本解释器，这里是用/bin/sh做解释器的
- 第2行：切换到当前用户的home目录
- 第3行：创建一个目录shell_tut
- 第4行：切换到shell_tut目录
- 第5行：循环条件，一共循环10次
- 第6行：创建一个test_1…10.txt文件
- 第7行：循环体结束

cd, mkdir, touch都是系统自带的程序，一般在/bin或者/usr/bin目录下。for, do, done是sh脚本语言的关键字。

### shell和shell脚本的概念
shell是指一种应用程序，这个应用程序提供了一个界面，用户通过这个界面访问操作系统内核的服务。Ken Thompson的sh是第一种Unix Shell，Windows Explorer是一个典型的图形界面Shell。

shell脚本（shell script），是一种为shell编写的脚本程序。业界所说的shell通常都是指shell脚本，但读者朋友要知道，shell和shell script是两个不同的概念。由于习惯的原因，简洁起见，本文出现的“shell编程”都是指shell脚本编程，不是指开发shell自身（如Windows Explorer扩展开发）。

## 环境
shell编程跟java、php编程一样，只要有一个能编写代码的文本编辑器和一个能解释执行的脚本解释器就可以了。

### OS
当前主流的操作系统都支持shell编程，本文档所述的shell编程是指Linux下的shell，讲的基本都是POSIX标准下的功能，所以，也适用于Unix及BSD（如Mac OS）。

#### Linux
Linux默认安装就带了shell解释器。

#### Mac OS
Mac OS不仅带了sh、bash这两个最基础的解释器，还内置了ksh、csh、zsh等不常用的解释器。

#### Windows上的模拟器
windows出厂时没有内置shell解释器，需要自行安装，为了同时能用grep, awk, curl等工具，最好装一个cygwin或者mingw来模拟linux环境。

- [cygwin](www.cygwin.com)
- [mingw](www.mingw.org)

### 脚本解释器
#### sh
即Bourne shell，POSIX（Portable Operating System Interface）标准的shell解释器，它的二进制文件路径通常是/bin/sh，由Bell Labs开发。

本文讲的是sh，如果你使用其它语言用作shell编程，请自行参考相应语言的文档。

#### bash
Bash是Bourne shell的替代品，属GNU Project，二进制文件路径通常是/bin/bash。业界通常混用bash、sh、和shell，比如你会经常在招聘运维工程师的文案中见到：熟悉Linux Bash编程，精通Shell编程。

在CentOS里，/bin/sh是一个指向/bin/bash的符号链接:

	# ls -l /bin/*sh
	-rwxr-xr-x. 1 root root 903272 Feb 22 05:09 /bin/bash
	-rwxr-xr-x. 1 root root 106216 Oct 17  2012 /bin/dash
	lrwxrwxrwx. 1 root root      4 Mar 22 10:22 /bin/sh -> bash

但在Mac OS上不是，/bin/sh和/bin/bash是两个不同的文件，尽管它们的大小只相差100字节左右:

$ ls -l /bin/*sh
	-r-xr-xr-x  1 root  wheel  1371648  6 Nov 16:52 /bin/bash
	-rwxr-xr-x  2 root  wheel   772992  6 Nov 16:52 /bin/csh
	-r-xr-xr-x  1 root  wheel  2180736  6 Nov 16:52 /bin/ksh
	-r-xr-xr-x  1 root  wheel  1371712  6 Nov 16:52 /bin/sh
	-rwxr-xr-x  2 root  wheel   772992  6 Nov 16:52 /bin/tcsh
	-rwxr-xr-x  1 root  wheel  1103984  6 Nov 16:52 /bin/zsh
