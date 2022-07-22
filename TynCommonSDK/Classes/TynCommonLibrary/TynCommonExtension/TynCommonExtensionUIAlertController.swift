//
//  TYN_ExtensionUIAlertController.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/27.
//

import Foundation
import UIKit

public extension UIAlertController {
    ///举报内容
    static func reportAlert() {
        let actionSheet = UIAlertController.init(title: "举报类型", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: "涉黄/违法", style: .default) { _ in
            TYN_HUD.showMsg(textMsg: "举报成功，正在处理！")
        }
        let action2 = UIAlertAction.init(title: "不实信息", style: .default) { _ in
            TYN_HUD.showMsg(textMsg: "举报成功，正在处理！")
        }
        let action3 = UIAlertAction.init(title: "有害信息", style: .default) { _ in
            TYN_HUD.showMsg(textMsg: "举报成功，正在处理！")
        }
        let action4 = UIAlertAction.init(title: "不良价值导向", style: .default) { _ in
            TYN_HUD.showMsg(textMsg: "举报成功，正在处理！")
        }
        let action5 = UIAlertAction.init(title: "取消", style: .cancel) { _ in

        }
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(action5)
        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    ///举报内容
    static func joinTypeAlert(selectBlock: @escaping (_ typeText:String) -> Void) {
        let actionSheet = UIAlertController.init(title: "活动类别", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: "羽毛球", style: .default) { _ in
            selectBlock("羽毛球")
        }
        let action2 = UIAlertAction.init(title: "篮球", style: .default) { _ in
            selectBlock("篮球")
        }
        let action3 = UIAlertAction.init(title: "乒乓球", style: .default) { _ in
            selectBlock("乒乓球")
        }
        let action4 = UIAlertAction.init(title: "足球", style: .default) { _ in
            selectBlock("足球")
        }
        let action5 = UIAlertAction.init(title: "取消", style: .cancel) { _ in

        }
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(action5)
        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    ///确认取消弹窗
    static func affirmOrCancelAlert(title:String, selectBlock: @escaping () -> Void) {
        let actionAlert = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
        let actionAffirm = UIAlertAction.init(title: "确定", style: .default) { _ in
            selectBlock()
        }
        let actionCancel = UIAlertAction.init(title: "取消", style: .cancel) { _ in

        }
        actionAlert.addAction(actionAffirm)
        actionAlert.addAction(actionCancel)
        TYN_GetRootController.rootVC().present(actionAlert, animated: true)
    }
    
    //男女性别
    static func genderAlert(selectBlock: @escaping (_ typeText:String) -> Void) {
        let actionSheet = UIAlertController.init(title: "性别", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: "男", style: .default) { _ in
            selectBlock("男")
        }
        let action2 = UIAlertAction.init(title: "女", style: .default) { _ in
            selectBlock("女")
        }
        let action4 = UIAlertAction.init(title: "保密", style: .default) { _ in
            selectBlock("保密")
        }
        let action3 = UIAlertAction.init(title: "取消", style: .cancel) { _ in

        }
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action4)
        actionSheet.addAction(action3)

        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    //比赛模式
    static func matchTypeAlert(selectBlock: @escaping (_ typeText:String) -> Void) {
        let actionSheet = UIAlertController.init(title: "请选择比赛模式", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: "单打", style: .default) { _ in
            selectBlock("单打")
        }
        let action2 = UIAlertAction.init(title: "双打", style: .default) { _ in
            selectBlock("双打")
        }
        let action3 = UIAlertAction.init(title: "取消", style: .cancel) { _ in

        }
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)

        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    //比赛几回合
    static func matchNumTypeAlert(selectBlock: @escaping (_ typeText:String) -> Void) {
        let actionSheet = UIAlertController.init(title: "请选择比赛赛制", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: "三盘两胜", style: .default) { _ in
            selectBlock("三盘两胜")
        }
        let action2 = UIAlertAction.init(title: "五盘三胜", style: .default) { _ in
            selectBlock("五盘三胜")
        }
        let action3 = UIAlertAction.init(title: "无限局", style: .default) { _ in
            selectBlock("无限局")
        }
        let action4 = UIAlertAction.init(title: "取消", style: .cancel) { _ in

        }
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    ///运动类型
    static func sportsTypeAlert(selectBlock: @escaping (_ typeText:String) -> Void) {
        let actionSheet = UIAlertController.init(title: "运动类别", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: "健身", style: .default) { _ in
            selectBlock("健身")
        }
        let action2 = UIAlertAction.init(title: "跑步", style: .default) { _ in
            selectBlock("跑步")
        }
        let action3 = UIAlertAction.init(title: "骑行", style: .default) { _ in
            selectBlock("骑行")
        }
        let action4 = UIAlertAction.init(title: "游泳", style: .default) { _ in
            selectBlock("游泳")
        }
        let action5 = UIAlertAction.init(title: "瑜伽", style: .default) { _ in
            selectBlock("瑜伽")
        }
        let action6 = UIAlertAction.init(title: "球类运动", style: .default) { _ in
            selectBlock("球类运动")
        }
        let action7 = UIAlertAction.init(title: "取消", style: .cancel) { _ in

        }
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(action5)
        actionSheet.addAction(action6)
        actionSheet.addAction(action7)
        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
}
