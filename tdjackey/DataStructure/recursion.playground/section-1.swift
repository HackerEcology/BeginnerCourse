
class Recursion {
    func printFirstNumber(N: Int){
        //println("hi")
        if N > 1 {
            printFirstNumber(N - 1)
        }
        println(N)
    }
}

var tempR = Recursion()


tempR.printFirstNumber(5)

/*
func printFirstNumbers(N: Int) {
    if N > 1 {
        printFirstNumbers(N - 1)
    }
    println(N)
}
//printFirstNumbers(1)
*/

/*
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

//fibonacci(1)


func pow(x: Int, y: Int) -> Int {
    if y == 0 {
        return 1
    } else {
        return x * pow(x, y - 1)
    }
}

println(pow(5, 5))


func factorial(N: Int) -> Int {
    if N == 1 {
        return 1
    } else {
        return N * factorial(N - 1)
    }
}


factorial(4)


func fibonacci(i: Int) -> Int {
    if i <= 2 {
        return 1
    } else {
        return fibonacci(i - 1) + fibonacci(i - 2)
    }
}

fibonacci(6)




