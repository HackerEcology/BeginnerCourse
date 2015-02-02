#通过加载JSON文件来配置不同等级

打开Level_1.json，你可以发现它是这样的

![](http://7u2osj.com1.z0.glb.clouddn.com/leveljson.png)

它是一个包含tiles,targetScore,moves三个元素的字典。tile是一个数组,它有9个元素，每个元素表示每一行，如果tile的制是1，这就表示包含了一个Cookie，如果是0就表示是空的。

我们会用一个类来表示Tile,所以新建一个类，这个类非常简单
```
class Tile {
}
```
然后在等级Level类里面声明一个tiles的属性和一个  titleAtColumn方法
```
private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)

func tileAtColumn(column: Int, row: Int) -> Tile? {
  assert(column >= 0 && column < NumColumns)
  assert(row >= 0 && row < NumRows)
  return tiles[column, row]
}
```

tiles是一个二维数组,tileAtColumn是一个你告诉它行和列它会返回tiles数组里Tile的方法，当然如果tiles里没有Tile，它会返回nil

tiles会描述出不同等级棋盘的形状，就像这样
![](http://cdn3.raywenderlich.com/wp-content/uploads/2014/02/JSON-and-tiles.png)

当tiles[a, b]为nil的时候,格子里面就是空的并且不会有Cookie

Level_1.json是一个字典，但现在的字典还没有读取json文件的功能，所以我们可以为Dictionary添加一个读取json文件的功能，为类添加功能可以使用extension关键，就像下面一样

![](http://7u2osj.com1.z0.glb.clouddn.com/extensiondic.png)

上面的代码会让Dictionary有一个读取json文件并且返回一个字典的功能。现在就可以使用它为Level创建一个初始化的方法了！

下面为Level.swift添加一个init方法

![](http://7u2osj.com1.z0.glb.clouddn.com/levelinit.png)

这个方法使用了遍历，通过查看数组的每个元素来看json文件中tile的标识是否为1，如果是1就创建tile，如果为0就不会创建

接下来到Level.swift里面的createInitialCookies里面加一个判断，，如果tiles对应的位置为空，就不创建Cookie

```
if tiles[column, row] != nil {

  var cookieType = ...
  ...
  set.addElement(cookie)
}

```

最后到GameViewController.swift里的viewDidLoad()方法中更改level的初始化方式

```
  level = Level(filename: "Level_1")
```

编译运行，你就可以看见棋盘不再是正方形，而是会随着json文件而改变。


#显示Tile

我们要这样的效果
![](http://cdn5.raywenderlich.com/wp-content/uploads/2014/02/Tiles-layer.png)

阴影的效果其实是一张张的图片

为了方便管理这些图片，现在在GameScene.swift添加一个属性
```
let tilesLayer = SKNode()
```

然后在GameScene.swift里面的init(size:)方法里往gameLayer里添加tileLayer，注意要加在cookiesLayer之前。

然后在GameScene.swift里面加一个addTiles方法

```
func addTiles() {
  for row in 0..<NumRows {
    for column in 0..<NumColumns {
      if let tile = level.tileAtColumn(column, row: row) {
        let tileNode = SKSpriteNode(imageNamed: "Tile")
        tileNode.position = pointForColumn(column, row: row)
        tilesLayer.addChild(tileNode)
      }
    }
  }
}
```
最后在GameViewController.swift的viewDidLoad里面调用scene属性的addTiles方法

#移动Cookie

在这个游戏中你要让玩家通过左右上下滑动来移动Cookie

监测滑动是GameScene的任务，如果玩家在屏幕上触摸了一下Cookie，这可能是个有效移动手势的开始，为什么会是可能？因为有些触摸起始位置虽然在棋盘里面但终止位置在棋盘外面，这就不是个有效的触摸。

为了识别用户的滑动手势，你需要用到GameScene的touchesBegan,touchesMoved,touchEnded方法，它们会帮你控制游戏的滑动。

在GameScene.swift加入两个属性

```
var swipeFromColumn: Int?
var swipeFromRow: Int?
```
这两个属性在用户开始触摸的时候会记录下起始位置Cookie的行和列

然后在init(size:)里面初始化这两个属性

```
swipeFromColumn = nil
swipeFromRow = nil
```
之所以一开始赋给它们空值是因为一开始用户还没有滑动，

接下来在touchesBegan方法里添加下面的代码

![](http://7u2osj.com1.z0.glb.clouddn.com/touchBegan.png)

当用户把触摸到屏幕的时候touchesBegan会被调用，然后我们要得到相对于cookiesLayer的位置，并且把他转换成行和列，这样就会方便许多，然后把行和列赋值给swipeFromColumn和swipeFromRow
,记录下滑动起始位置。

然后需要添加converPoint方法
![](http://7u2osj.com1.z0.glb.clouddn.com/converPoint.png)
看，其实它与 pointForColumn(column:, row:)起到相反的作用
它通过一个与cookieLayer的相对坐标来计算出行和列，如果是无效的位置，比如棋盘外面就会返回(false, 0, 0)

到现在为止你已经检测到了滑动的开始，为了执行一个完整的移动，玩家还需要移动他们的手指到一个其他的地方。滑动到哪里并不重要，你需要关心的是滑动的大致方向而不是准确位置。

监测滑动方向的逻辑会写到touchedMoved里面

![](http://7u2osj.com1.z0.glb.clouddn.com/touchmoved.png)

*hideSelectionIndicator可以暂时不添加*

开始的时候会判断swipeFromColumn是否为nil，如果为nil可能这是个无效的滑动，所以你就可以直接返回忽略下面的代码。这就是设置swipeFromColumn为optional的原因。

下面我们会获你的触摸位置，这会和touchesBegan里面获取位置的方法差不多，然后会计算出在用户手指移动到的行和列。

然后我们会通过比较移动到的行和列与开始移动的行和列来确定滑动的方向。如果符合滑动的条件的话就调用trySwapHorizontal:vertical方法来准备滑动曲奇！

最后设置swipeFromColumn为nil，起到重置下一次滑动的作用。

然后我们来写trySwapHorizontal:vertical的方法,这个方法会在游戏的Model中来Swap Cookie(注意还没有作出动画）

![](http://7u2osj.com1.z0.glb.clouddn.com/trySwap.png)

为什么这个方法会有个try?因为这时候你只知道玩家滑动的上下左右，但那里有可能没有Cookie，比如在边界的时候，所以你要try一下，trySwapHorizontal:vertical的方法首先会通过传进来的delta值来计算出你要滑动到的行和列。

然后判断这个行和列，看它们是不是在9*9的棋盘里面，如果不是，就结束方法。

接下来去检查以确保在棋盘中是否真正有Cookie，这在有一些沟槽的地方会很有用

最后我们打印一句话来显示这个移动从哪个Cookie来到哪个Cookie

接下来我们要实现touchesEnded和touchesCancelled,touchesEnded会在玩家抬起手指的时候被调用而touchesCancelled会在触摸被打断(例如你在触摸的时候这时来了一个电话)的时候调用

```
override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
  swipeFromColumn = nil
  swipeFromRow = nil
}

override func touchesCancelled(touches: NSSet, withEvent event: UIEvent) {
  touchesEnded(touches, withEvent: event)
}
```
在touchesEnded方法中你要重置swipeFromColumn和swipeFromRow为nil

