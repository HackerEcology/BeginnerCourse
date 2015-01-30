# Stack



### 栈(stack)
是特殊的序列 只能在特定一端(栈顶)插入、删除;另一端(栈底)禁止 严格说,查找操作也是如此
###基本函数
- Push()
- Pop()
- Top()

#####后进先出(LIFO, Last In First Out)


新建一个Stack 类

    class Stack<Int> {}


基于数组实现的栈
    新建一个数组变量items
```
var items: [Int]? = []
```
Push()函数

```
func push(value:Int){
        items?.append(value)
}
```
Pop()函数

```
    func pop() -> Int? {
        if let value = self.peek(){
            items?.removeLast()
            return value
        }

        return nil
    }
```

Top()函数

```
    func top() -> Int?{
        if let value = items?.last{
            return value
        }

        return nil
    }
```

测试代码
```
class Stack<Int> {

    var items: [Int]? = []

    func push(value:Int){
        items?.append(value)
    }

    func pop() -> Int? {
        if let value = self.peek(){
            items?.removeLast()
            return value
        }

        return nil
    }

    func top() -> Int?{
        if let value = items?.last{
            return value
        }

        return nil
    }
}

var stack = Stack<Int>()

stack.push(0)

stack.push(1)

stack.push(20)


stack.peek()

stack.pop()
stack.pop()

stack.peek()

```
