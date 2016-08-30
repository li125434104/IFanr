//
//  Global.swift
//  iFanr
//
//  Created by LXJ on 16/8/30.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit

class Global: NSObject {
    
}
//MARK: - 替代oc中的#define, 列举一些常用宏
let kScreenSize = UIScreen.mainScreen().bounds.size

// 屏幕的物理宽度
let kScreenWidth = kScreenSize.width
// 屏幕的物理高度
let kScreenHeight = kScreenSize.height

let kStatusHeight = UIApplication.sharedApplication().statusBarFrame.size.height

let kScreenOneScale = 1.0 / UIScreen.mainScreen().scale
