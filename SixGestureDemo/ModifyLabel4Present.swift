//
//  ModifyLabel4Present.swift
//  SixGestureDemo
//
//  Created by 李 jia on 15/9/5.
//  Copyright (c) 2015年 l+. All rights reserved.
//

import UIKit

class ModifyLabel4Present: UILabel {
    init(position: CGPoint, textinfo: String,backGroundColor: UIColor, infoColor: UIColor) {
        super.init(frame: CGRect(origin: CGPoint(x: position.x-50, y: position.y-25), size: CGSize(width: 100, height: 50)))
        self.text = textinfo
        self.backgroundColor = backGroundColor
        self.textColor = infoColor
        self.textAlignment = NSTextAlignment.Center
        self.font = UIFont.systemFontOfSize(22)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
