//: Playground - noun: a place where people can play

import UIKit


extension String {
    public subscript(start: Int, length: Int) -> String {
        get {
            return (self as NSString).substring(with: NSRange(location: start, length: length))
        }
        set {
            let tmp = self
            var s = ""
            var e = ""
            for (idx, item) in tmp.characters.enumerated() {
                if (idx < start) {
                    s += "\(item)"
                }
                
                if (idx >= start + length) {
                    e += "\(item)"
                }
            }
            self = s + newValue + e
        }
    }
    
    public subscript(ind: Int) -> String {
        get{
            return String(self.characters[index(startIndex, offsetBy: ind)])
        }
        set{
            let tmp = self
            self = ""
            for (idx, item) in tmp.characters.enumerated() {
                if idx == ind {
                    self += "\(newValue)"
                }else{
                    self += "\(item)"
                }
            }
        }
    }
}

var str = "www.baidu.com"

print(str[4,5])
print(str[0])

str[4,5] = "BAIDU"
str[0] = "W"

print(str)



