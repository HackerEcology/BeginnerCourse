
//Stack

class Stack<Int> {
    
    var items: [Int]? = []
    
    func push(value:Int){
        items?.append(value)
    }
    
    func pop() -> Int? {
        if let value = self.top(){
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


stack.top()

stack.pop()
stack.pop()

stack.top()
