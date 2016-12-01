//
//  UIImage+Tint.swift
//  Extension-Swift3.0
//
//  Created by 浮生若梦 on 2016/12/1.
//  Copyright © 2016年 Ls. All rights reserved.
//
//use: UIImage(named:"logo")?.tint(UIColor.brown,blendMode: .destinationIn)
import UIKit

extension UIImage {
    /// 有时我们的App需要能切换不同的主题和场景，希望图片能动态的改变颜色以配合对应场景的色调。虽然我们可以根据不同主题事先创建不同颜色的图片供调用，但既然用的图片素材都一样，还一个个转换显得太麻烦，而且不便于维护。使用blendMode变可以满足这个需求。
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - blendMode: 图层混合模式
    /// - Returns: 修改后的图片
    func tint(color: UIColor, blendMode: CGBlendMode) -> UIImage
    {
        let drawRect = CGRect(x:0.0, y:0.0, width:size.width, height:size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        //let context = UIGraphicsGetCurrentContext()
        //CGContextClipToMask(context, drawRect, CGImage)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}
