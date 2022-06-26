//
//  TYN_BRDatePickerView.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/25.
//

import Foundation
import BRPickerView

enum TYN_BRPickerView {

}

extension TYN_BRPickerView {
    ///年月日
    static func YMD(title:String, type:BRDatePickerMode? = .YMD, isFromNow:Bool? = true, fromDate:Date? = Date(), isMaxNow:Bool? = false, selecteCallBack:@escaping BRDateResultBlock) {
        let datePickerView = BRDatePickerView()
        datePickerView.pickerMode = type!
        datePickerView.title = title
        
        if isFromNow == true {
            datePickerView.minDate = NSDate.now
        }else if isFromNow == false && fromDate != Date() {
            datePickerView.minDate = fromDate
        }
        
        if isMaxNow == true {
            datePickerView.maxDate = NSDate.now
        }
        
        datePickerView.selectDate = NSDate.now
        datePickerView.resultBlock = selecteCallBack
        datePickerView.show()
    }
    
    ///上午下午小时
    static func hours(selecteCallBack:@escaping BRDateResultBlock) {
        let datePickerView = BRDatePickerView()
        datePickerView.pickerMode = .HM
        datePickerView.title = "请选择预约时间"
        
        datePickerView.selectDate = NSDate.now
        datePickerView.resultBlock = selecteCallBack
        datePickerView.show()
    }
}
