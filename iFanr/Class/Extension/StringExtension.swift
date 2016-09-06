//
//  StringExtension.swift
//  iFanr
//
//  Created by LXJ on 16/9/6.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /// return : Int length of the string
    var length: Int {
        return self.characters.count
    }
    
    /// 判断是不是邮箱
    var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        let firstMatch = dataDetector?.firstMatchInString(self, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, length))
        
        return (firstMatch?.range.location != NSNotFound && firstMatch?.URL?.scheme == "mailto")
    }
    
    /**
     判断是否是手机号
     
     - returns: Bool
     */
    var isTelNumber: Bool {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let phone = "1[3|5|7|8|][0-9]{9}"
        
        let phoneText = NSPredicate(format: "SELF MATCHES %@", phone)
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluateWithObject(self) == true)
            || (regextestcm.evaluateWithObject(self)  == true)
            || (regextestct.evaluateWithObject(self) == true)
            || (regextestcu.evaluateWithObject(self) == true)
            || (phoneText.evaluateWithObject(self) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    /**
     调整行间距
     
     - parameter lineSpace: 输入行间距大小
     
     - returns: NSAttributedString供String使用
     */
    func getAttributedString(lineSpace: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpace
        let range = NSRange.init(location: 0, length: self.length)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        return attributedString
    }
    
//    /**
//     判断是否包含String
//     
//     - parameter substring: 传入的String
//     
//     - returns: Bool
//     */
//    func contains(substring: String) -> Bool {
//        return rangeOfString(substring) != nil
//    }

    
}