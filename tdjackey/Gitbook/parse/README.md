# Parse


##简介

Parse 平台为移动应用程序提供完整的后台解决方案。


```
score: 1337, playerName: "Sean Plott", cheatMode: false
```


保存对象

假如您想要将上述 GameScore 保存到 Parse 云中。保存接口与 NSMutableDictionary 类似，多了 saveInBackground 方法：

```
var gameScore = PFObject(className:"GameScore")
gameScore["score"] = 1337
gameScore["playerName"] = "Sean Plott"
gameScore["cheatMode"] = false
gameScore.saveInBackground()
```


