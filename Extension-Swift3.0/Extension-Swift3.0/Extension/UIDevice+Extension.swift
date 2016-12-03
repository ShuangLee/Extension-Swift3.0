//
//  UIDevice+Extension.swift
//  bolue
//
//  Created by liujunbin on 16/5/5.
//  Copyright © 2016年 Linked-F. All rights reserved.
//

import UIKit

extension UIDevice {
    //设备码 : iPhone7,2, iPhone6,1, ...
    public var deviceCode: String {
        var sysInfo: [CChar] = Array(count: sizeof(utsname), repeatedValue: 0)

        let code = sysInfo.withUnsafeMutableBufferPointer {
            (inout ptr: UnsafeMutableBufferPointer<CChar>) -> String in
            uname(UnsafeMutablePointer<utsname>(ptr.baseAddress))
            let machinePtr = ptr.baseAddress.advancedBy(Int(_SYS_NAMELEN * 4))
            return String.fromCString(machinePtr)!
        }

        return code
    }

    // 设备是什么  iPhone,iPad, ...
    public var deviceFamily: String {
        return UIDevice.currentDevice().model
    }

    //设备型号
    public var deviceModel: String {

        var model : String
        let deviceCode = UIDevice().deviceCode
        switch deviceCode {

        case "iPod1,1":                                 model = "iPod Touch 1G"
        case "iPod2,1":                                 model = "iPod Touch 2G"
        case "iPod3,1":                                 model = "iPod Touch 3G"
        case "iPod4,1":                                 model = "iPod Touch 4G"
        case "iPod5,1":                                 model = "iPod Touch 5G"
        case "iPod7,1":                                 model = "iPod Touch 6G"

        case "iPhone1,1":                               model = "iPhone 2G"
        case "iPhone1,2":                               model = "iPhone 3G"
        case "iPhone2,1":                               model = "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     model = "iPhone 4"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     model = "iPhone 4"
        case "iPhone4,1":                               model = "iPhone 4S"
        case "iPhone5,1", "iPhone5,2":                  model = "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  model = "iPhone 5C"
        case "iPhone6,1", "iPhone6,2":                  model = "iPhone 5S"
        case "iPhone7,2":                               model = "iPhone 6"
        case "iPhone7,1":                               model = "iPhone 6 Plus"
        case "iPhone8,1":                               model = "iPhone 6S"
        case "iPhone8,2":                               model = "iPhone 6S Plus"


        case "iPad1,1":                                 model = "iPad 1"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":model = "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           model = "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           model = "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           model = "iPad Air"
        case "iPad5,1", "iPad5,3", "iPad5,4":           model = "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           model = "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           model = "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           model = "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      model = "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      model = "iPad Pro"

        case "i386", "x86_64":                          model = "Simulator"
        default:                                        model = deviceCode //If unkhnown
        }

        return model
    }


    //IOS 版本号
    public var deviceIOSVersion: String {
        return UIDevice.currentDevice().systemVersion
    }

    //设备屏宽高
    public var deviceScreenWidth: CGFloat {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width = screenSize.width;
        return width
    }
    public var deviceScreenHeight: CGFloat {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let height = screenSize.height;
        return height
    }

    //小于5S 的设备
    public var lessIphone5S : Bool {

        switch UIDevice().deviceModel {
        case "iPhone 4" , "iPhone 4S" , "iPhone 5" , "iPhone 5C" ,"iPhone 5S" :
            return true
        default : break
        }
        return false
    }


    //设备方向
    public var deviceOrientationString: String {
        var orientation : String
        switch UIDevice.currentDevice().orientation{
        case .Portrait:
            orientation="Portrait"
        case .PortraitUpsideDown:
            orientation="Portrait Upside Down"
        case .LandscapeLeft:
            orientation="Landscape Left"
        case .LandscapeRight:
            orientation="Landscape Right"
        case .FaceUp:
            orientation="Face Up"
        case .FaceDown:
            orientation="Face Down"
        default:
            orientation="Unknown"
        }
        return orientation
    }


    // 设备方向 Landscape Portrait
    public var isDevicePortrait: Bool {
        return UIDevice.currentDevice().orientation.isPortrait
    }
    public var isDeviceLandscape: Bool {
        return UIDevice.currentDevice().orientation.isLandscape
    }
}
