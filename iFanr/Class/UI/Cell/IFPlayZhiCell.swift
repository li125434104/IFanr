//
//  IFPlayZhiCell.swift
//  iFanr
//
//  Created by LXJ on 16/9/7.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit
import YYWebImage

class IFPlayZhiCell: IFBaseTableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var zanImageView: UIImageView!
    @IBOutlet weak var zanCountLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func setInfo(model: IFNewsModel) {
        
        self.logoImageView.yy_setImageWithURL(NSURL(string: "http://ifanr-cdn.b0.upaiyun.com/wp-content/uploads/2016/08/IMG_0868.jpg"), placeholder: UIImage(named: "place_holder_image"), options: [.SetImageWithFadeAnimation, .ProgressiveBlur], completion: nil)
        
//        self.logoImageView.yy_setImageWithURL(NSURL(string: "http://ifanr-cdn.b0.upaiyun.com/wp-content/uploads/2016/08/IMG_0868.jpg"), placeholder: UIImage(named: "place_holder_image"))
        
        self.timeLabel.text = NSDate.getCommonExpressionOfDate(model.pubDate!)
        self.zanCountLabel.text = model.like
        self.titleLabel.text = model.title
        self.titleLabel.attributedText = self.titleLabel.text!.getAttributedString(5.0)
        
        self.contentLabel.text = model.excerpt
        self.contentLabel.attributedText = self.contentLabel.text?.getAttributedString(5.0)
    }

}
