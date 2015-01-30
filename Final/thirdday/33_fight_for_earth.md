# fight for earth

# 为地球而战

今天我们要用SpriteKit做一个游戏

它看起来是这样的

![](http://7u2osj.com1.z0.glb.clouddn.com/battleearth.png)

很炫酷吧,你驾驶者一艘宇宙飞船去击退那些意图想占领地球的外星飞船们！好，那我们现在就开始

##1.设置背景音乐

首先我们会在进入游戏的时候播放很带感的音乐，那么怎么播放音乐呢？
你只需要这样就可以设置了
```
setMusic(musicName:String)
```
播放音乐需要这么设置


*Tips: AVAudioPlayer的实际用法*
```
let musicURL = NSBundle.mainBundle().URLForResource(“music", withExtension: "mp3")!
var backgroundMusicPlayer = AVAudioPlayer(contentsOfURL: musicURL, error: nil)
backgroundMusicPlayer.numberOfLoops = -1
backgroundMusicPlayer.prepareToPlay()
backgroundMusicPlayer.play()
```

那么就在init方法下面提示的位置调用它吧，完成后看起来是这样的
```
    override init(size:CGSize){
        //在这下面设置背景音乐
            setMusic("music")
    }
```

这样一打开

##2.设置背景

我们还要为游戏设置一个黑色的背景，这会让他看起来很酷！

为场景设置颜色需要这么做

```
self.backgroundColor = SKColor.blackColor()
```

同样在场景的初始化方法init里面加上这段话


##3.设置飞船
设置飞船只需要这样！
```
setSpaceShip()
```
*Tips: 设置飞船的详细用法*
```
    private func setSpaceShip() {
        spaceShip = SKSpriteNode(imageNamed: "spaceship")
        spaceShip.position = CGPointMake(self.frame.size.width/2, spaceShip.size.height/2 + 20)
        self.addChild(spaceShip)
    }
```


实际上这是用一幅飞船的图片来生成一个SKSpriteNode，然后再把它加到GameScene里面，在这里面你只需要注意一下飞船的位置问题
*Tips 飞船的实际设计方法*


##4.设置外星飞船
外星飞船的设置并不复杂，你要注意两点，第一随机生成外星飞船的位置，让它从不同的地点落下来，第二为了使游戏更有趣，我们要使飞船下落的速度不一样！

飞船下落速度不一样这个表现方式你可以使外星飞船移动到屏幕下方的时间不一样来实现。

*具体的实现方法可以参看addAlien这个方法*

生成随机数方面会有一点繁琐，所以我们替你做了这些事情，现在你要做的就是使用
```
addAlien()
```
这个方法，就会产生一个外星飞船并且从屏幕最上方任意位置落下来。

##5.让外星飞船源源不断的落下来
我们很强大，一个敌人是不能满足我们的战斗欲望的，所以我们需要源源不断的飞船落下来，这时候就要用到
```
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        /* 在渲染每一帧的时候会被调用 */

    }
```
这个方法了，它很简单，只有一个参数，会告诉你现在的时间。
并且它在系统渲染每一帧的时候都会被调用。
我的想法是每过一秒就生成一个外星飞船，当然后面你也可以随着等级的增加而逐渐加快速度以提高难度。
currentTime是一个小数，记录着现在的时间，单位是秒。想记录时间·
```
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        /* 在渲染每一帧的时候会被调用 */
        updateCount++
        if updateCount > 60 {
            addAlien()
            updateCount = 0
        }
    }
```


##6.设置子弹音效
为了使游戏更炫酷，我们决定为子弹加一些音效！
So,Let's make some noised'

```
setBulletSound("bullet")
```
```
  private func setBulletSound(soundName: String) {
        self.runAction(SKAction.playSoundFileNamed("\(soundName).mp3", waitForCompletion: false))
    }
```

因为这个设计的声音很短促，所以我们会调用SKAction的playSoundFileNamed:waitForCompletion这个方法，这个方法会更适合游戏中的音效。

##7.设置子弹
在屏幕上显示发射的子弹需要一点向量的知识，不过这并不会很难，具体的算法就是取得你触摸点的位置。并且与飞船的中心坐标相减得到一个向量。他看起来是这样的

![](http://7u2osj.com1.z0.glb.clouddn.com/vector.png)

```
addBullet(location: CGPoint)
```
**具体的实现方法可以参看addBulllet这个方法**



##8.游戏胜利

我们默认打掉十个外星飞船就会游戏胜利

每次外星飞船碰到子弹都会调用这个方法

```
private func bulletDidCollideWithAlien(bullet:SKSpriteNode, alien:SKSpriteNode)
```
所以我们可以每次这个方法被调用的时候将aliensDestroyed这个变量加1
然后检测如果达到10，就运行下面的gameover()方法

```
gameWin()
```
