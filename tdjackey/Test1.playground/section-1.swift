
public class dog{
    public func bark(){
        println("Open Mouth")
        println("Wang Wnag!!")
        println("shut Mouth!!")
    }
    
    private var color = " "
    private var isPreg: Bool = false
    
    public init(){
        //self.isPreg = false
    }
    
}


var Dahuang = dog()
Dahuang.bark()
Dahuang.color = "yellow"
Dahuang.isPreg = true
println(Dahuang.color)
println(Dahuang.isPreg)


public class huntaway : dog {
    
}

var Xiaohuang = huntaway()
Xiaohuang.bark()

public class chihuahua : dog{
    public func shake(){
        println("I am shaking !!!")
    }
    
    override public func bark(){
        println("Meow!!!")
    }
}

var Wangcai = chihuahua()
Wangcai.shake()

Dahuang.bark()
Xiaohuang.bark()
Wangcai.bark()

