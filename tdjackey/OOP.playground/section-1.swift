
public class dog{
    public func bark(){
        println("Wang Wang !!")
    }
    
    private var color = "red"
    private var isPreg: Bool
    
    public init(){
        self.isPreg = false
    }
}


var Dahuang = dog()

println(Dahuang.color)
Dahuang.color = "yellow"
println(Dahuang.color)
Dahuang.bark()


class huntaway : dog{
    
}

var Xiaohuang = huntaway()

Xiaohuang.bark()

println(Xiaohuang.color)

public class chihuahua : dog {
    public func shake(){
        println("I am shaking!!!")
    }
    
    override public func bark(){
        println("Meow!!!!")
    }
}

var Wangcai = chihuahua()
Wangcai.shake()
Wangcai.bark()
//Xiaohuang.shake()

public class chicken{
    public func bark(){
        println("Ge Ge Ge !!!!")
    }
    
    public init(){
        
    }
}

var Lust = chicken()

Dahuang.bark()
Lust.bark()



