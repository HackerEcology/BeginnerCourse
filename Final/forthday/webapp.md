# 使用线上资源制作真实的app

在制作真正的app时，通常我们不会自己独立开发所有的功能和模块。除了使用别人已经写好的“库”以外，我们还需要利用很多已有的资源。这些资源可能是在线的数据，API，或是各类服务。

我们今天一起做两个app。首先我们只做一个天气预报查询软件，借以介绍在app中使用Web上的数据资源。

然后我们会介绍一个BAAS的服务（Back end as a service）－－LeanCloud。使用LeanCloud我们可以快速地在线构建数据库，添加用户管理，制作一个app的后端。

介绍过LeanCloud后，我们会使用LeanCloud制作一个SnapChat应用的克隆。


# 制作一个天气信息查询app

制作一个天气信息查询app很简单:

1. 得到天气信息的数据
2. 制作app的UI
3. 实现app逻辑
4. 美化一下

## 构建app UI

首先按照我们惯常的方式创建一个新的Single View Application工程。

随后，可以在Web上找到一个你自己喜欢的背景图片，在View中拖入一个Image View。将背景图片拖入XCode左边的images.xcassets，点击刚刚加入的Image View，在右上角的Image选择背景图片的名字。你会看到图片被加到了Image View中。如果你的图片尺寸和story board中尺寸差异大，图片会被扭曲，这时选择右边属性栏中的``View --> Mode --> Aspect Fill``。

下一步是拖入标题，提示框，文本框，按钮和结果显示的label。最后的形态与下面的UI样式相似:

![day4_weather_UI](http://7u2ql1.com1.z0.glb.clouddn.com/beginner_day4_weather_UI.png)

## 爬取Web数据

有众多的网站都提供天气预报信息，我们的一个直接的方法是直接从这些网站抓取信息。

这个app我们使用http://www.weather-forecast.com/ 的信息。

现在，打开上面这个连接，在右上角的搜索框里搜索一个城市的名字，例如Beijing。这是你会看到北京的各种天气预报。在这些信息中，格外注意上面的地址栏(网页的URL)，注意到搜索后的地址格式非常简单:

```
http://www.weather-forecast.com/locations/Beijing/forecasts/latest
```

当你搜索不同城市的时候改变的只有/locations/和/forecasts中间的部分，即为城市名。

现在我们来看如何用Swift和苹果为我们提供的``NSURLSession``类抓取网页上的数据。

首先创建一个Button点击的事件（可任意起名字）:

```
@IBAction func searchWeatherButton(sender: AnyObject){

}

```

当按钮被点击的时候，我们希望app从指定的url抓取数据。

```
var url = NSURL(string: "http://www.weather-forecast.com/locations/Beijing/forecasts/latest")
```

我们现在将url设置为固定的，未来我们需要将url改成根据文本框输入内容改变。

获取页面HTML数据使用NSURLSession类的sharedSession().dataTaskWithURL函数。这个函数给定URL后会返回指定URL页面内的数据，在completionHandler内处理。

```
let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in

//处理得到的数据

})
```

如何处理这些数据？

![day4_weather_code](http://7u2ql1.com1.z0.glb.clouddn.com/beginner_day4_weather_code.png)

最后，调用task的resume()方法。

```
task.resume()
```

## 美化一下

现在你可以按照自己的喜好美化一下你的app，如果你希望app适用与更多的屏幕尺寸，可以添加自动布局。














