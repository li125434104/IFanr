//
//  RequestAPI.swift
//  iFanr
//
//  Created by LXJ on 16/8/30.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit
import Moya
import Foundation

let baseUrlString = "https://www.ifanr.com/api/v3.0/"

public enum RequestAPI {
    case news_latest(Int)
}

extension RequestAPI: TargetType {
    //MARK: ---------------------------基本默认要传入的参数 --------------------------
    /// appKey
    private var appKey: String {
        return "sg5673g77yk72455af4sd55ea"
    }
    
    private var excerpt_length: Int {
        return 80
    }
    
    private var sign: String {
        return "be072a0fc0b7020836bae8777f2fbeca"
    }
    
    /// 当前时间的时间戳
    private var timestamp: String {
        return NSDate.getCurrentTimeStamp()
    }
    
    private var post_type: String {
        switch self {
        case .news_latest(_):
            return "buzz"
        }
    }
    
    private var action: String {
        return "ifr_m_latest"
    }
    
    private var posts_per_page: Int {
        return 12
    }
    
    //MARK: ---
    public var baseURL: NSURL {
        return NSURL(string: baseUrlString)!
    }
    
    public var path: String {
        return ""
    }
    
    public var method: Moya.Method {
        return .GET
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
        case let .news_latest(page):
            let params: [String: AnyObject] = ["action": action, "appKey": appKey, "excerpt_length": excerpt_length, "sign": sign, "timestamp": timestamp, "page": page, "posts_per_page": posts_per_page, "post_type": post_type]
            getUrlString(baseUrlString, params: params)
            return params
        }
    }
    
    public var sampleData: NSData {
        return "{}".dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    public var multipartBody: [MultipartFormData]? {
        return nil
    }
    
    
    
    /**
     打印请求的URL
     
     - parameter baseUrlStr: baseUrl
     - parameter params:     参数字典
     */
    func getUrlString(baseUrlStr: String, params: NSDictionary) {
        var str = "?"
        
        for item in params {
            str = str.stringByAppendingString(item.key as! String)
            str = str.stringByAppendingString("=")
            str = str.stringByAppendingString(String(item.value))
            str = str.stringByAppendingString("&")
        }
        
        //去掉最后一个“&”号
        if str.isEmpty == false {
            str = str.substringToIndex(str.endIndex.advancedBy(-1))
        }
        
        print("请求的URL是：\(baseUrlString + str)")
    }
}