# iWatch Tutorial

## 基本的WatchKit代码



起始项目包括一个名为BitWatchKit的框架，包含一些自定义代码来获取比特币的价格。我们把这个代码做在框架里，因此它可以同时在iPhone应用程序中使用，在iPhone WatchKit扩展中也可以很容易地使用。

现在打开starter-project,在模拟器上运行，你就可以像这样查询到比特币的价格![](http://7u2osj.com1.z0.glb.clouddn.com/11_bitcoinprice.png)

现在是时候在你的iWatch手表上跟踪比特币价格了

在Xcode里, 找到File\New\Target… 然后选择 iOS\Apple Watch\Watch App 模板.

一个Watch App是iOS App的扩展，它并不是一个独立的App，所以你新建的是一个Target而不是一个Project

取消Include Notification Scene选项![](http://7u2osj.com1.z0.glb.clouddn.com/11_watchSetting.png)

现在你可以看见两个新建的文件夹![](http://cdn4.raywenderlich.com/wp-content/uploads/2014/11/watch-groups.png)


Watch App文件夹里面只有Storyboard和Image.xcassets，没有任何代码，它就像你App的View

WatchKit Extension里面包含着一些代码，比如说app 启动时要执行的代码，button点击时要执行的代码
或者switch切换要执行的代码,它就像你App的Controller一样![](http://cdn5.raywenderlich.com/wp-content/uploads/2014/11/WatchKit_03.jpg)

## 设计Watch Interface

设计Watch Interface 就像你在iOS上设计一样
打开BitWatch Watch App文件夹选择Interface.storyboard![](http://cdn3.raywenderlich.com/wp-content/uploads/2014/11/watch-storyboard1.png)

像开发iOS App一样点击 Show Object Library ，添加一个Label和一个Button


设置Label的位置

![](http://cdn1.raywenderlich.com/wp-content/uploads/2014/11/watch-centertop.png)

同样设置button的vertical为bottom

为label设置一下字体样式
![](http://7u2osj.com1.z0.glb.clouddn.com/11_labelSetting.png)

设置Button的Title为Refresh字体16号

![](http://7u2osj.com1.z0.glb.clouddn.com/11_looksgood.png)

## Action & Outlet

打开Interface.storyboard，为Label设置Outlet，名字可以为priceLabel,为Button设置Action为refreshTapped

## 编写WatchKit代码

Starter Project里面有写好的获取比特币价格的代码，我们把它封装成了一个framework，这样就可以在iOS App
和WatchKit Extension里面同时调用它，非常的方便

为Watch Extension添加BitWatchKit.framework

## tupian

1.在InterfaceController.swift中导入BitWatchKit包

2.声明Tracker类对象和一个记录价格是否更新过的变量

3.在refreshTapped点击事件里面加上请求数据的代码

完成后应该是这样的

## 现在在Watch上运行你的App

怎么看见Apple Watch的屏幕呢？在iOS Simulator\HardWare\External Display选择Apple Watch



