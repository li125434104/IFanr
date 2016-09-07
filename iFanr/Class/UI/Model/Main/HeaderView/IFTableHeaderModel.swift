//
//  IFTableHeaderModel.swift
//  iFanr
//
//  Created by LXJ on 16/9/7.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit

struct IFTableHeaderModel {
    let backImage: UIImage
    let title: String
    let detailTitle: String
    let tagImage: UIImage
}

let IFTableHeaderModelArray = [
    IFTableHeaderModel(backImage: UIImage(named: "buzz_header_background")!, title: "快讯", detailTitle: "最新的资讯快报", tagImage: UIImage(named: "tag_happeningnow")!),
    IFTableHeaderModel(backImage: UIImage(named: "coolbuy_header_background")!, title: "玩物志", detailTitle: "值得买的未来生活", tagImage: UIImage(named: "tag_coolbuy")!),
    IFTableHeaderModel(backImage: UIImage(named: "appso_header_background")!, title: "AppSo", detailTitle: "智能手机更好用的秘密", tagImage: UIImage(named: "tag_appsolution")!),
    IFTableHeaderModel(backImage: UIImage(named: "mind_store_header_background")!,title: "MindStore", detailTitle: "在这里发现最好的产品和想法", tagImage: UIImage(named: "tag_latest_press")!)
]

