# Swift基本语法，编程语言基础

刚才我们做了第一个app。第一个app的主要功能是给各位更多的成就感，但是要成为一个好的coder/developer，你要理解更多。

计算机和电子工程的发展是一个层级抽象的过程，新的技术的产生通常是对原有技术的抽象（Abstraction）。抽象的结果是什么？通常而言，是将下一层的不必要的复杂的东西隐藏起来，把重要的接口露出来，这样我们可以在不需要知道下层技术完整细节的情况下，方便地使用他们。这件事情并不难理解，并且它其实很常见。例如你可以把一辆车想像成一个抽象，车这个产品的功能是让你能够不必理解内部复杂结构就可以使用，至于车的接口，是方向盘（控制方向），油门刹车（控制停止前进和速度）等。

编程语言本身有基础的重要性，因为它提供了一种人类可以读写的语言来精准无歧义地控制计算机实现逻辑。

开始code！

1. XCode Playground
2. Swift
3. 打印字符串
4. 变量和常量
5. 类型
6. 隐式变量和显式变量
7. 实现逻辑的必备要素
8. 条件
9. 循环
10. 数组
11. 字典
12. 字符串操作

### XCode Playground

XCode 6 开始苹果在XCode中加入了Playgroud。Playground是一个能够动态编译程序源代码的环境，它实质上是一个文本编辑器＋一个动态编译源代码的Python后台程序，以及一个显示程序执行结果的区域。

现在和我一起创建一个Playground。

### Swift

Swift是苹果最新的编程语言，意在取代原有的语言Objective-C。Swift语法简单，增加了一些新的特性，例如函数编程等。

### 打印字符串

```
var str = "I'm coding Swift!"
println(str)
```

### 变量和常量

Swift中区分变量和常量。

变量是可以变的量，常量是不能变的量。为什么要区分变量和常量？因为我们希望有一些量能够在程序中发生改变，而另一些量不发生改变。常量的"Moral"是让我们在源代码中保证那些我们不希望改变的量不改变。

例如，在Playgound中输入以下的变量声明和赋值:

```
var a = 3   //一个整数类型的变量
let b = 5   //一个整数类型的常量
```

那么变量和常量有什么区别？现在尝试下面的改动:

```
a = 7       //将a的值改成7
a = b       //将b的值复制到a的内存地址，因此a的值等于b的值
b = 10      //出错
```

注意我们区分了声明一个变量和给一个变量赋值。这两件事是有区别的，声明一个变量只是“声明”一个变量，但这个变量还并没有内容。因此，Swift将这些变量统一赋值为nil。

### 类型

类型是变量所属的类。比如:整数，字符，浮点数等。在很多语言中，类型是不明显的，比如Python, Javascript。Swift是一个强调类型的语言。强调类型的一个直接的好处是让程序少犯错误。

例如，如果你定义一个字符串，然后给他一个整数的赋值，会出现一个错误。

```
var str_variable = "I'm a string."
str_variable = 3
```

错误信息有时会给你明确的指示，例如，在此情况下，你会得到以下的信息:

```
Type 'String' does not conform to protocol 'IntegerLiteralConvertible'
```

你还可以显式地指定变量的类型:

```
var explicit_int:Int = 5
```

那为什么刚才定义变量的时候没有指定类型？因为Swift的编译器（将Swift程序转换成计算机可以执行程序的程序）会

### Optional Type

隐式变量和显式变量是Swift的特别特性。为了搞清楚这个特性，我们首先做几个实验。

首先，在Swift中只声明一个变量是会报错的。

```
var a
```

但是你可以向编译器“保证”你的变量是有赋值的:

```
var a:Int!
```

在Swift中，有一种类型叫做Optional类型。以下是Optional类型的定义::

```
enum Optional<T> {
    case None
    case Some(T)
}
```

这指代一个类型为T的变量或对象(复杂一些的变量)可能是有值的或是空值(nil)。

例如，如果按以下方式定义一个变量Optional变量x，值为42:

