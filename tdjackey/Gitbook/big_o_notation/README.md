# Big O Notation



大O符号（Big O notation）是用于描述函数渐近行为的数学符号。更确切地说，它是用另一个（通常更简单的）函数来描述一个函数数量级的渐近上界。在数学中，它一般用来刻画被截断的无穷级数尤其是渐近级数的剩余项；在计算机科学中，它在分析算法复杂性的方面非常有用。


大O符号在分析算法效率的时候非常有用。为了理解大O，我们在这个例子中，比较了两种算法在对同一个数组进行查找时的时间复杂度。

```
//a simple array of sorted integers let numberList :
Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - See more at: http://waynewbishop.com/swift/big-o-notation#sthash.zrX6Z331.dpuf
```


### 线性时间- O(n)

```
//brute force approach - O(n) linear time
func linearSearch(key: Int) {
//check all possible values until we find a match
    for number in numberList{
        if (number == key){
            let results = "value \(key) found.."
            println(results)
            break
        }
    }
}

```

### 对数时间 - O(log n)

```
//the binary approach - O(log n) logarithmic time
func binarySearch(key: Int, imin: Int, imax: Int) {
//find the value at the middle index
    var midIndex : Double = round(Double((imin + imax) / 2))
    var midNumber = numberList[Int(midIndex)]

//use recursion to reduce the possible search range
    if (midNumber > key ) {
        binarySearch(key, imin, Int(midIndex) - 1)
    }

    else if (midNumber < key ) {
        binarySearch(key, Int(midIndex) + 1, imax)
    }

    else {
        let results = "value \(key) found.."
    }
}//end func

```


