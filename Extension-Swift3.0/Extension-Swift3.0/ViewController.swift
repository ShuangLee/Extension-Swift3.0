//
//  ViewController.swift
//  Extension-Swift3.0
//
//  Created by 浮生若梦 on 2016/11/24.
//  Copyright © 2016年 Ls. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        testAddImageWaterMark()
       print("welcome to hangge.com".md5)
    }
    
    private func testAddTextWaterMark() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: view.frame.size.width, height: 500))
        imageView.image =  #imageLiteral(resourceName: "userIcon.png").waterMarkedImage(waterMarkText: "浮生若梦", position: .TopLeft, margin: CGPoint(x:10, y:10), waterMarkTextColor: UIColor.green, waterMarkTextFont: UIFont.systemFont(ofSize: 16), backgroundColor: UIColor.gray).waterMarkedImage(waterMarkText: "www.jianshu.com", position: .BottomLeft, margin: CGPoint(x:10,y:10), waterMarkTextColor: UIColor.red, waterMarkTextFont: UIFont.systemFont(ofSize: 16), backgroundColor: UIColor.gray)
        view.addSubview(imageView)
    }
    
    private func testAddImageWaterMark() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "userIcon.png").waterMarkedImage(waterMarkImage: #imageLiteral(resourceName: "alert"), position: .TopLeft, margin: CGPoint(x:10,y:20), alpha: 1.0))
        view.addSubview(imageView)
    }
    
    private func testString() {
        
    }

    func testBtn() {
        let btn1:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 32))
        btn1.center = CGPoint(x:view.frame.size.width/2, y:60)
        btn1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) //文字大小
        btn1.setTitleColor(UIColor.orange, for: UIControlState.normal) //文字颜色
        btn1.set(image: UIImage(named: "alert"), title: "文字在左侧", titlePosition: .left,
                 spacing: 10.0, state: .normal)
        view.addSubview(btn1)
        
        
        let btn2:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 32))
        btn2.center = CGPoint(x:view.frame.size.width/2, y:120)
        btn2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) //文字大小
        btn2.setTitleColor(UIColor.orange, for: UIControlState.normal) //文字颜色
        btn2.set(image: UIImage(named: "alert"), title: "文字在右侧", titlePosition: .right,
                 spacing: 10.0, state: .normal)
        view.addSubview(btn2)
        
        let btn3:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 70))
        btn3.center = CGPoint(x:view.frame.size.width/2, y:230)
        btn3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) //文字大小
        btn3.setTitleColor(UIColor.orange, for: UIControlState.normal) //文字颜色
        btn3.set(image: UIImage(named: "alert"), title: "文字在上方", titlePosition: .top,
                 spacing: 10.0, state: .normal)
        view.addSubview(btn3)
        
        let btn4:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 70))
        btn4.center = CGPoint(x:view.frame.size.width/2, y:290)
        btn4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) //文字大小
        btn4.setTitleColor(UIColor.orange, for: UIControlState.normal) //文字颜色
        btn4.set(image: UIImage(named: "alert"), title: "文字在下方", titlePosition: .bottom,
                 spacing: 10.0, state: .normal)
        view.addSubview(btn4)
    }

}

