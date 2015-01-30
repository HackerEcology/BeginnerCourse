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

