//
//  ExtensionHUD.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/18.
//

import MBProgressHUD
import UIKit

//修改背景颜色，和文字颜色
//hud.bezelView.style = .solidColor
//hud.bezelView.backgroundColor = .black
//hud.label.textColor = UIColor(hex: "#FFFFFF")

//菊花图转圈颜色
//hud.contentColor = .white

public enum TYN_HUD {
    
}

public extension TYN_HUD {
    //isChinese:Bool? = true
    //isChinese:Bool? = false
    
    ///将信息填写完整 Complete the information
    static func showMsgComplete(isChinese:Bool? = true, toView:UIView? = UIViewController.getCurrentViewController()?.view, completion:(() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.mode = .text
        
        if isChinese == true {
            hud.label.text = "将信息填写完整"
        }else {
            hud.label.text = "Complete the information"
        }
        
        hud.hide(animated: true, afterDelay: 2)
        hud.completionBlock = completion
    }
    
    ///已经是最新版本 It is the latest version
    static func showMsgLast(isChinese:Bool? = true, toView:UIView? = UIViewController.getCurrentViewController()?.view, completion:(() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.mode = .text
        
        if isChinese == true {
            hud.label.text = "已经是最新版本"
        }else {
            hud.label.text = "It is the latest version"
        }
        
        hud.hide(animated: true, afterDelay: 2)
        hud.completionBlock = completion
    }
    
    ///清除缓存
    static func showWaitClearText(isChinese:Bool? = true, toView:UIView? = UIViewController.getCurrentViewController()?.view) {
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        
        if isChinese == true {
            hud.label.text = "正在清理..."
        }else {
            hud.label.text = "Cleaning..."
        }
        
        hud.hide(animated: true, afterDelay: 2)
        hud.completionBlock = {
            if isChinese == true {
                showSuccess(title: "清理完成")
            }else {
                showSuccess(title: "Clean successfully")
            }
        }

    }
    
    ///只展示文字,2秒消失
    static func showMsg(toView:UIView? = UIViewController.getCurrentViewController()?.view, textMsg:String, completion:(() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.mode = .text
        hud.label.text = textMsg
        hud.hide(animated: true, afterDelay: 2)
        hud.completionBlock = completion
    }
    
    ///只转圈圈
    static func showWait(toView:UIView? = UIViewController.getCurrentViewController()?.view) {
        _ = MBProgressHUD.showAdded(to: toView!, animated: true)
    }
    
    ///菊花图加提示文字,自动消失
    static func showWaitText(toView:UIView? = UIViewController.getCurrentViewController()?.view, text:String!, completion: (() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.label.text = text
        hud.hide(animated: true, afterDelay: 2)
        hud.completionBlock = completion
    }
    
    ///菊花图加提示文字，需要手动消失
    static func showWaitTextNotDisappear(toView:UIView? = UIViewController.getCurrentViewController()?.view, text:String!, completion: (() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.label.text = text
        hud.completionBlock = completion
    }
    
    ///成功图片加文字
    static func showSuccess(title: String, sucImageName:String? = "成功", afterDelay:Double? = 2.0, completion: (() -> Void)? = nil) {
        let toView = UIViewController.getCurrentViewController()?.view
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        let customImageView = HudImageView(image: UIImage(named: sucImageName!)!)
        hud.customView =  customImageView//自定义视图显示图片
        hud.customView?.invalidateIntrinsicContentSize()
        hud.label.text = title
        hud.label.textColor = UIColor(hex: "#333333")
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.completionBlock = completion
        hud.hide(animated: true, afterDelay: afterDelay!)
    }
    
    //修改成功
    static func showModifySuccess(isChinese:Bool? = true, completion: (() -> Void)? = nil) {
        var title:String
        if isChinese == true {
            title = "修改成功"
        }else {
            title = "Modify successfully"
        }
        showSuccess(title: title, completion: completion)
    }
    
    //添加成功
    static func showAddSuccess(isChinese:Bool? = true, completion: (() -> Void)? = nil) {
        var title:String
        if isChinese == true {
            title = "添加成功"
        }else {
            title = "Successfully added"
        }
        showSuccess(title: title, completion: completion)
    }
    
    //删除成功
    static func showDeleteSuccess(isChinese:Bool? = true, completion: (() -> Void)? = nil) {
        var title:String
        if isChinese == true {
            title = "删除成功"
        }else {
            title = "Successfully delete"
        }
        showSuccess(title: title, completion: completion)
    }
    
    static func showUploadSuccess(isChinese:Bool? = true, completion: (() -> Void)? = nil) {
        var title:String
        if isChinese == true {
            title = "上传成功"
        }else {
            title = "Successfully upload"
        }
        showSuccess(title: title, completion: completion)
    }
    
    ///隐藏hud
    static func hide(with view: UIView? = UIViewController.getCurrentViewController()?.view) {
        guard let showView = view else {
            return
        }
        MBProgressHUD.hide(for: showView, animated: true)
    }
}

class HudImageView:UIImageView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 37, height: 37)
    }
}
