
import Foundation

var str = "25464A723"

enum StringError:ErrorType {
    case CharacterError
}
extension String {
    func stringToInt(string:String) throws -> CLong {
        var value:Int = 0
        var counter:Int = 1
        for  digit in string.utf8 {
            if digit < 48 ||  digit > 57{
                throw StringError.CharacterError
            }
            value = value + Int(pow(10.0,Double(str.characters.count - counter))) * Int(digit - 48)
            counter += 1
        }
        return value
    }
}

class TestClass {
    init() {
        do {
            let integer = try str.stringToInt(str)
            print(integer)
        } catch StringError.CharacterError {
            print("Enter Valid integers")
        } catch {
            print("Unknown Exception")
        }
    }
}

let test = TestClass()