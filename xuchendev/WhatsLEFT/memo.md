# 构建备忘录的数据模型

备忘录的数据模型及其并不复杂，我们暂时先为他添加两个属性和一个初始化方法

新建一个Swift File


![](http://7u2osj.com1.z0.glb.clouddn.com/swiftfile.png)

为备忘录的类起名Memo

![](http://7u2osj.com1.z0.glb.clouddn.com/memoname.png)

构建完类是这样的
*Tips:图片有错误，self.description = description 因为这个查了好久...*
![](http://7u2osj.com1.z0.glb.clouddn.com/memomode.png)

＃在UITableView中显示备忘录

首先在ViewController中声明一个Memo的数组


然后在datasource的delegate为tableview提供数据

运行，可以看见备忘录在tableview中出现了


![](http://7u2osj.com1.z0.glb.clouddn.com/simu.png)

不过这样真的是不太好看，最上方的状态栏还挡住了第一条备忘录，所以下一节我们会介绍怎样处理。
