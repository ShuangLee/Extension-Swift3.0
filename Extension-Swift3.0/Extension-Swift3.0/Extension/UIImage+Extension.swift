//
//  UIImage+Extension.swift
//  Extension-Swift3.0
//
//  Created by 浮生若梦 on 2016/12/1.
//  Copyright © 2016年 Ls. All rights reserved.
//

import UIKit

extension UIImage {
    //给图片添加文字水印或者注释，我们需要实现在UIImage上写字的功能。
    //可以设置文字大小，文字颜色，背景色，位置，边距
    //水印位置枚举
    enum WaterMarkPosition{
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }
    
    //添加文字水印方法
    func waterMarkedImage(waterMarkText:String, position:WaterMarkPosition = .BottomRight,
                          margin:CGPoint = CGPoint(x: 20, y: 20),
                          waterMarkTextColor:UIColor = UIColor.white,
                          waterMarkTextFont:UIFont = UIFont.systemFont(ofSize: 20),
                          backgroundColor:UIColor = UIColor.clear) -> UIImage{
        
        let textAttributes = [NSForegroundColorAttributeName:waterMarkTextColor,
                              NSFontAttributeName:waterMarkTextFont,
                              NSBackgroundColorAttributeName:backgroundColor]
        let textSize = NSString(string: waterMarkText).size(attributes: textAttributes)
        var textFrame = CGRect(x:0, y:0, width:textSize.width, height:textSize.height)
        
        let imageSize = self.size
        switch position{
        case .TopLeft:
            textFrame.origin = margin
        case .TopRight:
            textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x, y: margin.y)
        case .BottomLeft:
            textFrame.origin = CGPoint(x: margin.x, y: imageSize.height - textSize.height - margin.y)
        case .BottomRight:
            textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x,
                                       y: imageSize.height - textSize.height - margin.y)
        }
        
        // 开始给图片添加文字水印
        UIGraphicsBeginImageContext(imageSize)
        self.draw(in: CGRect(x:0, y:0, width:imageSize.width, height:imageSize.height))
        NSString(string: waterMarkText).draw(in: textFrame, withAttributes: textAttributes)
        
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return waterMarkedImage!
    }
    
    //添加图片水印方法
    //可设置水印图片透明度，位置，边距
    //添加图片水印方法
    func waterMarkedImage(waterMarkImage:UIImage, position:WaterMarkPosition = .BottomRight,
                          margin:CGPoint = CGPoint(x: 20, y: 20), alpha:CGFloat = 1) -> UIImage{
        
        var markFrame = CGRect(x:0, y:0, width:waterMarkImage.size.width, height:waterMarkImage.size.height)
        let imageSize = self.size
        
        switch position{
        case .TopLeft:
            markFrame.origin = margin
        case .TopRight:
            markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
                                       y: margin.y)
        case .BottomLeft:
            markFrame.origin = CGPoint(x: margin.x,
                                       y: imageSize.height - waterMarkImage.size.height - margin.y)
        case .BottomRight:
            markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
                                       y: imageSize.height - waterMarkImage.size.height - margin.y)
        }
        
        // 开始给图片添加图片
        UIGraphicsBeginImageContext(imageSize)
        self.draw(in: CGRect(x:0, y:0, width:imageSize.width, height:imageSize.height))
        waterMarkImage.draw(in: markFrame, blendMode: .normal, alpha: alpha)
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return waterMarkedImage!
    }
    
    // 添加棕褐色滤镜CISepiaTone
    // Core Image是一个强大的滤镜处理框架。它除了可以直接给图片添加各种内置滤镜，还能精确地修改鲜艳程度, 色泽, 曝光等
    //棕褐色复古滤镜（老照片效果）
    func sepiaTone() -> UIImage?
    {
        let imageData = UIImagePNGRepresentation(self)
        let inputImage = CoreImage.CIImage(data: imageData!)
        let context = CIContext(options:nil)
        let filter = CIFilter(name:"CISepiaTone")
        filter!.setValue(inputImage, forKey: kCIInputImageKey)
        filter!.setValue(0.8, forKey: "inputIntensity")
        if let outputImage = filter!.outputImage {
            let outImage = context.createCGImage(outputImage, from: outputImage.extent)
            return UIImage(cgImage: outImage!)
        }
        return nil
    }
    
    //黑白效果滤镜
    func noir() -> UIImage?
    {
        let imageData = UIImagePNGRepresentation(self)
        let inputImage = CoreImage.CIImage(data: imageData!)
        let context = CIContext(options:nil)
        let filter = CIFilter(name:"CIPhotoEffectNoir")
        filter!.setValue(inputImage, forKey: kCIInputImageKey)
        if let outputImage = filter!.outputImage {
            let outImage = context.createCGImage(outputImage, from: outputImage.extent)
            return UIImage(cgImage: outImage!)
        }
        return nil
    }
}
