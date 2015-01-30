# Queue

队列(queue) 先进先出的线性表

队列只允许在后端（称为rear）进行插入操作，在前端（称为front）进行删除操作。


- 队尾(rear) : 只能进行插入
- 队头(front) : 只能进行删除和查询

###基本操作
- enqueue()
- dequeue()
- isEmpty
- description

#####先进先出(FIFO ‐ First In First Out) 先入队的元素,必先出队

新建一个Queue 类

```
class Queue<Int> : Printable{}
```
- enqueue()
```
func enqueue(value:Int) {
        items?.append(value)
}
```

- dequeue()
```
    func dequeue() -> Int?{
        if items?.count > 0{
            let obj = items?.removeAtIndex(0)
            return obj
        }
        else {
            return nil
        }
    }
```

- isEmpty
```
    var isEmpty: Bool {
        if let items = self.items {
            return items.isEmpty
        }
        else {
            return true
        }
    }
```
- description
```
    var description : String {
        var description = ""
        if let tempItems = self.items {
            while !(self.isEmpty){
                description += "\(self.dequeue()!) "
            }
            self.items = tempItems
        }
        return description
    }
```
完整测试代码


