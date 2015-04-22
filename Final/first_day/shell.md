for # shell脚本编程

## 什么是Shell脚本
### 示例
看个例子吧：

```
for ((i=0; i<10; i++)); do
    echo i
done


for ((i=0; i<10; i++)); do
    echo $i
done
```


新建文件

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


## 变量
### 定义变量
定义变量时，变量名不加美元符号（$），如：

	your_name="adog"

注意，变量名和等号之间不能有空格，这可能和你熟悉的所有编程语言都不一样。

### 使用变量
使用一个定义过的变量，只要在变量名前面加美元符号即可，如：

	your_name="adog"
	echo $your_name
	echo ${your_name}

变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界，比如下面这种情况：

### 重定义变量
已定义的变量，可以被重新定义，如：

	your_name="qinjx"
	echo $your_name

	your_name="alibaba"
	echo $your_name

这样写是合法的，但注意，第二次赋值的时候不能写$your_name="alibaba"，使用变量的时候才加美元符。


## 字符串
字符串是shell编程中最常用最有用的数据类型（除了数字和字符串，也没啥其它类型好用了，哈哈），字符串可以用单引号，也可以用双引号，也可以不用引号。单双引号的区别跟PHP类似。

### 单引号

	str='this is a string'

单引号字符串的限制：

- 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的
- 单引号字串中不能出现单引号（对单引号使用转义符后也不行）

### 双引号

	your_name='adog'
	str="Hello, I know your are \"$your_name\"! \n"

- 双引号里可以有变量
- 双引号里可以出现转义字符

### 字符串操作
#### 拼接字符串

	your_name="adog"
	greeting="hello, "$your_nam
	greeting_1="hello, ${your_name}"

	echo $greeting $greeting_1

#### 获取字符串长度：

	string="abcd"
	echo ${#string} #输出：4

#### 提取子字符串

	string="Dora is a great company"
	echo ${string:1:4} #输出：ora



#### 高级编程语言
理论上讲，只要一门语言提供了解释器（而不仅是编译器），这门语言就可以胜任脚本编程，常见的解释型语言都是可以用作脚本编程的，如：Perl、Tcl、Python、PHP、Ruby。Perl是最老牌的脚本编程语言了，Python这些年也成了一些linux发行版的预置解释器。

编译型语言，只要有解释器，也可以用作脚本编程，如C shell是内置的（/bin/csh），Java有第三方解释器Jshell，Ada有收费的解释器AdaScript。

如下是一个PHP Shell Script示例（假设文件名叫test.php）：

	#!/usr/bin/php
	<?php
	for ($i=0; $i < 10; $i++)
	        echo $i . "\n";

执行：

	/usr/bin/php test.php
或者：

	chmod +x test.php
	./test.php

更改test.php的权限

    man chown
    man chmod

    chmod a=rwx test.php

- u 表示该档案的拥有者
- g 表示与该档案的拥有者属于同一个群体(group)者
- o 表示其他以外的人
- a 表示这三者皆是


    chown root test.php

    chown: test.php: Operation not permitted

    sudo!!

## 如何选择shell编程语言
### 熟悉 vs 陌生
如果你已经掌握了一门编程语言（如PHP、Python、Java、JavaScript），建议你就直接使用这门语言编写脚本程序，虽然某些地方会有点啰嗦，但你能利用在这门语言领域里的经验（单元测试、单步调试、IDE、第三方类库）。

新增的学习成本很小，只要学会怎么使用shell解释器（Jshell、AdaScript）就可以了。


### 简单 vs 高级
如果你觉得自己熟悉的语言（如Java、C）写shell脚本实在太啰嗦，你只是想做一些备份文件、安装软件、下载数据之类的事情，学着使用sh，bash会是一个好主意。

shell只定义了一个非常简单的编程语言，所以，如果你的脚本程序复杂度较高，或者要操作的数据结构比较复杂，那么还是应该使用Python、Perl这样的脚本语言，或者是你本来就已经很擅长的高级语言。因为sh和bash在这方面很弱，比如说：

- 它的函数只能返回字串，无法返回数组
- 它不支持面向对象，你无法实现一些优雅的设计模式
- 它是解释型的，一边解释一边执行，连PHP那种预编译都不是，如果你的脚本包含错误(例如调用了不存在的函数)，只要没执行到这一行，就不会报错

### 环境兼容性
如果你的脚本是提供给别的用户使用，使用sh或者bash，你的脚本将具有最好的环境兼容性，perl很早就是linux标配了，python这些年也成了一些linux发行版的标配，至于mac os，它默认安装了perl、python、ruby、php、java等主流编程语言。


