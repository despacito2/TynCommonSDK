//
//  TYN_ExtensionInt.swift
//  worldCycling
//
//  Created by 田宴宁 on 2022/5/31.
//

import Foundation

extension Int {
    ///整型转00:00:00，最大是小时
    func multipleZeroH(showChinese:Bool? = false) -> String {
        var timeStrH:String
        let timeM = self%3600
        let timeS = timeM%60
        print("\(timeM),\(timeS)")
        if showChinese == false {
            timeStrH = String(format: "%02d:%02d:%02d", self/3600, self/60, timeS)
        }else {
            timeStrH = String(format: "%02d小时%02d分%02d秒", self/3600, self/60, timeS)
        }
        
        return timeStrH
    }
}
