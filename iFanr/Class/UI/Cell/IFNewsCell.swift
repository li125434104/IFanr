//
//  IFNewsCell.swift
//  iFanr
//
//  Created by LXJ on 16/9/6.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit

class IFNewsCell: IFBaseTableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setInfo(model: IFNewsModel) {
        self.timeLabel.text = NSDate.getCommonExpressionOfDate(model.pubDate!)
        
        self.contentLabel.text = model.title
        self.contentLabel.attributedText = self.contentLabel.text!.getAttributedString(7.0)

        let sourceText = model.excerpt
        if ((sourceText?.containsString("/")) != nil) {
            let tempArray = sourceText?.componentsSeparatedByString("/")
            if tempArray?.count >= 3 {
                self.sourceLabel.text = "来源：" + tempArray![2]
            }
        }

    }

}
