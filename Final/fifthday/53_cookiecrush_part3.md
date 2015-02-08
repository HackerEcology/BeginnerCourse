# 5.3 给Swap创建动画

为了描述两个Cookie之间的Swap，你需要创建一个新的数据类型Swap

```
struct Swap: Printable {
  let cookieA: Cookie
  let cookieB: Cookie

  init(cookieA: Cookie, cookieB: Cookie) {
    self.cookieA = cookieA
    self.cookieB = cookieB
  }

  var description: String {
    return "swap \(cookieA) with \(cookieB)"
  }
}
```

然后在GameScene.swift中加入一个处理Swap的属性，这个属性是一个函数，它用来在GameViewController中处理Swap

```
var swipeHandler: ((Swap) -> ())?
```
它看起来有点怪异，其实它是一个接收一个Swap，没有返回值的函数

接着在 trySwapHorizontal(vertical:)这个方法里面，println后面再加上下面的代码

```
if let handler = swipeHandler {
  let swap = Swap(cookieA: fromCookie, cookieB: toCookie)
  handler(swap)
}
```

这里用Swap的构造函数生成了一个Swap对象，并把它交给handler处理

GameViewController会去判断是否这个swap是有效的，如果它是有效的，你就需要为转换执行动画了

然后在GameScene中加入animateSwap这个方法

```
func animateSwap(swap: Swap, completion: () -> ()) {
  let spriteA = swap.cookieA.sprite!
  let spriteB = swap.cookieB.sprite!

  spriteA.zPosition = 100
  spriteB.zPosition = 90

  let Duration: NSTimeInterval = 0.3

  let moveA = SKAction.moveTo(spriteB.position, duration: Duration)
  moveA.timingMode = .EaseOut
  spriteA.runAction(moveA, completion: completion)

  let moveB = SKAction.moveTo(spriteA.position, duration: Duration)
  moveB.timingMode = .EaseOut
  spriteB.runAction(moveB)
}
```
这个方法传入一个swap并且去用动画表现它

光有动画是不行的，我们还必须在游戏的Model中改变Cookie的位置，所以到Level.swift中添加下面这个方法

```
func performSwap(swap: Swap) {
  let columnA = swap.cookieA.column
  let rowA = swap.cookieA.row
  let columnB = swap.cookieB.column
  let rowB = swap.cookieB.row

  cookies[columnA, rowA] = swap.cookieB
  swap.cookieB.column = columnA
  swap.cookieB.row = rowA

  cookies[columnB, rowB] = swap.cookieA
  swap.cookieA.column = columnB
  swap.cookieA.row = rowB
}
```
这个方法就在Model中改变了Cookie的布局

然后在GameViewController.swift中加入下面的代码

```
func handleSwipe(swap: Swap) {
  view.userInteractionEnabled = false

  level.performSwap(swap)

  scene.animateSwap(swap) {
    self.view.userInteractionEnabled = true
  }
}
```
因为需要在玩家出发一个滑动的时候关闭屏幕交互，所以需要在GameViewController中去swap的完整的处理。


```
func handleSwipe(swap: Swap) {
  view.userInteractionEnabled = false

  level.performSwap(swap)

  scene.animateSwap(swap) {
    self.view.userInteractionEnabled = true
  }
}
```
现在你就可以移动Cookie了！

