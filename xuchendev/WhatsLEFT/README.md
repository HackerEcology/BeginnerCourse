# UITableView的介绍

###1.首先什么是UITableView?

UITableView是iPhone app中最重要的元素，除了游戏以外几乎所有的App都会用到UITableView比如**TED, Google+，Airbnb**, ![](http://7u2osj.com1.z0.glb.clouddn.com/ted.png)
### 知乎!

![](http://7u2osj.com1.z0.glb.clouddn.com/Zhihu.PNG)


###2.TableView的重要属性

TableView有两个非常重要的属性，第一个是delegate，你可以将它设置为一个遵循UITableViewDelegate协议的类(通常是一个UIViewController)，这个协议里面会有一堆optional的方法，比如让你知道一行被选中的事件，或者tableview进入edit 模式的方法

第二个重要的属性是datasource，同样你可以将它设置为一个遵循UITableViewDataSource的类，UITableView会问它要数据，比如说有多少行要显示以及每一行要显示什么。

这个delegate是optional的，但是datasource却是必须的，为什么？因为你可以在点击UITableVIew的一行的时候没有响应，但它的每一一行内容却是肯定需要的。

###3.开始制作你的备忘录

现在就开始来制作你的备忘录，我们给它起一个好玩一点的名字叫WhatsLEFT!

首先新建一个Single View Application

![](http://7u2osj.com1.z0.glb.clouddn.com/singleview.png)
产品名称写WhatsLEFT

![](http://7u2osj.com1.z0.glb.clouddn.com/whatsleft.png)
为了使我们更节省时间，先不考虑屏幕适配的问题，所以取消SizeClasses

![](http://7u2osj.com1.z0.glb.clouddn.com/autolayout.png)
SizeClasses是一种适配不同屏幕尺寸iPhone的策略，后面我们会详细讲解它，但现在用它的意义不是太大，所以先取消它吧。
![](http://7u2osj.com1.z0.glb.clouddn.com/disablesizeclass.png)

接下来在Object Library 里面找到TableView，将它拖到ViewController上。

![](http://7u2osj.com1.z0.glb.clouddn.com/addtableview.png)
然后再拖一个tableviewcell到tableview上，这里的uitableviewcell就是tableview的单元格。

![](http://7u2osj.com1.z0.glb.clouddn.com/addtableviewcell.png)

这时候在Attribute Inspector里面设置UITableViewCell的Identifier为cell

接下来就要设置tableview的两个很重要的属性datasource和delegate

![](http://7u2osj.com1.z0.glb.clouddn.com/datasource.png)

![](http://7u2osj.com1.z0.glb.clouddn.com/delegate.png)

然后就要让ViewController遵循datasource和delegate两个属性

![](http://7u2osj.com1.z0.glb.clouddn.com/viewcontroller.png)

Command + 左键 进入datasource里面看看有什么必须实现的方法

![](http://7u2osj.com1.z0.glb.clouddn.com/tableviewdatasourcefunc.png)

把这两个方法加入ViewController中 注意 方法加后加{}
