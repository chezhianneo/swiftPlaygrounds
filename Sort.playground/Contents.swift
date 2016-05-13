
//indexOF

var numbers : Array<Int> = [8, 2, 10, 9, 11,67, 1,81, 7, 3, 4]

func insertionSort(numberList: Array<Int>) -> Array<Int> {
    guard numberList.count > 1 else {
        return numberList
    }
    var output = numberList
    for primaryIndex in 0..<output.count {
        let key = output[primaryIndex]
        let secondaryIndex = primaryIndex
        for  secondaryIndex  in (0...secondaryIndex).reverse() {
            if key < output[secondaryIndex] {
                output.removeAtIndex(secondaryIndex + 1)
                output.insert(key, atIndex: secondaryIndex) } } }
    return output
}

//##Bubble Sort 

func bubbleSort(numberList:Array<Int>)->Array<Int> {
    guard numberList.count > 0 else {
        return numberList
    }
   var output = numberList
    for primary in (0..<output.count) {
        for secondary in (0..<(output.count - primary-1)) {
            if output[secondary + 1] < output[secondary] {
                swap(&output[secondary], &output[secondary + 1])
            }
        }
    }
    
    return output
}

//Selection Sort

func selectionSort(numberList:Array<Int>)-> Array<Int> {
    guard numberList.count > 0 else {
        return numberList
    }
    var output = numberList
    for primary in (0..<output.count) {
        var key = primary
        for secondary in (primary..<output.count) {
            if output[secondary] < output[key] {
                key = secondary
            }
        }
        if primary != key {
            swap(&output[primary], &output[key])
        }
    }
    
    return output
}

insertionSort(numbers)
bubbleSort(numbers)
selectionSort(numbers)


func mergeSortArray(inout mPrimaryArray:Array<Int>,inout mSecondaryArray:Array<Int>)->Array<Int> {
    var output = Array<Int>()
    for  primary in mPrimaryArray {
        for secondary in mSecondaryArray {
            if primary < secondary {
                output.append(primary)
                mPrimaryArray.removeAtIndex(0)
                break;
            }
            else {
                output.append(secondary)
                mSecondaryArray.removeAtIndex(0)
            }
        }
        }
    
    // Handle remaining elements
    while !mPrimaryArray.isEmpty{
        output.append(mPrimaryArray[0])
        mPrimaryArray.removeAtIndex(0)
    }
    while !mSecondaryArray.isEmpty{
        output.append(mSecondaryArray[0])
        mSecondaryArray.removeAtIndex(0)
    }
    
    return output
}

func mergeSort(inout numbers:Array<Int>) {
    if numbers.count <= 1{
        return
    }
    print(numbers)
    let middle = numbers.count/2
    
    var left = Array<Int>()
    var right = Array<Int>()
    
    for x in 0..<middle {
        left.append(numbers[x])
    }
    
    for y in middle..<numbers.count{
        right.append(numbers[y])
    }
    
    
    // Recursively sort sublists
    print(left,right)
    mergeSort(&left)
    mergeSort(&right)
    
    numbers = mergeSortArray(&left,mSecondaryArray:&right)
    
}

mergeSort(&numbers)



