//
//  TYN_ExtensionUIAlertController.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/27.
//

import Foundation
import UIKit

public extension UIAlertController {
    
    ///举报拉黑
    static func reportAndBlacklistAlert(isChinese:Bool? = true, selectBlock: @escaping (_ typeText:String) -> Void) {
        
        var title:String
        var reportAndBlacklistArr = [String]()
        
        if isChinese == true {
            title = "过滤垃圾内容"
            reportAndBlacklistArr = ["举报", "拉黑", "取消"]
        }else {
            title = "Filtering Spam content"
            reportAndBlacklistArr = ["report", "blacklist", "cancel"]
        }
        
        let actionSheet = UIAlertController.init(title: title, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: reportAndBlacklistArr[0], style: .default) { _ in
            selectBlock(reportAndBlacklistArr[0])
        }
        let action2 = UIAlertAction.init(title: reportAndBlacklistArr[1], style: .default) { _ in
            selectBlock(reportAndBlacklistArr[1])
        }
        let action3 = UIAlertAction.init(title: reportAndBlacklistArr[2], style: .cancel) { _ in

        }
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)

        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    ///举报内容
    static func reportAlert(isChinese:Bool? = true, selectBlock: @escaping () -> Void) {
        var reportTextArr = [String]()
        var title:String
        var resultText:String
        
        if isChinese == true {
            reportTextArr = ["涉黄/违法", "不实信息", "有害信息", "不良价值导向", "取消"]
            title = "举报类型"
            resultText = "举报成功，正在处理！"
        }else {
            reportTextArr = ["Related to pornography/illegal", "False information", "harmful information", "Bad value orientation", "cancel"]
            title = "Report type"
            resultText = "Report successful, handling!"
        }
        
        let actionSheet = UIAlertController.init(title: title, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: reportTextArr[0], style: .default) { _ in
            TYN_HUD.showMsg(textMsg: resultText) {
                selectBlock()
            }
        }
        let action2 = UIAlertAction.init(title: reportTextArr[1], style: .default) { _ in
            TYN_HUD.showMsg(textMsg: resultText) {
                selectBlock()
            }
            
        }
        let action3 = UIAlertAction.init(title: reportTextArr[2], style: .default) { _ in
            TYN_HUD.showMsg(textMsg: resultText) {
                selectBlock()
            }
            
        }
        let action4 = UIAlertAction.init(title: reportTextArr[3], style: .default) { _ in
            TYN_HUD.showMsg(textMsg: resultText) {
                selectBlock()
            }
            
        }
        let action5 = UIAlertAction.init(title: reportTextArr[4], style: .cancel) { _ in

        }
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(action5)
        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    ///确认取消弹窗
    static func affirmOrCancelAlert(isChinese:Bool? = true, title:String, selectBlock: @escaping () -> Void) {
        
        var okText:String
        var cancelText:String
        
        if isChinese == true {
            okText = "确定"
            cancelText = "取消"
        }else {
            okText = "ok"
            cancelText = "cancel"
        }
        
        let actionAlert = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
        let actionAffirm = UIAlertAction.init(title: okText, style: .default) { _ in
            selectBlock()
        }
        let actionCancel = UIAlertAction.init(title: cancelText, style: .cancel) { _ in

        }
        actionAlert.addAction(actionAffirm)
        actionAlert.addAction(actionCancel)
        TYN_GetRootController.rootVC().present(actionAlert, animated: true)
    }
    
    //男女性别
    static func genderAlert(isChinese:Bool? = true, selectBlock: @escaping (_ typeText:String) -> Void) {
        
        var title:String
        var genderTextArr = [String]()
        
        if isChinese == true {
            title = "性别"
            genderTextArr = ["男", "女", "保密", "取消"]
        }else {
            title = "Gender"
            genderTextArr = ["male", "female", "secrecy", "cancel"]
        }
        
        let actionSheet = UIAlertController.init(title: title, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction.init(title: genderTextArr[0], style: .default) { _ in
            selectBlock(genderTextArr[0])
        }
        let action2 = UIAlertAction.init(title: genderTextArr[1], style: .default) { _ in
            selectBlock(genderTextArr[1])
        }
        let action4 = UIAlertAction.init(title: genderTextArr[2], style: .default) { _ in
            selectBlock(genderTextArr[2])
        }
        let action3 = UIAlertAction.init(title: genderTextArr[3], style: .cancel) { _ in

        }
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action4)
        actionSheet.addAction(action3)

        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
    
    ///弹窗模版，输入文字数组即可
    static func customPopup(isChinese:Bool? = true, title:String, textArr: [String], selectBlock: @escaping (_ typeText:String) -> Void) {

        var tempTextArr = textArr
        if isChinese == true {
            tempTextArr.append("取消")
        }else {
            tempTextArr.append("Cancel")
        }
        
        let actionSheet = UIAlertController.init(title: title, message: nil, preferredStyle: .actionSheet)
        
        for (singleIndex, single) in tempTextArr.enumerated() {
            
            if singleIndex != tempTextArr.count - 1 {
                let action = UIAlertAction.init(title: single, style: .default) { _ in
                    selectBlock(single)
                }
                actionSheet.addAction(action)
            }else {
                let action = UIAlertAction.init(title: tempTextArr.last, style: .cancel) { _ in
                    
                }
                actionSheet.addAction(action)
            }
        }
        
        TYN_GetRootController.rootVC().present(actionSheet, animated: true)
    }
}
