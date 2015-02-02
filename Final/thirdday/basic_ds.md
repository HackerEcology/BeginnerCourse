# 基本数据结构

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


# 链表

链表是一种常见的重要的数据结构。例如要建立一个通讯录，每个通讯记录包括联系人姓名、住址、邮编、电话等等数据项。我们可以考虑使用数组存放数据，但是数组必须预先定义它的固定的长度，如50个联系人。但是一个通信录中的联系人数目很难事先确定，而且人数可能随时会变化。为了能够存储所有联系人数据，必须把数组的大小定义得足够大。显然这样又会浪费内存空间。因此采用链表就可以解决这些问题。

单链表

![](http://jpkc.whu.edu.cn/jpkc2005/alprogram/jpkc/wlkt/course/06_6.files/image001.gif)


单链表采用一组不连续的存储单元存放链表中的数据元素，链表中的每个元素称为结点，而链表的每个结点在存储器中的位置可以是随意的，为了明确链表中的第一个结点的位置，需要一个指针指向链表的表头即第一个数据元素，这个指针称为头指针。每个结点都包含两个部分：一是数据域，用于存储数据元素；另一个是指针域，用于存放指针，该指针指向下一个结点。链表的最后一个结点不再指向任何其它结点，因此称为“链尾”，也称尾结点，它的指针域为NULL值，表示链表到此结束。

###主要操作
- insert(value)
- insertHead(value)
- remove(value)

- description


####新建一个节点类

```
class Node<T: Equatable> {
    var value: T
    var next: Node? = nil

    init(_ value: T){
        self.value = value
    }
}

```

####新建一个LinkedList类
```
    class LinkedList<T: Equatable> : Printable {}
```

- insert(value)

```
func insert(value:T) {
        if head == nil {
            head = Node(value)
        } else {
            var lastNode = head
            while lastNode?.next != nil {
                lastNode = lastNode?.next
            }

            let newNode = Node(value)
            lastNode?.next = newNode
        }
    }

```
- insertHead(value)

```
    func insertHead(value:T) {
        if head == nil {
            self.head = Node(value)
        } else {
            let newNode = Node(value)
            newNode.next = head
            self.head = newNode
        }
    }

```
- remove(value)

```

    func remove(value:T) {
        if head != nil {
            var node = head
            var previousNode: Node<T>? = nil
            while node?.value != value && node?.next != nil {
                previousNode = node
                node = node?.next

            }

            if node?.value == value {
                if node?.next != nil {
                    previousNode?.next = node?.next
                }
                else {
                    previousNode?.next = nil
                }
            }
        }
    }


```
- description

```
   var description : String {
        var node = head
        var description = "\(node!.value)"
        while node?.next != nil {
            node = node?.next
            description += " \(node!.value)"
        }
        return description
    }

```

