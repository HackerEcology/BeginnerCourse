
###Hey,我们将要制作一个和Candy Crush Saga类似的游戏,也就是糖果传奇，听起来很酷是不是？我们会叫它CookieCrush，这意味着你移动的不再是糖果而是曲奇。听起来更美味了，一起来吧！

# 1.为游戏添加背景
在GameScene.swift的初始化函数中添加下面的代码
```
    anchorPoint = CGPoint(x: 0.5, y: 0.5)

    let background = SKSpriteNode(imageNamed: "Background")
    addChild(background)
```
这会把背景图片从image.xcassets里面装载出来并且展示到屏幕上

![](http://cdn3.raywenderlich.com/wp-content/uploads/2014/02/Background-image.png)

# 2.上曲奇

你第一步要做的是要在屏幕上显示这些糖果，如何去方便地管理他们？这时候你就需要一个坐标系，在这个游戏中我们会以9*9的坐标系来演示，每方格里都包含一个曲奇。

![](http://cdn5.raywenderlich.com/wp-content/uploads/2014/02/2D-grid.png)

###构建Cookie类和CookieType枚举

![](http://7u2osj.com1.z0.glb.clouddn.com/classcookie.png)

Cookie会有一个列属性和一个行属性，列和行在Cookie类中表示其在2D网格中的位置。
Cookie会有一个它的种类，为了方便，你需要定义它为一个枚举类型。
Cookie会有一个精灵属性，它负责Cookie在View中的显示，精灵的属性是可以选择的，因此勾选SKSpriteNode的问号，因为cookie对象并不一定存在它的精灵。

![](http://7u2osj.com1.z0.glb.clouddn.com/enumcookietype.png)

为了使CookieType枚举类型使用更方便，你需要加入一个声明属性到CookieType里面

接下来CookieType这个枚举类型需要一个静态方法，调用这个静态方法后会随机产生一个CookieType，这个方法很有用，因为在游戏开始的时候你需要随机的布局整个9*9的棋盘

arc4random_uniform(6)这个方法在0和5之间生成一个随机数，然后添加1，你就会得到1或6之间的数字。因为Swift是类型安全的语言，所以arc4random_uniform()返回的一个UInt32类型需要转换转换成Int类型

*为什么你不用Cookie类作为SKSpriteNode的子类？因为Model是你游戏的核心 !*

如果你声明一个Cookie对象并直接打印的话，你会得到类名，很显然在调试的时候你希望得到的是这个对象的详细属性，所以你需要使Cookie类遵循 Printable这个协议

# 3.用二维数组存数棋盘数据

![](http://7u2osj.com1.z0.glb.clouddn.com/array2d.png)

现在你可以用这样的方式来访问Cookie集合中的Cookie

```
let myCookie = cookies[column, row]
```

# 4.准备集合

```
struct Set<T: Hashable>: SequenceType, Printable {
  private var dictionary = Dictionary<T, Bool>()

  mutating func addElement(newElement: T) {
    dictionary[newElement] = true
  }

  mutating func removeElement(element: T) {
    dictionary[element] = nil
  }

  func containsElement(element: T) -> Bool {
    return dictionary[element] != nil
  }

  func allElements() -> [T] {
    return Array(dictionary.keys)
  }

  var count: Int {
    return dictionary.count
  }

  func unionSet(otherSet: Set<T>) -> Set<T> {
    var combined = Set<T>()

    for obj in dictionary.keys {
      combined.dictionary[obj] = true
    }

    for obj in otherSet.dictionary.keys {
      combined.dictionary[obj] = true
    }

    return combined
  }

  func generate() -> IndexingGenerator<Array<T>> {
    return allElements().generate()
  }

  var description: String {
    return dictionary.description
  }
}

```
虽然代码可以多，不过你应该能了解这些方法的大致作用。你可以添加元素到集合里，移除元素到集合里，查看某一元素是否在集合里，unionSet()这个方法可以把两个集合连接起来。

# 5.构建等级类

```
import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
  private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)

  func cookieAtColumn(column: Int, row: Int) -> Cookie? {
     assert(column >= 0 && column < NumColumns)
     assert(row >= 0 && row < NumRows)
     return cookies[column, row]
  }
}
```

assert是断言，如果不符合括号里面的条件，app就会crash掉，这很有用，因为它会帮你找到错误的位置

接下来往Level里面添加两个方法

```
func shuffle() -> Set<Cookie> {
  return createInitialCookies()
}

private func createInitialCookies() -> Set<Cookie> {
  var set = Set<Cookie>()

  // 1
  for row in 0...NumRows - 1 {
    for column in 0...NumColumns - 1 {

      // 2
      var cookieType = CookieType.random()

      // 3
      let cookie = Cookie(column: column, row: row, cookieType: cookieType)
      cookies[column, row] = cookie

      // 4
      set.addElement(cookie)
    }
  }
  return set
}
```
shuffle方法会调用createInitialCookies这个方法，这个方法会在开始的时候为我们创造一些Cookie，这个方法会有四部

1. 遍历棋盘的每一列和每一行，这样格式的循环在这个教程中非常常见，以后你还会见到很多
2. 调用CookieType的random方法来随机获取一个Cookie的种类
3. 生成一个指定行，列以及种类的Cookie
4. 把Cookie添加到集合中


接下来打开GameScene.swift

```
var level: Level!

let TileWidth: CGFloat = 32.0
let TileHeight: CGFloat = 36.0

let gameLayer = SKNode()
let cookiesLayer = SKNode()
```
GameScene里面会有一个等级的属性，这个属性非常重要，它会负责当前等级的游戏逻辑

tileWidth,tileHeight表示格子的宽和高 gameLayer和cookieLayer会是两个节点，gameLayer会是cookieLayer的父节点，它还会有另一个子节点，这个子节点会表示遮住Cookie的阴影，在后面的教程会讲到它。

接下来往GameScene添加两个方法
```
func addSpritesForCookies(cookies: Set<Cookie>) {
  for cookie in cookies {
    let sprite = SKSpriteNode(imageNamed: cookie.cookieType.spriteName)
    sprite.position = pointForColumn(cookie.column, row:cookie.row)
    cookiesLayer.addChild(sprite)
    cookie.sprite = sprite
  }
}

func pointForColumn(column: Int, row: Int) -> CGPoint {
  return CGPoint(
          x: CGFloat(column)*TileWidth + TileWidth/2,
          y: CGFloat(row)*TileHeight + TileHeight/2)
}
```
addSpritesForCookies这个方法接收一个Cookie的集合，并把他们添加到Gamescene中，这样就可以显示在屏幕上了。

接下来在GameViewController.swift添加一个level的属性

```
var level: Level!
```
然后添加两个方法

```
func beginGame() {
  shuffle()
}

func shuffle() {
  let newCookies = level.shuffle()
  scene.addSpritesForCookies(newCookies)
}

```
beginGame通过调用shuffle方法来开始游戏，在shuffle方法里你可以调用Level类的shuffle方法，它会返回一个Cookie的集合

然后在GameViewController的viewDidLoad方法里初始化level和调用beginGame方法

```
override func viewDidLoad() {

  level = Level()
  scene.level = level
  skView.presentScene(scene)
   ...
  beginGame()
}

```
然后棋盘就出现了！

![](http://cdn3.raywenderlich.com/wp-content/uploads/2014/02/First-cookies.png)
