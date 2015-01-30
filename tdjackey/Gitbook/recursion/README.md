# 递归
#### **递归（英语：recursion）**在计算机科学中是指一种通过重复将问题分解为同类的子问题而解决问题的方法。


![](http://7u2ocr.com1.z0.glb.clouddn.com/111.jpg)

###最简单的递归程序

打印出1到N的整数

```
func printFirstNumbers(N: Int) {
    if N > 1 {
        printFirstNumbers(N - 1)
    }
    println(N)
}
printFirstNumbers(3)
```
>思考一下，以上程序输出的是
>
    1
    2
    3

>还是
    >
    3
    2
    1
> 为什么呢？

//回顾一下类的定义，以上程序写在一个类中该怎么写呢？

```

class Recursion {
    func printFirstNumber(N: Int){
        if N > 1 {
            printFirstNumber(N - 1)
        }
        println(N)
    }
}

var tempR = Recursion()


tempR.printFirstNumber(5)

```
为了便于理解，我们可以在上述程序中加一些输出。今后在debug时  也会经常使用到。

```
func printFirstNumbers(N: Int) {
    println("start printFirstNumbers(\(N))")

    if N > 1 {
        println("printFirstNumbers(\(N)) calls printFirstNumbers(\(N-1))")

        printFirstNumbers(N - 1)
    }

    println("printFirstNumbers(\(N)) will print \(N)")

    println("end printFirstNumbers(\(N))")
}

printFirstNumbers(3)

```

####怎么打印从N到1 的数字呢？？

```
func printFrom(N: Int) {
    println(N)
    if N > 1 {
        printFrom(N - 1)
    }
}

printFrom(5)
```
###自然界中递归的例子

![](https://camo.githubusercontent.com/3271691182193dd0d53803b6bbb36aaca8d0b7ee/68747470733a2f2f7777772e7765686561727473776966742e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031342f31322f53637265656e2d53686f742d323031342d31322d32372d61742d30322e32382e35382e706e67)


> 1. 在一个函数内部调用它自己本身
> 2. 需要加一个限定而不至于陷入无限循环
//（老和尚，头发每次减一）


##斐波那契

在数学上，费波那契数列是以递归的方法来定义：

F_0=0
F_1=1
F_n = F_{n-1}+ F_{n-2}(n≧2)
用文字来说，就是费波那契数列由0和1开始，之后的费波那契系数就由之前的两数相加。

```
func fibonacci(i: Int) -> Int {
    if i <= 2 {
        return 1
    } else {
        return fibonacci(i - 1) + fibonacci(i - 2)
    }
}
```

##阶乘
一个正整数的阶乘（英语：factorial）是所有小于及等于该数的正整数的积，并且有0的阶乘为1。自然数n的阶乘写作n!。

```
func factorial(N: Int) -> Int {
    if N == 1 {
        return 1
    } else {
        return N * factorial(N - 1)
    }
}
```

##乘方
求n个相同因数乘积的运算，叫做乘方，乘方的结果叫做幂(power)。
其中，a叫做底数(base number)，n叫做指数(exponent)，当a^n看作a的n次方的结果时，也可读作“a的n次幂”。
一个数都可以看作这个本身数的一次方。指数1通常省略不写。


```
pow(2, 10)  // 1024
pow(3, 3)   // 27
pow(100, 1) // 100
pow(10, 0)  // 1

```

```
func pow(x: Int, y: Int) -> Int {
    if y == 0 {
        return 1
    } else {
        return x * pow(x, y - 1)
    }
}
```
##最大公约数
最大公约数（Greatest Common Divisor，简写为G.C.D.；或Highest Common Factor，简写为H.C.F.），指某几个整数共有约数中最大的一个。

```
10 2
8 2
6 2
4 2
2 2
2 0 // 2 is the greatest common divisor of 10 and 2

9 6
3 6
3 3
3 0 // 3 is the greatest common divisor of 9 and 6

35 49
35 14
21 14
7  14
7  7
7  0 // 7 is the greatest common divisor of 35 and 49
```

```
func gcd(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        if a > b {
            return gcd(a-b, b)
        } else {
            return gcd(a, b-a)
        }
    }
}
```

## 挑战 汉诺塔
有三根杆子A，B，C。A杆上有N个(N>1)穿孔圆盘，盘的尺寸由下到上依次变小。要求按下列规则将所有圆盘移至C杆：

1.每次只能移动一个圆盘；
2.大盘不能叠在小盘上面。

![](http://img1.imgtn.bdimg.com/it/u=317860440,2045102503&fm=21&gp=0.jpg)
