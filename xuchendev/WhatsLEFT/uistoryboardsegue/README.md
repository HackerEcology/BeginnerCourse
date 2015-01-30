# 使用UIStoryboardSegue连接页面

UIStoryboardSegue表示两个页面之间的专场,现在我们要实现点击某一单元格跳转到详情页面。

在tableviewcell上按住Control并且拉出一条线到详情页面，在segue选择push

![](http://7u2osj.com1.z0.glb.clouddn.com/pushsegue.png)
现在你点击每一行就会跳转到详情页面了
#在界面之间传递数据

现在我们要在详情页面显示数据，所以就需要在跳转的时候把当前的Memo传递过去。

因为现在详情页面还没有Controller控制它，所以我们要新建一个UITableViewController并且与Storyboard绑定

选择CocoaTouch Class
![](http://7u2osj.com1.z0.glb.clouddn.com/cocoatouchclass.png)


命名
![](http://7u2osj.com1.z0.glb.clouddn.com/memotableviewcontroller.png)

Controller与Storyboard绑定

![](http://7u2osj.com1.z0.glb.clouddn.com/bindclass.png)

然后要在MemoTableViewController中添加一个Memo的属性，来接收传递过来的Memo，还要声明两个IBOutlet来显示TITLE和DESCRIPTION

完成后MemoTableViewController是这样的

![](http://7u2osj.com1.z0.glb.clouddn.com/labeloutlet.png)

然后我们需要在segue执行的时候去传递memo，所以打开ViewController，添加tableView这个IBOutlet，在tableview中选择某一行之后,可以通过这个属性获得当前的选择索引，然后在prepareForSegue执行的时候传递过去。怎么样就是这么神奇！

![](http://7u2osj.com1.z0.glb.clouddn.com/passIndex.png)

然后在MemoTableViewController的viewDidLoad方法中设置两个label的值，这样加载的时候就会显示出Memo的详细信息了。

![](http://7u2osj.com1.z0.glb.clouddn.com/viewdidloadsetlabel.png)


