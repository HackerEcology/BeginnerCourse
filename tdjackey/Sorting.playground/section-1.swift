//a simple array of unsorted integers
var numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]



//insertion sort - rank items by comparing each key in the list. 
func insertionSort() {
    var x, y, key : Int
    for (x = 0; x < numberList.count; x++) {
    //obtain a key to be evaluated 
        key = numberList[x]

    //iterate backwards through the sorted portion
    for (y = x; y > -1; y--) {
        if (key < numberList[y]) {
            //remove item from original position
            numberList.removeAtIndex(y + 1)

            //insert the number at the key position 
            numberList.insert(key, atIndex: y)
        }
    }//end for
    } //end for
} //end function