```
var x:Int? = 42
```

如果你用println输出x会看到"Optional(42)"，如果你直接在Playground中显示x会看到{Some 42}。

![day1_Basic_Wrap](http://7u2ql1.com1.z0.glb.clouddn.com/beginner_wrapvsunwrap.png)
picture reference: http://lithium3141.com/blog/2014/06/19/learning-swift-optional-types/

这里，42被"包住了"，如果要取出42的值，需要"Unwrap"，Unwrap的方法是用!

```
println(x!)
```

### 实现逻辑的必备要素

条件和循环是实现一个程序逻辑的必备要素。条件和循环非常重要，Bill Gates和Mark Zuckerburg的解释可以很好的说明这件事。

https://www.youtube.com/watch?v=mPiGHyIXKtw

https://www.youtube.com/watch?v=m2Ux2PnJe6E

https://www.youtube.com/watch?v=mgooqyWMTxk

### 条件 (Conditional Statements)

条件很简单，总体就是"如果＊＊就＊＊，否则就＊＊"。稍微复杂一点的逻辑可以是"如果条件一成立就＊＊，如果条件二成立就＊＊，否则＊＊"。一个例子是:"如果今天下雨我们就呆在家，如果今天下雪我们就去打雪仗，否则我们就去公园。"

计算机中的逻辑和通常我们思考的逻辑完全一样，只是用一个不同一点的语言而已（注意我们下面用了"伪代码"而不是真正可以运行的程序。伪代码的逻辑可以随时转换成真正的程序）:

```
//假设我们已经有变量weather

if weather == "rain" {
    do 呆在家
} else if weather == "snow" {
    do 打雪仗
} else {
    do 去公园
}
```

还是来一个可以直接执行的程序:

```
if myName == "Bob" && time < 12 {
    println("Good morning, Bob")
} else if myName == "Bob" && time >= 12 {
    println("Good afternoon, Bob")
} else {
    println("Who are you?")
}
```

### 循环 (Loops)

计算机擅长做的是重复同一个工作很多次。重复的工作由循环语句实现。循环可以用`for`和`while`实现。

```
//a for loop

for var i = 1; i < 10; i = i + 1 {
    println(i)
}
```

```
//a while loop

var i = 1

while i < 5 {
    println(i)
    i++
}
```

注意`for`和`while`没有本质的区别，并且可以完全互相替换。

### 数组

有的时候我们有很多数据，比如如果你希望给facebook上的每个人发一封邮件，这些email地址需要储存在某个地方。如果每个email都使用变量，那么你需要10亿的不同名称的变量。但我们并不关心这些email的变量名，而是更加关心它们本身。在这种情况下，一个更好的数据结构是数组。一个数组可以储存很多数据，而不用给它们分别命名。例如这样定义一个数组:

```
var array = [1,2,3]

arr[3]  //a newbie mistake

arr[0]  //数组中的元素可以根据索引找到
```

在数组中加入一个元素:

```
array.append(4)
```

删除数组中的某一个元素，比如删除第二个元素:

```
arr.removeAtIndex(1)
```

删除某一个区间内的元素:

```
arr.removeRange(1...2)
```

### 字典

字典是一个"Key-Value"对的集合。与数组不同的是，key是一个自定义的用字符串的索引，value是这个索引所对应的值。

```
var dict = ["name": "Bob", "age": 34, "gender": "male"]

dict["name"]
```

### 字符串操作

字符串可以想像成一个字符的数组。

```
//定义两个数组并把它们连起来
var str = "Hello, playground"
var anotherStr = "Eric"
var thirdStr = str + " " + anotherStr

//遍历一个数组
for character in str {
    println(character)
}
```

子字符串:一个字符串中的一段

```
//使用NSString的方法
var newString = "Test String" as NSString
var subString = newString.substringToIndex(3)

//类型转换
var anotherSubString = (str as NSString).substringToIndex(3)

//如何取字符串的一段？
```



