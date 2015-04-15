# AutoNavi Tutorial

#####注册高德开发者并申请一个apiKey

1.访问 http://lbs.amap.com/console/key

2.注册高德开发者账号并认证成为开发者

3.为你的app申请一个key

单击获取KEY


在下面的界面中填上Bundle Identifier
![](http://7u2osj.com1.z0.glb.clouddn.com/12_apikeyApply.png)
Budle Identifier在项目配置页面可以看见
![](http://7u2osj.com1.z0.glb.clouddn.com/12_bundleidentifier.png)



#开发你的第一地图应用


1.使用CocoaPods配置你的工程

CocoaPods是什么？
当你开发iOS应用时，会经常使用到很多第三方开源类库，比如JSONKit，AFNetWorking等等。可能某个类库又用到其他类库，所以要使用它，必须得另外下载其他类库，而其他类库又用到其他类库，“子子孙孙无穷尽也”，这也许是比较特殊的情况。总之小编的意思就是，手动一个个去下载所需类库十分麻烦。另外一种常见情况是，你项目中用到的类库有更新，你必须得重新下载新版本，重新加入到项目中，十分麻烦。如果能有什么工具能解决这些恼人的问题，那将“善莫大焉”。所以，你需要 CocoaPods。

CocoaPods应该是iOS最常用最有名的类库管理工具了，上述两个烦人的问题，通过cocoaPods，只需要一行命令就可以完全解决，当然前提是你必须正确设置它。重要的是，绝大部分有名的开源类库，都支持CocoaPods。


## 1.配置你的工程

新建podfile文件

```
touch podfile
```

编辑podfile文件

```
platform:ios,'7.0'
pod 'AMap2DMap'
pod 'AMapSearch'

```
配置
```
pod install
```








##2.在屏幕上显示一个地图

MAMapView

定义:一个可嵌入的地图对象
功能:可以用来显示地图和对地图进行操作

#####头文件引用
```import <MAMapKit/MAMapKit.h>```

#####定义key
```let apikey = ""```

#####定义mapView变量
```
var mapView:MAMapView!
```
#####mapView变量初始化

![](http://7u2osj.com1.z0.glb.clouddn.com/12_initmapView.png)


在viewDidLoad中调用initMapView()
![](http://7u2osj.com1.z0.glb.clouddn.com/12_viewdidloadcallinitmapView.png)


##3.定位你自己在哪儿

#####iOS 8系统需在info.plist添加字段

若仅需在用户使用app时定位,添加字段NSLocationWhenInUseUsageDescription

若在用户不使用app时仍然需要定位,添加字段NSLocationAlwaysUsageDescription

*tips 点击小加号就可以添加字段*

![](http://7u2osj.com1.z0.glb.clouddn.com/12_addplist.png)

#####添加定位按钮相应事件

![](http://7u2osj.com1.z0.glb.clouddn.com/12_locateAction.png)

#####使用MapView回调方法监听定位模式状态

![](http://7u2osj.com1.z0.glb.clouddn.com/12_updateStatus.png)


运行App，当系统询问
```
Allow "your_app_name" to Access your location even when you are not using the app```
的时候
选择 Allow

点击定位按钮，就可以看到你在哪儿啦！

![](http://7u2osj.com1.z0.glb.clouddn.com/12_thu_position.PNG)

#####使用mapView回调方法获取当前经纬度

![](http://7u2osj.com1.z0.glb.clouddn.com/12_didUpdateUserLocation1.png)


然后就可以在控制台看见更新的位置了！

![](http://7u2osj.com1.z0.glb.clouddn.com/12_showUserLocation.png)
##4.显示你所在位置的地址

#####在bridging-Header里面调用Search包头文件

```#import <AMapSearchKit/AMapSearchAPI.h>
```

#####声明用户经纬度变量、search变量,实现AMapSearchDelegate协议

![](http://7u2osj.com1.z0.glb.clouddn.com/12_addSearchVirable.png)

#####初始化search对象
![](http://7u2osj.com1.z0.glb.clouddn.com/12_initSearch.png)


#####在选中用户位置annotation时发送reGeo请求

#####请求完后把返回的结果显示在屏幕上

*tips:reGeo请求就是经纬度转换为地址 geo请求就是地址转换为经纬度*

![](http://7u2osj.com1.z0.glb.clouddn.com/12_geoRegeo.png)

#####添加MAMapView的回调方法

![](http://7u2osj.com1.z0.glb.clouddn.com/12_didSelectAnnotationView.png)





#####添加搜索请求处理完成后的回调

![](http://7u2osj.com1.z0.glb.clouddn.com/12_AMapSearchDelegate.png)

####请求会返回这种格式的数据

![](http://7u2osj.com1.z0.glb.clouddn.com/12_AMapReGeoResponse.png)

#####现在点击小蓝点就可以显示你所在的位置啦！

![](http://7u2osj.com1.z0.glb.clouddn.com/12_showUserLocationInMapView.png)









