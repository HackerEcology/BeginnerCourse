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
