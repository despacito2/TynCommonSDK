//
//  TYN_CodeCountdownBtn.swift
//  KuPaoMarathon
//
//  Created by HXKJ on 2022/6/2.
//

import UIKit

protocol LayUp_CodeCountdownBtnDelegate {
    func countdownFinish(timeTotal:Int)
}

//继承button
class LayUp_CodeCountdownBtn: UIButton {

    //一分钟倒计时
    var time:Int!
    //进入后台时存储当前时间
    var becomeDeathTime: Date!
    //进入前台时存储当前时间
    var becomeActiveTime: Date!
    //DispatchSourceTimer，也就是大家通常叫的GCD Timer，是依赖于GCD的一种Timer，Runloop的底层代码中也用到这种Timer，可见GCD Timer并不依赖与Runloop。
    var codeTimer: DispatchSourceTimer!

    var delegate:LayUp_CodeCountdownBtnDelegate!
    var timeTotal = 0
    
    //添加和移除通知的方法
    func addNotification(isAdd:Bool) {

        if isAdd {
            //注册进入前台的通知
            NotificationCenter.default.addObserver(self, selector: #selector(becomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
            //注册进入后台的通知
            NotificationCenter.default.addObserver(self, selector: #selector(becomeDeath), name: UIApplication.willResignActiveNotification, object: nil)

        } else {
            //移除通知
            NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
            
            
            delegate.countdownFinish(timeTotal: timeTotal)
            timeTotal = 0
        }
    }

    @objc func becomeActive() {
        //存储进入前台时的时间
        becomeActiveTime = Date()
        if becomeDeathTime != nil {
            //计算出退出后台到进入前台的时间差
            let difference:Int = Int(becomeActiveTime.timeIntervalSince(becomeDeathTime))
            //DispatchSourceTimer退出后台时是暂停的，返回前台时，需要减去时间差
            time = time - difference
        }
    }

    @objc func becomeDeath() {
        //存储进入后台时的时间
        becomeDeathTime = Date()
    }

    //计时器激活和注销的方法
    func codeCountdown(isCodeTimer:Bool) {

        if isCodeTimer {
            //添加监控退出到后台以及进入前台的通知
            addNotification(isAdd: true)
            //倒计时的时候当前按钮不可点击，同时可以为状态disabled的按钮设置灰色的背景图片
//            isEnabled = false
            //子线程创建计时器
            codeTimer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: DispatchQueue.global())
            //dealine:开始执行时间 repeating:重复时间
            codeTimer.schedule(deadline: .now(), repeating: .milliseconds(1000))
            //添加计时器的事件
            codeTimer.setEventHandler { [self] in
                time = time - 1
                timeTotal = timeTotal + 1
                if time < 0 {
                    //注销计时器
                    codeTimer.cancel()
                    //主线程更新UI
                    DispatchQueue.main.async {
//                        self.isEnabled = true
                        self.setTitle("00:00:00" , for: .normal)
                        self.time = 60
                        //移除通知
                        self.addNotification(isAdd: false)
                    }
                    return
                }

                DispatchQueue.main.async {
                    print("\(self.time ?? 0),\(self.time.multipleZeroH())")
                    self.setTitle(self.time.multipleZeroH(), for: .normal)
                }
            }

            //计时器激活
            codeTimer.activate()

        }else{
            if codeTimer != nil {
                codeTimer.cancel()
                addNotification(isAdd: false)
                time = 60
//                self.isEnabled = true
                self.setTitle("00:00:00", for: .normal)
            }
        }
    }
}
