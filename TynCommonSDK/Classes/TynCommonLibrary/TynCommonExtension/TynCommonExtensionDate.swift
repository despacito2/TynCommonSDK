//
//  ExtensionDate.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/18.
//

import Foundation

public extension Date {
//    yyyy-MM-dd_HH:mm:ss 中文
//    MMM dd, yyyy 英文
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
    
    ///当前时间加上多少天
    func dateToSomeDayDate(intervalDays:Int) -> NSDate {
        let oneDay = 24 * 60 * 60
        let appointDate = NSDate.init(timeInterval: TimeInterval(oneDay * intervalDays), since: self)
        return appointDate
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
    
    func dimHh(startDate:Date, endDate:Date) -> Int {
        let gregorian = NSCalendar(calendarIdentifier: .gregorian)
        let result = gregorian!.components(NSCalendar.Unit.hour, from: startDate, to: endDate, options: NSCalendar.Options(rawValue: 0))
        return result.hour ?? 0
    }
    
    //未来几天星期几，几号
    func future(isChinese:Bool? = false, days:Int? = 6) -> ([DateComponents], [String]) {
        ///以后多少天星期几，几号
        var timeArr = [DateComponents]()
        var i = 0
        let calendar = Calendar.current
        let oneDay = 24 * 60 * 60
        while i <= days! {

            let appointDate = NSDate.init(timeInterval: TimeInterval(oneDay * i), since: self)
            
            let comp = calendar.dateComponents([.day, .weekday, .month], from: appointDate as Date)
            
            timeArr.append(comp)
            i += 1
        }
        
        var dataArr = [String]()
        for time in timeArr {
            let weekday = time.weekday
            
            var whatDay = ""

            switch weekday {
            case 1:
                if isChinese == false {
                    whatDay = "Sun"
                }else {
                    whatDay = "周日"
                }
            case 2:
                if isChinese == false {
                    whatDay = "Mon"
                }else {
                    whatDay = "周一"
                }
                
            case 3:
                if isChinese == false {
                    whatDay = "Tue"
                }else {
                    whatDay = "周二"
                }
                
            case 4:
                if isChinese == false {
                    whatDay = "Wed"
                }else {
                    whatDay = "周三"
                }
                
            case 5:
                if isChinese == false {
                    whatDay = "Thu"
                }else {
                    whatDay = "周四"
                }
                
            case 6:
                if isChinese == false {
                    whatDay = "Fri"
                }else {
                    whatDay = "周五"
                }
                
            case 7:
                if isChinese == false {
                    whatDay = "Sat"
                }else {
                    whatDay = "周六"
                }
                
            default:
                break
            }
            
            dataArr.append(whatDay)
            
        }
        
        return (timeArr, dataArr)
    }
    
    //从现在开始，到未来某个时间的倒计时 (今天 -> 固定日期)
    func daysToNow(toDateString:String) -> Int {
        // 计算两个日期差，返回相差天数
        let formatter = DateFormatter()
        let calendar = Calendar.current
        formatter.dateFormat = "MMM dd, yyyy"
        
        // 固定日期
        let endDate = formatter.date(from: toDateString)
        
        let diff:DateComponents = calendar.dateComponents([.day], from: self, to: endDate!)
        return diff.day!
    }
    
    //从之前的某个时间开始，到现在过了多少天 (固定日期 -> 今天)
    func agoToNow(agoDateString:String) -> Int {
        // 计算两个日期差，返回相差天数
        let formatter = DateFormatter()
        let calendar = Calendar.current
        formatter.dateFormat = "MMM dd, yyyy"
        
        // 固定日期
        let startDate = formatter.date(from: agoDateString)
        
        let diff:DateComponents = calendar.dateComponents([.day], from: startDate!, to: self)
        return diff.day!
    }
    
}

public extension Date {
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

