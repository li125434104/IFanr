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
    private  var timestamp: String {
        return ""
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
        return NSURL(string: "https://www.ifanr.com/api/v3.0/")!
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
            return ["action": action, "appKey": appKey, "excerpt_length": excerpt_length, "sign": sign, "timestamp": timestamp, "page": page, "posts_per_page": posts_per_page, "post_type": post_type]
        }
    }
    
    public var sampleData: NSData {
        return "{}".dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    public var multipartBody: [MultipartFormData]? {
        return nil
    }


}