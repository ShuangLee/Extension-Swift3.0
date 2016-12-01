//: Playground - noun: a place where people can play

import UIKit

extension String
{
    /**
     *  返回缓存路径的完整路径名
     */
    func cacheDir() ->String
    {
        let path = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.cachesDirectory,  FileManager.SearchPathDomainMask.userDomainMask,  true).last! as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
    /**
     *  返回文档路径的完整路径名
     */
    func documentDir() -> String
    {
        let dir = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        return dir.appendingPathComponent((self as NSString).lastPathComponent)
    }
    /**
     *  返回临时路径的完整路径名
     */
    func tmpDir() -> String
    {
        let dir = NSTemporaryDirectory() as NSString
        return dir.appendingPathComponent((self as NSString).lastPathComponent)
    }
}

extension String {
    
    /// 给String类添加索引功能
    ///
    /// - Parameters:
    ///   - start: 开始位置
    ///   - length: 长度
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
    
    var length : Int { return self.characters.count }
    
    func reverse() -> String {
        return (1...length)
            .map { "\(self[length - $0])" }
            .joined(separator: "")
    }
    
    static func randomString(size: Int) -> String {
        let source = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return (1...size)
            .map { (number) -> String in
                return "\(source[Int(arc4random_uniform(UInt32(source.length)))])"
            }
            .joined(separator: "")
    }
}



