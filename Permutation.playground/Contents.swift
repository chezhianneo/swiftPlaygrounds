import Foundation
var str:String = "SwiftYo"


func permutation(str:String) {
    permutation("", str: str);
}

func permutation(prefix:String, str:String) {
    let n = str.characters.count
    if n == 0 {
        print(prefix)
    }
    else {
        for  i in 0..<n {
            let start1 = str.startIndex.advancedBy(i)
            let end1 = str.startIndex.advancedBy(i+1)
            let end2 = str.startIndex.advancedBy(i)
            let start3 = str.startIndex.advancedBy(i+1)
            let end3 = str.startIndex.advancedBy(n)
            
            
            permutation(prefix + str.substringWithRange(Range(start: start1, end: end1)), str: str.substringToIndex(end2) + str.substringWithRange(Range(start: start3, end: end3)))
        }
    }
}


permutation(str as String)
