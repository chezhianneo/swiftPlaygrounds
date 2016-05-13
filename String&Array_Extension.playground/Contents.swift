//: Playground - noun: a place where people can play

import UIKit
import Foundation
//Array(string)
//contains
//indexOf
extension String
{
    func unicodeScalarCodePoint() -> UInt32 {
        let scalars = self.unicodeScalars
        return scalars[scalars.startIndex].value
    }
    
    func wordIsReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.characters.count)
        let misspelledRange = checker.rangeOfMisspelledWordInString(word, range: range, startingAt: 0, wrap: true, language: "en_US")
        return misspelledRange.location == NSNotFound
    }
    
    func getCharacterAtIndex(start:Int,end:Int) -> String {
        let startIndex = self.startIndex.advancedBy(start)
        let endIndex = self.startIndex.advancedBy(end)
        return self.substringWithRange(startIndex..<endIndex)
    }
    
    subscript(index:Int) -> String {
        let startIndex = self.startIndex.advancedBy(index)
        let endIndex = self.startIndex.advancedBy(index + 1)
        return self.substringWithRange(startIndex..<endIndex)
    }
    
    func indexofChar(string: String) -> Int? {
        guard let index = self.rangeOfString(string)?.startIndex else {
            return nil
        }
        return startIndex.distanceTo(index)
    }
}


extension Array where Element:Comparable {
    mutating func removeObject(object:Element) {
        self = self.filter { $0 as Element != object }
    }
}

let char = ""
var string = "12345"

string.indexofChar(".")

var int = 12345

//let index =
let str = string.getCharacterAtIndex(0, end: 3)
let character : String = "A"
char.unicodeScalarCodePoint()


//Common Array Functions

struct Data {
    var first:Int
    var second:Int
}


var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
names.removeObject("Alex")



names.reverse()

let arr = names.filter({($0 == "Alex")})

let arr1 = names.sort()

print(names.filter({($0 == "Alex")}))
names.indexOf("Alex")



names.sort({(s1: String, s2: String) -> Bool
    in
    return s1 > s2 }
)


var tArray = [[2,3],[2,3]]