![](http://cdn1.raywenderlich.com/wp-content/uploads/2014/02/Swap-cookies.gif)


#高亮曲奇
在真正的Candy Crush Saga中你点击每一个糖果都会有一个高亮的效果，这其实很简单，你只需要在Cookie的Sprite上再加一个图片就行了，很显然这个图片会用到SKSpriteNode，所以在GameScene.swift中加入一个属性

```
var selectionSprite = SKSpriteNode()
```

然后加入下面的代码

```
func showSelectionIndicatorForCookie(cookie: Cookie) {
  if selectionSprite.parent != nil {
    selectionSprite.removeFromParent()
  }

  if let sprite = cookie.sprite {
    let texture = SKTexture(imageNamed: cookie.cookieType.highlightedSpriteName)
    selectionSprite.size = texture.size()
    selectionSprite.runAction(SKAction.setTexture(texture))

    sprite.addChild(selectionSprite)
    selectionSprite.alpha = 1.0
  }
}
```
这个方法会让一个cookie有高亮的效果

然后我们还需要一个方法来做消失的效果

```
func hideSelectionIndicator() {
  selectionSprite.runAction(SKAction.sequence([
    SKAction.fadeOutWithDuration(0.3),
    SKAction.removeFromParent()]))
}
```
这个方法通过我们很熟悉的fadeOutWithDuration的方法来移除sprite

现在就差调用这些方法了，因为我们要在点击的时候加上高亮的效果,然后再移动的时候让效果消失
那现在就在touchesBegan里面的if let cookie = ...里面加上

```
showSelectionIndicatorForCookie(cookie)
```

然后再touchesMoved里面的trySwapHorizontal后面调用hideSelectionIndicator()
最后如果玩家点击以后没有滑动手指就离开屏幕的话你也要让高亮效果消失所以在touchesEnded()最上面加上下面的代码

```
if selectionSprite.parent != nil && swipeFromColumn != nil {
  hideSelectionIndicator()
}
```
现在点击就可以看见高亮的效果了！
![](http://cdn3.raywenderlich.com/wp-content/uploads/2014/02/Highlighted-cookies.gif)

#整理棋盘

现在随机生成的棋盘会有链，现在我们暂时还没考虑到消除，所以在生成的时候你需要做一些检测

在Level.swift里面的createInitialCookies()里面把随机生成cookieType的那一行换成下面的代码

```
var cookieType: CookieType
do {
  cookieType = CookieType.random()
}
while (column >= 2 &&
        cookies[column - 1, row]?.cookieType == cookieType &&
        cookies[column - 2, row]?.cookieType == cookieType)
   || (row >= 2 &&
        cookies[column, row - 1]?.cookieType == cookieType &&
        cookies[column, row - 2]?.cookieType == cookieType)
```
其实他是在比较左边以及下边的cookieType是否和它自己一样，如果一样的话就会重新生成一个cookieType

这样初始棋盘就不再会有链了
![](http://cdn5.raywenderlich.com/wp-content/uploads/2014/02/No-chains-in-initial-state.png)
#不是所有的Swap都是允许的

![](http://cdn4.raywenderlich.com/wp-content/uploads/2014/02/Allowed-swap.png)

你需要在转换的时候加一些逻辑来检测转换是否会导致一个链。

我们需要一个集合来存储可能的Swap，所以在Level.swift里面加一个新的属性

```
private var possibleSwaps = Set<Swap>()
```

因为需要比较两个Swap，所以需要用到运算符重载在Swap.swift

```
func ==(lhs: Swap, rhs: Swap) -> Bool {
  return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB) ||
         (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
}
```
在每一轮的开始你需要检测那些cookie是可以swap的，所以到Level.swift中将shuffle()做一些改变

```
func shuffle() -> Set<Cookie> {
  var set: Set<Cookie>
  do {
    set = createInitialCookies()
    detectPossibleSwaps()
    println("possible swaps: \(possibleSwaps)")
  }
  while possibleSwaps.count == 0

  return set
}
```
像之前一样，执行createInitialCookies来填补随机的cookie的格子。然后在它调用之后再执行一个新的方法，detectPossibleSwaps()，来填满新的possibleSwaps集合。

在非常少见的情况下，你最终分配运行任何互换的cookies，这个循环会一直执行下去，你可以测试这个小的网格，比如3*3的网格，我有一个这样的，在项目中叫做Level_4.json。

还有执行使用一个辅助方法detectPossibleSwaps()，看看cookie相连的部分，接着添加如下方法：

```
func hasChainAtColumn(column: Int, row: Int) -> Bool {
  let cookieType = cookies[column, row]!.cookieType

  var horzLength = 1
  for var i = column - 1; i >= 0 && cookies[i, row]?.cookieType == cookieType;
        --i, ++horzLength { }
  for var i = column + 1; i < NumColumns && cookies[i, row]?.cookieType == cookieType;
        ++i, ++horzLength { }
  if horzLength >= 3 { return true }

  var vertLength = 1
  for var i = row - 1; i >= 0 && cookies[column, i]?.cookieType == cookieType;
        --i, ++vertLength { }
  for var i = row + 1; i < NumRows && cookies[column, i]?.cookieType == cookieType;
        ++i, ++vertLength { }
  return vertLength >= 3
}
```
链是连续三个或三个以上相同类型的cookie的行或者列，这种方法可能看起来有点奇怪，那是因为在for-statements有很多内部的逻辑。
![](http://cdn1.raywenderlich.com/wp-content/uploads/2014/02/Look-left-right-up-down.png)
给定一个特定的cookie在一个特定的方格网络内，看这个方法的左边，只要找到相同类型的cookie，他就会增加horzLength，简洁的表达了这行代码的意思。

```
for var i = column - 1; i >= 0 && cookies[i, row]?.cookieType == cookieType; --i, ++horzLength { }
```

```
for var i = column - 1;  // 从当前cookie的左边开始

  i >= 0 &&                                   // 继续执行直到不是最左边的列
  cookies[i, row]?.cookieType == cookieType;  // 同样类型的cookie

  --i,                   // 到左边的下一列
  ++horzLength           // 增加长度
  { }                    // 循环里不做任何事
```
下面你可以实现detectPossibleSwaps()


```
func detectPossibleSwaps() {
  var set = Set<Swap>()

  for row in 0..NumRows {
    for column in 0..NumColumns {
      if let cookie = cookies[column, row] {

        // TODO: detection logic goes here
      }
    }
  }

  possibleSwaps = set
}
```
这是非常简单的方法：遍历行和列，并对每一个点进行检测，如果有一个cookie可以进行swap，且不是一个空的网格，他将执行检测的逻辑。最后，这个方法将放进possibleSwaps方法中。


添加如下代码在这里检测消除逻辑：

```
// 这个饼干可以右边的交换么
if column < NumColumns - 1 {
  // Have a cookie in this spot? If there is no tile, there is no cookie.
  if let other = cookies[column + 1, row] {
    // Swap them
    cookies[column, row] = other
    cookies[column + 1, row] = cookie

    // Is either cookie now part of a chain?
    if hasChainAtColumn(column + 1, row: row) ||
       hasChainAtColumn(column, row: row) {
      set.addElement(Swap(cookieA: cookie, cookieB: other))
    }

    // Swap them back
    cookies[column, row] = cookie
    cookies[column + 1, row] = other
  }
}
```

尝试着交换当前右边的cookie，如果存在。并且导致这一连串的cookie凑成了三个或三个以上，那将这个交换后生成的链对象添加到这个集合。

将下面以下的代码添加到上面去

```
if row < NumRows - 1 {
  if let other = cookies[column, row + 1] {
    cookies[column, row] = other
    cookies[column, row + 1] = cookie

    // Is either cookie now part of a chain?
    if hasChainAtColumn(column, row: row + 1) ||
       hasChainAtColumn(column, row: row) {
      set.addElement(Swap(cookieA: cookie, cookieB: other))
    }

    // Swap them back
    cookies[column, row] = cookie
    cookies[column, row + 1] = other
  }
}
```
这样是再做完全相同的事情，但是对上下的cookie，而不是左右的cookie。

总之这个算法执行后，将检查它时候能导致交换后相连，然后撤销，记录每一个它发现的链表。

现在运行程序，你应该会看到类似Xcode这种的调试面板：

```
possible swaps: [
swap type:SugarCookie square:(6,5) with type:Cupcake square:(7,5): true,
swap type:Croissant square:(3,3) with type:Macaroon square:(4,3): true,
swap type:Danish square:(6,0) with type:Macaroon square:(6,1): true,
swap type:Cupcake square:(6,4) with type:SugarCookie square:(6,5): true,
swap type:Croissant square:(4,2) with type:Macaroon square:(4,3): true,
. . .
```
#Swap or Not Swap
我们要充分利用这个列表举出来的例子。在Level.swift添加以下方法:
```
func isPossibleSwap(swap: Swap) -> Bool {
  return possibleSwaps.containsElement(swap)
}
```


最后在GameViewController.swift 调用，并且添加handleSwipe() 这个方法：

```
func handleSwipe(swap: Swap) {
  view.userInteractionEnabled = false

  if level.isPossibleSwap(swap) {
    level.performSwap(swap)
    scene.animateSwap(swap) {
      self.view.userInteractionEnabled = true
    }
  } else {
     view.userInteractionEnabled = true
  }
}
```
现在这个游戏中只会执行在可换列表中认可的交换对象。

Build and run 。如果他们导致相链，那他们就能互换![](http://cdn2.raywenderlich.com/wp-content/uploads/2014/02/Ignore-invalid-swap.gif)

注意，执行互换后，“有效的互换”列表就成了无效的了。所以我们得在下一个部分去修改。

要对无效的互换进行又去的动画展示，所以我们在GameScene.swift添加以下方法：

```
func animateInvalidSwap(swap: Swap, completion: () -> ()) {
  let spriteA = swap.cookieA.sprite!
  let spriteB = swap.cookieB.sprite!

  spriteA.zPosition = 100
  spriteB.zPosition = 90

  let Duration: NSTimeInterval = 0.2

  let moveA = SKAction.moveTo(spriteB.position, duration: Duration)
  moveA.timingMode = .EaseOut

  let moveB = SKAction.moveTo(spriteA.position, duration: Duration)
  moveB.timingMode = .EaseOut

  spriteA.runAction(SKAction.sequence([moveA, moveB]), completion: completion)
  spriteB.runAction(SKAction.sequence([moveB, moveA]))
}
```
这种方法类似于animateSwap(swap:, completion:),但在这里cookies将会获得新的位置，然后立即翻转回来。

在GameViewController.swift,改一下else-clause handleSwipe():

```
} else {
  scene.animateInvalidSwap(swap) {
    self.view.userInteractionEnabled = true
  }
}

```
现在运行以下这个程序，试着做一个交换动作，不会导致相链状态。
![](http://cdn3.raywenderlich.com/wp-content/uploads/2014/02/Invalid-swap.gif)


员教程[这里](http://www.raywenderlich.com/75270/make-game-like-candy-crush-with-swift-tutorial-part-1)
