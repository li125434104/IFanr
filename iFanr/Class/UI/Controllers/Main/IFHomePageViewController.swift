//
//  IFHomePageViewController.swift
//  iFanr
//
//  Created by LXJ on 16/8/30.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit

class IFHomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.grayColor()
        
        let image: UIImageView = UIImageView.init(frame: CGRectMake(100, 100, 200, 100))
        self.view.addSubview(image)
        image.backgroundColor = UIColor.redColor()
        
        image.yy_setImageWithURL(NSURL(string: "http://ifanr-cdn.b0.upaiyun.com/wp-content/uploads/2016/08/IMG_0868.jpg"), placeholder: UIImage(named: "place_holder_image"), options: [.SetImageWithFadeAnimation, .ProgressiveBlur], completion: nil)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
