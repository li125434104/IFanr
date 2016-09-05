//
//  IFNewsViewController.swift
//  iFanr
//
//  Created by LXJ on 16/8/30.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit
import Moya

class IFNewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blueColor()
        
        let provider = MoyaProvider<RequestAPI>()
        provider.request(RequestAPI.news_latest(1)) { (result) in
            print(result)
            switch result {
                
            case let .Success(response):
                
                do {
                    let jsonDic = try response.mapJSON() as? NSDictionary
                    
                    let dataArray = jsonDic!["data"] as? NSArray
                    if dataArray?.count > 0 {
                    
                    } else {
                        print("没有数据了")
                    }
                    
                    print(jsonDic)
 
                } catch {
                    print("出现异常")
                }

                
                
                
            case let .Failure(error):
                print(error)
                
//            case let .Success(response):
                
//                let json = try response.mapJSON() as? Dictionary<String, AnyObject>
//                
//            case .Failure(error):
//                print(error)
            }
        }
        
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
