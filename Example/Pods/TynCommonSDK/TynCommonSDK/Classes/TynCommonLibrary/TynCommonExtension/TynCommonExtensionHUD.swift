//
//  ExtensionHUD.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/18.
//

import MBProgressHUD
import UIKit

enum TYN_HUD {
    
}

extension TYN_HUD {
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
    
    ///菊花图加提示文字
    static func showWaitTextNotDisappear(toView:UIView? = UIViewController.getCurrentViewController()?.view, text:String!, completion: (() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.label.text = text
        hud.completionBlock = completion
    }
    
    ///成功图片加文字
    static func showSuccess(title: String, afterDelay:Double? = 2.0, completion: (() -> Void)? = nil) {
        let toView = UIViewController.getCurrentViewController()?.view
        let hud = MBProgressHUD.showAdded(to: toView!, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        let customImageView = HudImageView(image: UIImage(named: "成功")!)
        hud.customView =  customImageView//自定义视图显示图片
        hud.customView?.invalidateIntrinsicContentSize()
        hud.label.text = title
        hud.label.textColor = UIColor(hex: "#333333")
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.completionBlock = completion
        hud.hide(animated: true, afterDelay: afterDelay!)
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
