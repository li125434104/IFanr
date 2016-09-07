//
//  IFPlayViewController.swift
//  iFanr
//
//  Created by LXJ on 16/8/30.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit
import Moya

class IFPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellowColor()
        
        getData()
    }
    
    //MARK: ---Request
    func getData() {
        
        let provider = MoyaProvider<RequestAPI>()
        provider.request(RequestAPI.playingZhi_latest(1)) { (result) in
            
            switch result {
            case let .Success(response):
                
                do {
                    let jsonDic = try response.mapJSON()
                    print(jsonDic)
//                    let jsonDataArray = IFNewsModel.modelWithNewsRequest(jsonDic as! [NSObject : AnyObject]) as! [IFNewsModel]
//                    self.dataArray.appendContentsOf(jsonDataArray)
//                    
//                    if self.dataArray.count > 0 {
//                        self.tableView.reloadData()
//                    } else {
//                        print("没有数据了")
//                    }
                    
//                    print("NewsDataArray:\(self.dataArray[0].ID)")
                } catch {
                    print("出现异常")
                }
                
            case let .Failure(error):
                print(error)
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
