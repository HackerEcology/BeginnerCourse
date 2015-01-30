class Stack<Int>{
    
    var items: [Int]? = []
    
    func push(value:Int){
        items?.append(value)
    }
    
    func top() -> Int?{
        if let value = items?.last{
            return value
        }
        return nil
    }
    
    func pop() -> Int?{
        if let value = self.top(){
            items?.removeLast()
            return value
        }
        return nil
    }
}

var stack = Stack<Int>()

stack.push(1)

stack.top()
stack.push(2)
stack.push(2)
stack.push(3)




class Queue<T: Equatable> {
    var items: [T]? = []
    
    func enqueue(value:T){
        items?.append(value)
    }
    
    func dequeue() -> T?{
        if items?.count > 0{
            let obj = items?.removeAtIndex(0)
            return obj
        }
        else{
            return nil
        }
    }
    
    
    var isEmpty: Bool {
        if let items = self.items{
            return items.isEmpty
            //return false
        }
        else {
            return true
        }
        
    }
    
    
    var description : String {
        var description = ""
        if let tempItems = self.items{
            while !(self.isEmpty){
                //description = description + "\(self.dequeue()!)"
                description += "\(self.dequeue()!)"
            }
            self.items = tempItems
        }
        
        return description
    }
    
}

var queue = Queue<String>()

queue.enqueue("1")
queue.enqueue(" red ")
queue.enqueue(" Gong ")
queue.enqueue(" ")

queue.description

queue.dequeue()
queue.isEmpty
queue.dequeue()
queue.dequeue()
queue.dequeue()

queue.isEmpty

queue.description



queue.description


class Node<T: Equatable> {
    var value: T
    var next: Node? = nil
    
    init(_ value : T){
        self.value = value
    }
}


class LinkedList<T: Equatable> {
    
    var head: Node<T>? = nil
    
    func insert(value:T){
        if head == nil{
            head = Node(value)
        }else{
            var lastNode = head
            while lastNode?.next != nil {
                lastNode = lastNode?.next
            }
            let newNode = Node(value)
            lastNode?.next = newNode
            
        }
    }
    
    
    func insertHead(value:T) {
        if head == nil {
            self.head = Node(value)
        }else {
            let newNode = Node(value)
            newNode.next = head
            self.head = newNode
        }
    }
    
    func remove(value: T){
        if head != nil{
            var node = head
            var previousNode: Node<T>? = nil
            
            while node?.value != value && node?.next != nil{
                previousNode = node
                node = node?.next
            }
            
            if node?.value == value {
                if node?.next != nil{
                    previousNode?.next = node?.next
                }
                else{
                    previousNode?.next = nil
                }
            }
            
        }
        
    }
    
    var description : String {
        
        var node = head
        
        var description = "\(node!.value)"
        while node?.next != nil {
            node = node?.next
            description += " \(node!.value)"
        }
        return description
    }
    
    
}

var linkedlist = LinkedList<Int>()


linkedlist.insert(2)
linkedlist.insert(3)
linkedlist.insert(4)

linkedlist.description

linkedlist.remove(3)

linkedlist.description


var linkedlist1 = LinkedList<String>()

linkedlist1.insert("tom")
linkedlist1.insert("jack")
linkedlist1.insert("salt")

linkedlist1.description
















