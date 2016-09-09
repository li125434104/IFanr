//
//  IFNewsViewController.swift
//  iFanr
//
//  Created by LXJ on 16/8/30.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit
import Moya

class IFNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [IFNewsModel]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        getData()
    }
    
    
    //MARK: ---ConfigUI

    func configUI() {
        let headerView: IFTableHeaderView = self.loadNib("IFTableHeaderView") as! IFTableHeaderView
        headerView.setHeader(IFTableHeaderModelArray.first!)
        self.tableView.tableHeaderView = headerView
    }
    
    
    //MARK: ---Request
    
    func getData() {
        
        let provider = MoyaProvider<RequestAPI>()
        provider.request(RequestAPI.news_latest(1)) { (result) in
            
            switch result {
            case let .Success(response):
                
                do {
                    let jsonDic = try response.mapJSON()
                    print(jsonDic)
                    let jsonDataArray = IFNewsModel.modelWithNewsRequest(jsonDic as! [NSObject : AnyObject]) as! [IFNewsModel]
                    self.dataArray.appendContentsOf(jsonDataArray)
                    
                    if self.dataArray.count > 0 {
                        self.tableView.reloadData()
                    } else {
                        print("没有数据了")
                    }
                    
                    print("NewsDataArray:\(self.dataArray[0].ID)")
                } catch {
                    print("出现异常")
                }
                
            case let .Failure(error):
                print(error)
            }
        }

    }
    
    //MARK: ---Table view dataSource & delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCellWithIdentifier("IFNewsCell", forIndexPath: indexPath) as! IFNewsCell
        newsCell.setInfo(self.dataArray[indexPath.row])
        return newsCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130
    }
    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0.1
//    }
//    
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0
//    }

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
