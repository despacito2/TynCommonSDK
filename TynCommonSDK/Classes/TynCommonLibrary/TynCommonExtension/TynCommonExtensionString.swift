//
//  ExtensionString.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/20.
//

import Foundation
import UIKit

extension String {
    subscript(_ indexs: ClosedRange<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: indexs.lowerBound)
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[beginIndex...endIndex])
    }
    
    subscript(_ indexs: Range<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: indexs.lowerBound)
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[beginIndex..<endIndex])
    }
    
    subscript(_ indexs: PartialRangeThrough<Int>) -> String {
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[startIndex...endIndex])
    }
    
    subscript(_ indexs: PartialRangeFrom<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: indexs.lowerBound)
        return String(self[beginIndex..<endIndex])
    }
    
    subscript(_ indexs: PartialRangeUpTo<Int>) -> String {
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    
    func changeFontColor(subString: String, font: UIFont, textColor: UIColor)-> NSMutableAttributedString {
        let range: Range = range(of: subString)!
        let location = self.distance(from: startIndex, to: range.lowerBound)
        let attStr = NSMutableAttributedString.init(string: self)
        attStr.addAttributes([NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: font], range: NSRange.init(location: location, length: subString.count))
        return attStr
    }
    
    /// 日期字符串转化为Date类型
    ///
    /// - Parameters:
    /// - string: 日期字符串
    /// - dateFormat: 格式化样式，默认为“yyyy-MM-dd HH:mm:ss”
    /// - Returns: Date类型
    func convertDate(dateFormat:String? = "yyyy-MM-dd HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: self)
        return date ?? Date()
    }
    
}

extension String {
    
    ///根据宽度跟字体，计算文字的高度
    
    func textAutoHeight(width:CGFloat, font:UIFont) ->CGFloat{
        
        let string = self as NSString
        
        let origin = NSStringDrawingOptions.usesLineFragmentOrigin
        
        let lead = NSStringDrawingOptions.usesFontLeading
        
        let ssss = NSStringDrawingOptions.usesDeviceMetrics
        
        let rect = string.boundingRect(with:CGSize(width: width, height:0), options: [origin,lead,ssss], attributes: [NSAttributedString.Key.font:font], context:nil)
        
        return rect.height
        
    }
    
    ///根据高度跟字体，计算文字的宽度
    
    func textAutoWidth(height:CGFloat, font:UIFont) ->CGFloat{
        
        let string = self as NSString
        
        let origin = NSStringDrawingOptions.usesLineFragmentOrigin
        
        let lead = NSStringDrawingOptions.usesFontLeading
        
        let rect = string.boundingRect(with:CGSize(width:0, height: height), options: [origin,lead], attributes: [NSAttributedString.Key.font:font], context:nil)
        
        return rect.width
        
    }
    
}
