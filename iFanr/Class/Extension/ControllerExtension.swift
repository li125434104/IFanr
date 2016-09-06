//
//  ControllerExtension.swift
//  iFanr
//
//  Created by LXJ on 16/9/6.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func loadNib(nibName: String!) -> AnyObject? {
        return NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil).first
    }
    
    func loadVCFromSB(vc: String!, storyBoard: String? = nil) -> UIViewController {
        var sb = storyBoard == nil ? self.storyboard : UIStoryboard(name: storyBoard!, bundle: nil)
        if sb == nil {
            sb = UIStoryboard(name: "Main", bundle: nil)
        }
        let viewController = sb?.instantiateViewControllerWithIdentifier(vc)
        return viewController!
    }
}