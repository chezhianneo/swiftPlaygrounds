

//implement stack with min and max finder using structs

class Node {
    var data:Int?
    var next:Node?
    required init(data:Int) {
        self.data = data
    }
}

class Stack {
    var head:Node?
    
    required init() {
        
    }
    
    func pushMin(data:Int) {
        let  newNode:Node = Node(data: data)
        guard var current = self.head else {
            self.head = newNode
            return
        }
        if data < current.data {
            newNode.next = current
            self.head = newNode
            return
        }
        while current.next != nil {
             if data < current.next?.data {
                newNode.next = current.next
                current.next = newNode;
                return
            }
            current = current.next!
    }
        current.next = newNode
    }
    
    func pushMax(data:Int) {
        let  newNode:Node = Node(data: data)
        guard var current = self.head else {
            self.head = newNode
            return
        }
        if data > current.data {
            newNode.next = current
            self.head = newNode
            return
        }
        while current.next != nil {
            if data > current.next?.data {
                newNode.next = current.next
                current.next = newNode;
                return
            }
            current = current.next!
        }
        current.next = newNode
    }

    
    func pop() -> Int? {
        guard let current = head else {
            return nil
        }
        self.head = current.next
        current.next = nil
        return current.data
    }
    
    func printdata(){
        guard var current = head else {
            return
        }
        print("Print Other" + "\(current.data)")
        
        while current.next != nil {
            current = current.next!
            print("Print Other" + "\(current.data)")
        }
    }
}

var objStack = Stack()
objStack.pushMax(6)
objStack.pushMax(7)
objStack.pushMax(5)
objStack.pushMax(2)


objStack.printdata()

objStack.pop()

objStack.printdata()
objStack.pop()

objStack.printdata()


import UIKit

//Heap Sort methods
func leftLeafIndex(let rootIndex:Int)->Int{
    var heapIndex = rootIndex+1
    return heapIndex*2-1
}

func rightLeafIndex(let rootIndex:Int)->Int{
    var heapIndex = rootIndex+1
    return heapIndex*2-1+1
}

func heapLastIndex(let A:Array<Int>)->Int{
    return A.count-1
}

func maxHeapify(inout A:Array<Int>,let indexRoot:Int){
    if leftLeafIndex(indexRoot)>heapLastIndex(A) {return}
    var rootValue = A[indexRoot] as Int
    var largestIndex = indexRoot
    var largestValue = rootValue
    if let leftLeafValue = A[leftLeafIndex(indexRoot)] as Int!{
        if leftLeafValue > largestValue {
            largestValue = leftLeafValue
            largestIndex = leftLeafIndex(indexRoot)
        }
    }
    if rightLeafIndex(indexRoot)<=heapLastIndex(A){
        if let rightLeafValue = A[rightLeafIndex(indexRoot)] as Int!{
            if rightLeafValue > largestValue {
                largestValue = rightLeafValue
                largestIndex = rightLeafIndex(indexRoot)
            }
        }
    }
    if largestIndex != indexRoot {
        swap(&A[indexRoot], &A[largestIndex])
        maxHeapify(&A,indexRoot: largestIndex)
    }
}

func buildMaxHeap(inout A:Array<Int>){
    if A.count<2 {return}
    var lastParentIndex:Int = A.count/2
    while lastParentIndex >= 0 {
        maxHeapify(&A, indexRoot: lastParentIndex)
        lastParentIndex--;
    }
}

func heapSort(var A:Array<Int>)->Array<Int>{
    if A.count<2 {return A}
    buildMaxHeap(&A)
    var sortedA:Array<Int> = []
    while A.count>1 {
        sortedA.insert(A[0], atIndex: 0)
        swap(&A[0], &A[A.count-1])
        A.removeLast()
        maxHeapify(&A, indexRoot: 0)
    }
    sortedA.insert(A[0], atIndex: 0)
    return sortedA
}

//Main
var unsortedArray:Array<Int> = [3,2,14,400,1,401,7]
unsortedArray.sort()

print(unsortedArray)
let sortedArray = heapSort(unsortedArray)
print(sortedArray)




