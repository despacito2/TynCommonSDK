//
//  ExtensionDate.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/18.
//

import Foundation

extension Date {
//    yyyy-MM-dd_HH:mm:ss
    
    //日期转英文
    func dateToEnString(dateFormat:String? = "MMM dd") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "en_US")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: self)
        return date
    }
    
    //日期年月日时分 -> 字符串
    func dateToString(dateFormat:String? = "yyyy-MM-dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: self)
        return date
    }
    
    //日期年月日时分秒 -> 字符串
    func dateToYMRHMS(dateFormat:String? = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: self)
        return date
    }
    
    ///当前时间加上多少天
    func dateToSomeDay(intervalDays:Int, dateFormat:String? = "yyyy-MM-dd") -> String {
        let oneDay = 24 * 60 * 60
        let appointDate = NSDate.init(timeInterval: TimeInterval(oneDay * intervalDays), since: self)
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: appointDate as Date)
        return date
    }
    
    ///当前时间转为年月日的格式String
    func dateToYMR() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: self)
        return date
    }
    
    ///早中晚判断，返回祝福语
    func goodTime() -> String {
        var goodText:String
        let date = Int(self.dateToString(dateFormat: "HH"))
        if date! >= 6 && date! <= 11 {
            goodText = "Good morning"
        }else if date! > 11 && date! <= 18 {
            goodText = "good afternoon"
        }else if date! > 18 && date! <= 23 {
            goodText = "Good evening"
        }else {
            goodText = "Good night"
        }
        return goodText
    }
    
}

extension Date {
    //该时间所在周的第一天日期（2017年12月17日 00:00:00）
    var startOfWeek: Date {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.yearForWeekOfYear, .weekOfYear]), from: self)
        return calendar.date(from: components)!
    }
     
    //该时间所在周的最后一天日期（2017年12月23日 00:00:00）
    var endOfWeek: Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.day = 6
        return calendar.date(byAdding: components, to: self.startOfWeek)!
    }
     
    //该时间所在周的最后一天日期（2017年12月23日 23:59:59）
    var endTimeOfWeek: Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.day = 7
        components.second = -1
        return calendar.date(byAdding: components, to: self.startOfWeek)!
    }
}
