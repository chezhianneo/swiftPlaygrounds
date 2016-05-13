//implement stack with min and max finder using structs

class Node<T> {
    var data:T?
    var next:Node?
    required init(data:T) {
        self.data = data
    }
}

class Stack<T> {
    var head:Node<T>?
    
    required init() {
        
    }
    
    func push(data:T) {
        
        guard var current = head else {
            let  newNode:Node<T> = Node(data: data)
            self.head = newNode
            return
        }
        while current.next != nil {
            current = current.next!
        }
        let  newNode:Node<T> = Node(data: data)
        newNode.data = data
        current.next = newNode
    }
    
    func pop() -> T? {
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
        print("Print Head" + "\(current.data)")
        
        while current.next != nil {
            current = current.next!
            print("Print Other" + "\(current.data)")
        }
        
    }
}

print("Stack Data")
var objStack = Stack<String>()
objStack.push("a")
objStack.push("b")

objStack.printdata()

objStack.pop()

objStack.printdata()



