//
//  NSDateExtension.swift
//  iFanr
//
//  Created by LXJ on 16/8/31.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import Foundation


extension NSDate {
    /**
     获取今天的日期
     
     - returns: 今天日期的String
     */
    class func today() -> String {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let now: NSDate = NSDate()
        return dateFormatter.stringFromDate(now)
    }
    
    /**
     判断是否是今天
     
     - parameter dateString: 传入的日期
     
     - returns: Bool
     */
    class func isToday(dateString: String) -> Bool {
        return dateString == self.today()
    }
    
    /**
     获取当前时间戳
     
     - returns: String
     */
    class func getCurrentTimeStamp() -> String {
        let timeStamp: String = "\(Int64(floor(NSDate().timeIntervalSince1970 * 1000)))"
        return timeStamp
    }
    
    /**
     获取与当前时间的间隔
     
     - parameter dateString: 输入的时间参数
     
     - returns: 两个时间的间隔
     */
    class func getTimeIntervalFromNow(dateString: String) -> NSTimeInterval {
        if dateString.characters.count <= 0 {
            return 0
        }
        
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "Asia/Beijing")
        
        let dateBefore: NSDate = dateFormatter.dateFromString(dateString)!
        return dateBefore.timeIntervalSinceNow
    }
    
    
    /**
     计算多久之前
     
     - parameter dateString: 传入的数据
     
     - returns: String
     */
    
    class func getCommonExpressionOfDate(dateString: String) -> String {
        var resStr = ""
        
        let timeInterval = (self.getTimeIntervalFromNow(dateString) * -1) / 60 / 60
        if timeInterval < 1 {
            resStr = "\(Int(timeInterval * 60))分钟前"
        } else if timeInterval < 24 {
            resStr = "\(Int(timeInterval))小时前"
        } else if timeInterval < 48 {
            let range = NSRange(location: 10, length: 6)
            resStr = "昨天 " + (dateString as NSString).substringWithRange(range)
        } else if timeInterval < 72 {
            let range = NSRange(location: 10, length: 6)
            resStr = "前天 " + (dateString as NSString).substringWithRange(range)
        } else {
            var timeStr: String = ""
            if let tmpArray: Array = (dateString.componentsSeparatedByString(" ")) {
                if let monthDayArray: Array = tmpArray[0].componentsSeparatedByString("-") {
                    timeStr = monthDayArray[1] + "月" + monthDayArray[2] + "日"
                }
                let range   = NSRange(location: 0, length: 5)
                timeStr     = timeStr + " " + ((tmpArray[1] as NSString).substringWithRange(range))
            }
            resStr = timeStr
        }
        return resStr
    }
    
}