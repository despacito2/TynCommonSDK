//
//  TYN_TimekeepingBtn.swift
//  LeafLife
//
//  Created by tyn on 2022/7/19.
//

import Foundation
import UIKit

protocol TYN_TimekeepingBtnDelegate {
    func endTotalTime(time:Int)
}

class TYN_TimekeepingBtn: UIButton {
        
    var codeTimer: DispatchSourceTimer!
    var timeTotal = 0
    var delegate:TYN_TimekeepingBtnDelegate!
    
    //计时器激活和注销的方法
    func state(isStart:Bool) {

        if isStart {
            //子线程创建计时器
            codeTimer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: DispatchQueue.global())
            //dealine:开始执行时间 repeating:重复时间
            codeTimer.schedule(deadline: .now(), repeating: .milliseconds(1000))
            //添加计时器的事件
            codeTimer.setEventHandler { [self] in
                timeTotal = timeTotal + 1
                
                DispatchQueue.main.async {
                    print("\(self.timeTotal),\(self.timeTotal.multipleZeroH())")
                    self.setTitle(self.timeTotal.multipleZeroH(), for: .normal)
                }
            }

            //计时器激活
            codeTimer.activate()

        }else{
            if codeTimer != nil {
                codeTimer.cancel()
                delegate.endTotalTime(time: timeTotal)
                self.setTitle("00:00:00", for: .normal)
                timeTotal = 0
            }
        }
    }
}
