//
//  TYNTimekeepingBtn.swift
//  LeafLife
//
//  Created by tyn on 2022/7/19.
//

import Foundation
import UIKit

public protocol TYNTimekeepingBtnDelegate {
    func endTotalTime(time:Int)
}

open class TYNTimekeepingBtn: UIButton {
        
    public var codeTimer: DispatchSourceTimer!
    public var timeTotal = 0
    public var startTimeTotal = 0
    public var delegate:TYNTimekeepingBtnDelegate!
    
    //计时器激活和注销的方法
    ///true true 恢复 | true false 开始 | false true 暂停 | false false 结束
    ///
    public func state(isStart:Bool, isStop:Bool) {
        
        if isStart == true && isStop == true {
            //恢复
            codeTimer.resume()
        }else if isStart == true && isStop == false {
            //开始
            //子线程创建计时器
            codeTimer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: DispatchQueue.global())
            //dealine:开始执行时间 repeating:重复时间
            codeTimer.schedule(deadline: .now(), repeating: .milliseconds(1000))
            //添加计时器的事件
            codeTimer.setEventHandler { [self] in
                timeTotal = timeTotal + 1
                
                DispatchQueue.main.async {
                    print("\(self.timeTotal),\(self.timeTotal.multipleZeroH())")
                    self.setTitle((self.startTimeTotal + self.timeTotal).multipleZeroH(), for: .normal)
                }
            }

            //计时器激活
            codeTimer.activate()
        }else if isStart == false && isStop == true {
            //暂停
            codeTimer.suspend()
        }else if isStart == false && isStop == false {
            //结束
            if codeTimer != nil {
                codeTimer.cancel()
                delegate.endTotalTime(time: timeTotal)
                self.setTitle((self.startTimeTotal + self.timeTotal).multipleZeroH(), for: .normal)
                timeTotal = 0
            }
        }
    
    }
    
}
