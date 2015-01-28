

//import UIKit



class Queue<Int> : Printable{
    var items: [Int]? = []
    
    func enqueue(value:Int) {
        items?.append(value)
    }
    func dequeue() -> Int?{
        if items?.count > 0{
            let obj = items?.removeAtIndex(0)
            return obj
        }
        else {
            return nil
        }
    }
    
    var isEmpty: Bool {
        if let items = self.items {
            return items.isEmpty
        }
        else {
            return true
        }
    }
    
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
}

var queue = Queue<Int>()

queue.enqueue(0)
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
queue.enqueue(40)

queue.description

queue.dequeue()

queue.description

queue.dequeue()

queue.dequeue()

queue.dequeue()

queue.description

//var items:[Int] = []

//items.append(0)
//items.append(2)

