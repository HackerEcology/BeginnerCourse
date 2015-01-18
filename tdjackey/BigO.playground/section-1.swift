
let numberList : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

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