//: Playground - noun: a place where people can play

import UIKit


extension Int {
    var isEven: Bool {return (self % 2 == 0)}
    var isOdd: Bool {return (self % 2 != 0)}
    var isNatural: Bool {return (self >= 0)}
    var isPositive: Bool {return (self > 0)}
    var isNagative: Bool {return (self < 0)}
    var toDouble: Double {return Double(self)}
    var toFloat: Float {return Float(self)}
    
    var digits: Int {
        if self == 0 {
            return 1
        }
        else if(Int(fabs(toDouble)) <= LONG_MAX) {
            return Int(log10(fabs(toDouble))) + 1
        }
        else {
            return -1;
        }
    }
    
    var isPrime: Bool {
        if self < 2  { return false }
        return (2..<self).filter { self % $0 == 0 }.count == 0
    }
    
    // MARK: - 用 arc4random_uniform 函数求一个 1~self 的随机数（包括1和self）
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(self))) + 1
    }
}

100.random()
100.random()
100.random()






