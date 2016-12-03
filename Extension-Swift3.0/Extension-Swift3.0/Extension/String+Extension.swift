//
//  String+Extension.swift
//  Extension-Swift3.0
//
//  Created by 浮生若梦 on 2016/11/28.
//  Copyright © 2016年 Ls. All rights reserved.
//
/* TEST
 //扩展字符串类，可以方便的通过索引获取某一个字符值，或某一部分字符串。同时也可以通过索引，给某一部分赋值。
 var str = "www.baidu.com"
 
 print(str[4,5])  // 获取
 print(str[0])
 
 str[4,5] = "BAIDU" //设置字符串
 str[0] = "W"       //设置
 
 print(str)
 */
import Foundation

extension String {
    
    var md5 : String{
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen);
        
        CC_MD5(str!, strLen, result);
        
        let hash = NSMutableString();
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i]);
        }
        result.deinitialize();
        
        return String(format: hash as String)
    }
    
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

/*
 - Documents
 - 需要保存由"应用程序本身"产生的文件或者数据，例如：游戏进度、涂鸦软件的绘图
 - 目录中的文件会被自动保存在 iCloud
 - 注意：不要保存从网络上下载的文件，否则会无法上架！
 
 - Caches
 - 保存临时文件，"后续需要使用"，例如：缓存图片，离线数据(地图数据)
 - 系统不会清理 cache 目录中的文件
 - 就要求程序开发时，"必须提供 cache 目录的清理解决方案"
 - Preferences
 - 用户偏好，使用 NSUserDefault 直接读写！
 - 如果要想数据及时写入磁盘，还需要调用一个同步方法
 
 - tmp
 - 保存临时文件，"后续不需要使用"
 - tmp 目录中的文件，系统会自动清理
 - 重新启动手机，tmp 目录会被清空
 - 系统磁盘空间不足时，系统也会自动清理
 */
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
