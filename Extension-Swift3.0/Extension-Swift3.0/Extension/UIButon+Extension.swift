//
//  UIButon+Extension.swift
//  Extension-Swift3.0
//
//  Created by 浮生若梦 on 2016/11/28.
//  Copyright © 2016年 Ls. All rights reserved.
//

import UIKit

extension UIButton {
    func set(image: UIImage?, title: String,
             titlePosition: UIViewContentMode, spacing: CGFloat, state: UIControlState){
        imageView?.contentMode = .center
        setImage(image, for: state)
        
        positionLabelRespectImage(title: title, position: titlePosition, spacing: spacing)
        
        titleLabel?.contentMode = .center
        setTitle(title, for: state)
    }
    
    private func positionLabelRespectImage(title: String, position: UIViewContentMode, spacing: CGFloat) {
        let imageSize = imageRect(forContentRect: frame)
        let titleFont = titleLabel?.font!
        let titleSize = title.size(attributes: [NSFontAttributeName: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
