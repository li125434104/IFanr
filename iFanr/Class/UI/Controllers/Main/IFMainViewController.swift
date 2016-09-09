//
//  IFMainViewController.swift
//  iFanr
//
//  Created by LXJ on 16/8/30.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit

class IFMainViewController: UIViewController {

    var pageMenu = CAPSPageMenu?()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("进入主页")
        self.view.backgroundColor = UIColor.blackColor()
        
        setUpMenu()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: ---UIConfigure
    
    func setUpMenu() {
        var controllerArray: [UIViewController] = []
        
        let vc1 = self.loadVCFromSB("IFNewsViewController")
        vc1.title = "快讯"
        controllerArray.append(vc1)
        
        let vc2 = IFHomePageViewController()
        vc2.title = "首页"
        controllerArray.append(vc2)

        let vc3 = self.loadVCFromSB("IFPlayViewController")
        vc3.title = "玩物志"
        controllerArray.append(vc3)
        
        let vc4 = IFAppSoViewController()
        vc4.title = "AppSo"
        controllerArray.append(vc4)
        
        let vc5 = IFStoreViewController()
        vc5.title = "MindStore"
        controllerArray.append(vc5)
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.blackColor()),
//            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .AddBottomMenuHairline(false),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 10.0)!),
            .MenuHeight(20.0),
            .MenuItemWidth(50.0),
            .MenuMargin(kScreenWidth/2 - 75.0),
            .SelectionIndicatorHeight(0.0),
            .CenterMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        
        
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
