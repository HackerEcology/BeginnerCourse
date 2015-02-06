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


