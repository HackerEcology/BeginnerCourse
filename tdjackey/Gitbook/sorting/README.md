# 排序算法

在计算机科学与数学中，一个排序算法（Sorting algorithm）是一种能将一串数据依照特定排序方式进行排列的一种算法。最常用到的排序方式是数值顺序以及字典顺序。有效的排序算法在一些算法（例如搜索算法与合并算法）中是重要的，如此这些算法才能得到正确解答。排序算法也用在处理文字数据以及产生人类可读的输出结果。基本上，排序算法的输出必须遵守下列两个原则：

1. 输出结果为递增序列（递增是针对所需的排序顺序而言）
2. 输出结果是原输入的一种排列、或是重组


## 例子
```
//a simple array of unsorted integers
var numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]
```

### 插入排序
**插入排序（Insertion Sort）**是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。

```

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
```

##冒泡排序

**冒泡排序（Bubble Sort）**是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。

* 最差时间复杂度	O(n^2)
* 最优时间复杂度	O(n)
* 平均时间复杂度	O(n^2)
* 最差空间复杂度	总共O(n)，需要辅助空间O(1)

```
/*
    bubble sort algorithm - rank items from the lowest to highest by swapping
    groups of two items from left to right. The highest item in the set will bubble up to the
    right side of the set after the first iteration.
    */

    func bubbleSort(var numberList: Array<Int>) -> Array<Int> {


        //establish the iteration counters
        var x, y, z, passes, key : Int


        for (x = 0; x < numberList.count; ++x) {

            //outer loop is maintained to track how many iterations to pass through the list
            passes = (numberList.count - 1) - x;


                for (y = 0; y < passes; y++) {

                    //obtain the key item to sort
                    key = numberList[y]


                    println("comparing \(key) and \(numberList[y + 1])")


                        if (key > numberList[y + 1]) {

                            //pull out the value to be swapped
                            z = numberList[y + 1]


                            //write the key where the previous value was placed
                            numberList[y + 1] = key


                            //place the pulled value in the previous position
                            numberList[y] = z



                        } //end if


                } //end for


        } //end for

        return numberList

    } //end function


```
###快速排序
**快速排序**是由东尼·霍尔所发展的一种排序算法。在平均状况下，排序 n 个项目要Ο(n log n)次比较。在最坏状况下则需要Ο(n2)次比较，但这种状况并不常见。事实上，快速排序通常明显比其他Ο(n log n) 算法更快，因为它的内部循环（inner loop）可以在大部分的架构上很有效率地被实现出来。

* 最差时间复杂度	\Theta(n^2)
* 最优时间复杂度	\Theta(n\log n)
* 平均时间复杂度	\Theta(n\log n)
* 最差空间复杂度	根据实现的方式不同而不同

```

		// Quick sort works by dividing and conquering
		// Firstly it picks a pivot point then looks at all items in the observed array
		// and moves values to the left or right of the pivot based on their value
		// it works recursively so that either side will be eventually sorted back to the top

		func quickSort(var hops:[Int]) -> [Int] {

			if (hops.count <= 1) {
				return hops
			}

			var pivot = hops.removeAtIndex(0)
			var leftBucket:[Int] = []
			var rightBucket:[Int] = []

			(hops.count - 1).times { i in
				if (hops[i] <= pivot) {
					leftBucket.append(hops[i])
				} else {
					rightBucket.append(hops[i])
				}
			}

			var mergedArray:[Int] = []
			mergedArray += quickSort(leftBucket)
			mergedArray += [pivot]
			mergedArray += quickSort(rightBucket)

			return mergedArray
		}

```

###归并排序
**归并排序（Merge sort）**是创建在归并操作上的一种有效的排序算法。该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。


* 最差时间复杂度	\Theta(n\log n)
* 最优时间复杂度	\Theta(n)
* 平均时间复杂度	\Theta(n\log n)
* 最差空间复杂度	\Theta(n)




```
    	// Merge sort works by breaking down each side and sorting as it comes back up
		// Each left & right side is sorted by using pointers as to which value should be included
		// to sort, as each side is sorted as it comes back up the "tree" we can be sure that our pointers
		// can be safely moved left to right whereby the values are increasing
		func mergeSort(input:[Int]) -> [Int] {

			if (input.count <= 1) {
				return input
			}

			let mid = Int(floor(Double(input.count / 2)))
			let left = Array(input[0..<mid])
			let right = Array(input[mid..<input.count])

			let leftSide = mergeSort(left)
			let rightSide = mergeSort(right)

			return sortForMergeSort(leftSide, right: rightSide)
		}

		func sortForMergeSort(left:[Int], right:[Int]) -> [Int] {

			var sortedArray:[Int] = []
			var leftCount = 0
			var rightCount = 0

			(left.count + right.count).times { i in
				if (leftCount < left.count && (rightCount >= right.count || left[leftCount] <= right[rightCount])) {
					sortedArray.append(left[leftCount++])
				} else if (rightCount < right.count && (leftCount >= left.count || right[rightCount] < left[leftCount])) {
					sortedArray.append(right[rightCount++])
				}
			}

			return sortedArray
		}

```
