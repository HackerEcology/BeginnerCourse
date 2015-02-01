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

