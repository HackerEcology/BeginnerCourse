# UINavigationController的介绍

刚才我们完成的App第一行被状态栏挡住了，所以看起来不是很美观，，那怎么让他在顶部有一个自己的标题栏呢？这就要用到UINavigationController了。

首先，什么是UINavigationController?它和UITableView一样都是一种UI元素，如果你的内容是不同层次的，它可以为你提供下沉式的交互方式，就像iOS系统设置那样
![](http://7u2osj.com1.z0.glb.clouddn.com/setting1.PNG)
![](http://7u2osj.com1.z0.glb.clouddn.com/setting2.PNG)
![](http://7u2osj.com1.z0.glb.clouddn.com/setting3.PNG)

那现在就开始吧！
首先在Main.Storyboard中选中ViewController
![](http://7u2osj.com1.z0.glb.clouddn.com/selectviewcontroller.png)
然后Embed In 到NavigationController中
![](http://7u2osj.com1.z0.glb.clouddn.com/embedinnavi.png)

你就会看见这个

![](http://7u2osj.com1.z0.glb.clouddn.com/embedinresult.png)
它的顶部那一部分叫NavigationBar

你可以为这个界面添加标题，双击NavigationBar的中间。
![](http://7u2osj.com1.z0.glb.clouddn.com/addtitle.png)

![](http://7u2osj.com1.z0.glb.clouddn.com/addtitlewhatsleft.png)
#####还记得UITableView的第二个非常重要的属性吗？对！就是UITableViewDelegate，我现在需要这个delegate。

现在我们的App还不能看见备忘录的详细信息。所以我想让点击UITableView的每一行的时候出现一个新的页面，这个页面显示备忘录的详细信息。所以我们要新建一个页面，让他显示备忘录的详细信息。

这次我们会用UITableViewContrller，它会自动在ViewController上加上UITableView以及UITableViewCell，还会自动为你设置DataSource和Delegate，非常方便。


现在就添加一个UITableViewController吧，首先在Obejct Library里面找到它
![](http://7u2osj.com1.z0.glb.clouddn.com/tableviewcontroller.png)


设置它的Content为Static Cells，这适合那种不会变的页面，就像备忘录，要显示的信息只有Title和Description

为了使它好看一点，我们设置它的Style为Grouped让它有两个Section

![](http://7u2osj.com1.z0.glb.clouddn.com/grouped.png)

每个Section里面有一行

![](http://7u2osj.com1.z0.glb.clouddn.com/2section.png)

设置Section的Header
![](http://7u2osj.com1.z0.glb.clouddn.com/showdocumentoutline.png)

*Tips:如果你选不中Section，点击Storyboard的左下角的Show Document Outline*
![](http://7u2osj.com1.z0.glb.clouddn.com/showdocumentoutline.png)
往每一个单元格里面加一个Label

![](http://7u2osj.com1.z0.glb.clouddn.com/addlabel.png)

现在已经有了一个显示备忘录具体信息的页面了，怎么把这两个页面连起来呢？下一节我们会介绍！
