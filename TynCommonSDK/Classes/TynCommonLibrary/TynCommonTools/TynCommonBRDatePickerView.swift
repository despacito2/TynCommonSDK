//
//  TYN_BRDatePickerView.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/25.
//

import Foundation
import BRPickerView

public enum TYN_BRPickerView {

}

public extension TYN_BRPickerView {
    ///年月日
    static func YMD(title:String, type:BRDatePickerMode? = .YMD, isFromNow:Bool? = true, isMaxNow:Bool? = false, selecteCallBack:@escaping BRDateResultBlock) {
        let datePickerView = BRDatePickerView()
        datePickerView.pickerMode = type!
        datePickerView.title = title
        
        if isFromNow == true {
            datePickerView.minDate = NSDate.now
        }
        
        if isMaxNow == true {
            datePickerView.maxDate = NSDate.now
        }
        
        datePickerView.selectDate = NSDate.now
        datePickerView.resultBlock = selecteCallBack
        datePickerView.show()
    }
    
    ///上午下午小时
    static func hours(title:String, selecteCallBack:@escaping BRDateResultBlock) {
        let datePickerView = BRDatePickerView()
        datePickerView.pickerMode = .HM
        datePickerView.title = title
        
        datePickerView.selectDate = NSDate.now
        datePickerView.resultBlock = selecteCallBack
        datePickerView.show()
    }
}
