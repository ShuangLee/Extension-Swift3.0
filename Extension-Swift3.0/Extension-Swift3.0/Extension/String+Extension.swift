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
}
