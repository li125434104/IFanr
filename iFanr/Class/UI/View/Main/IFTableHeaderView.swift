//
//  IFTableHeaderView.swift
//  iFanr
//
//  Created by LXJ on 16/9/7.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit

class IFTableHeaderView: UIView {

    @IBOutlet weak var backImageView: UIImageView!   //背景图片
    @IBOutlet weak var titleLabel: UILabel!          //标题
    @IBOutlet weak var detailTitleLabel: UILabel!    //副标题
    @IBOutlet weak var tagImageView: UIImageView! //小图片
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.autoresizingMask = .None   //解决headerView覆盖cell的问题
    }
    
    func setHeader(model: IFTableHeaderModel) {
        self.backImageView.image = model.backImage
        self.titleLabel.text = model.title
        self.detailTitleLabel.text = model.detailTitle
        self.tagImageView.image = model.tagImage
    }
}
