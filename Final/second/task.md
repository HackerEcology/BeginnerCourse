# Task

1.现在的WhatsLEFT只能显示已经存在的数据，这显然不够炫酷，你需要为它增加一个添加备忘录的功能,你需要完成下面几件事情

    -在UINavigationBar上添加一个BarButtonItem，identifier为add，这样它就会是一个加号
    -新建一个用来添加备忘录的页面，你可以叫它AddViewController,页面会有三个要填的对象，title，description,time
    -建立BarButtonItem到AddViewController的segue，设置为modal
    -添加UnWindSegue
    -在AddViewController中保存数据
    -在prepareForSegue中传递数据
    -在ViewController中reloadData
2.了解SpriteKit
    掌握SKNodeSKSpriteNode
#Challange


####单元格向左滑动删除数据
###你需要调用tableView:commitEditingStyle:forRowAtIndexPath这个方法

####现在的备忘录只要退出程序，保存的条目就会消失，你需要使用CoreData做数据缓存，让备忘录在程序退出重新加载的时候找到历史备忘录
1. 新建一个自己定义的类，包含public 函数和private函数； 在playground内coding， 体现出继承，封装，和多态的特性，并提交报告

2. 现在的WhatsLEFT只能显示已经存在的数据，这显然不够炫酷，你需要为它增加一个添加备忘录的功能。

3. 了解SpriteKit

4. 用于显示人的姓名和年龄。定义一个人类（Person），该类中应该有两个私有属性，姓名（name）和年龄（age）。定义构造方法，用来初始化数据成员。再定义显示（display）方法，将姓名和年龄打印出来。

5. 建立一个汽车Auto类，包括轮胎个数，汽车颜色，车身重量、速度等成员变量。并通过不同的构造方法创建实例。至少要求：汽车能够加速，减速，停车。再定义一个小汽车类Car，继承Auto，并添加空调、CD等成员变量，覆盖加速，减速的方法


## 挑战


- 1.使用CoreData做数据缓存


- 2.单元格向左滑动删除数据
