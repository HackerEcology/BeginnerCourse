# Parse

##简介

Parse 平台为移动应用程序提供完整的后台解决方案。


###连接你的APP到Parse上

下载parse提供的SDK

找到AppDelegate.swift
```
// Uncomment and fill in with your Parse credentials:
        Parse.setApplicationId("0iH86ncChuoaVD2tgRyUt1vGRKcmAvichG0C46dq", clientKey: "KzDlQbGDr7kDzZbSEQ08rPFpg1dK0jJOhNu7Oaud")
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

注册用户

```

var object = PFUser()
object.username = "tdjackey"
object.password = "123"
object.signUpInBackgroundWithBlock { (Bool ifSuccess, NSError error) -> Void in
    if error != nil{
        println("registration error")
        //NSString errorString = "registration error"
    }else{
        println("registration successful.")
    }
}
```

