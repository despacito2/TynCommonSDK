//
//  TYN_ExtensionCMPedometer.swift
//  HobbyRunning
//
//  Created by HXKJ on 2022/6/14.
//

import Foundation
import CoreMotion

extension CMPedometer {
    
    ///判断是否支持记步
    static func estimateSupport(supportCallBack:(() -> Void)){
        //   判断设备支持情况
        guard CMPedometer.isStepCountingAvailable() else {
            TYN_HUD.showMsg(textMsg: "请勿携带iPad跑步，安全第一！")
            return
        }
        supportCallBack()
    }
    
    ///开始获取步数统计数据
    static func startPedometerUpdates(isSupportCallBack:(() -> Void)){
        //   判断设备支持情况
        guard CMPedometer.isStepCountingAvailable() else {
            TYN_HUD.showMsg(textMsg: "当前设备不支持获取步数")
            return
        }
        
        //    获取今天凌晨时间
        let cal = Calendar.current
        var comps = cal.dateComponents([.year,.month,.day], from: Date())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let midnightOfToday = cal.date(from: comps)
        
        //初始化并开始实时获取数据
        CMPedometer().startUpdates(from: midnightOfToday!, withHandler: { pedometerData, error in
            //错误处理
            guard error == nil else {
                print(error!)
                return
            }
            
            //获取各个数据
            var text = "---今日运动数据---\n"
            if let numberOfSteps = pedometerData?.numberOfSteps {
                text += "步数: \(numberOfSteps)\n"
            }
            if let distance = pedometerData?.distance {
                text += "距离: \(distance)\n"
            }
            if let floorsAscended = pedometerData?.floorsAscended {
                text += "上楼: \(floorsAscended)\n"
            }
            if let floorsDescended = pedometerData?.floorsDescended {
                text += "下楼: \(floorsDescended)\n"
            }
            if #available(iOS 9.0, *) {
                if let currentPace = pedometerData?.currentPace {
                    text += "速度: \(currentPace)m/s\n"
                }
            } else {
                // Fallback on earlier versions
            }
            if #available(iOS 9.0, *) {
                if let currentCadence = pedometerData?.currentCadence {
                    text += "速度: \(currentCadence)步/秒\n"
                }
            } else {
                // Fallback on earlier versions
            }
            
            //        在线程中更新文本框数据
            //        DispatchQueue.main.async {
            //
            //          self.myTextView.text = text
            //        }
            
        })
    }
    
    
    
}
