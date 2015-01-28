/*
class Recursion {
    func printFirstNumbers(N: Int) {
        println(N)
        if N > 1 {
            printFirstNumbers(N - 1)
        }
        //println(N)
    }
}

var tempR = Recursion()

tempR.printFirstNumbers(3)

//printFirstNumbers(1)

func printFirstNumbers(N: Int) {
    println("start printFirstNumbers(\(N))")
    
    if N > 1 {
        println("printFirstNumbers(\(N)) calls printFirstNumbers(\(N-1))")
        
        printFirstNumbers(N - 1)
    }
    
    println("printFirstNumbers(\(N)) will print \(N)")
    
    println("end printFirstNumbers(\(N))")
}

printFirstNumbers(3)
*/


func fibonacci(i: Int) -> Int {
    if i <= 2 {
        return 1
    }else {
        return fibonacci(i - 1) + fibonacci(i - 2)
    }
}

fibonacci(3)

fibonacci(10)



func pow(x: Double , y: Int) -> Double {
    if y == 0 {
        return 1
    }else {
        return x * pow(x, y-1)
    }
}
pow(2, 2)

func fac(N: Int) -> Int {
    
    if N == 1 {
        return 1
    } else {
        return N * fac(N-1)
    }

}
fac(3)

func f(a: Int, b: Int) -> Int {
    //println(a)
    if b == 0 {
        return a
    }else {
        if a > b{
            return f(a-b, b)
        }else{
            return f(a, b-a)
        }
    }
}

println(f(10, 2))






var ans = pow(0.9, 8)

7 * ans








