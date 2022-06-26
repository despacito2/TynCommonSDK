//
//  ExtensionRootController.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/18.
//

import Foundation
import UIKit

enum TYN_GetRootController {
    
}

extension TYN_GetRootController {
    ///获取rootController
    static func rootVC() ->UIViewController{
        
        var vc = UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController
        
        if (vc?.isKind(of: UITabBarController.self))! {
            vc = (vc as! UITabBarController).selectedViewController
        }else if (vc?.isKind(of: UINavigationController.self))!{
            vc = (vc as! UINavigationController).visibleViewController
        }else if ((vc?.presentedViewController) != nil){
            vc =  vc?.presentedViewController
        }
        
        return vc!
    }
}

extension UIViewController {
    /// 获取当前显示的VC
    ///
    /// - Returns: 当前屏幕显示的VC
    class func getCurrentViewController() -> UIViewController?{
        // 获取当先显示的window
        var currentWindow = UIApplication.shared.windows.first { $0.isKeyWindow } ?? UIWindow()
        if currentWindow.windowLevel != UIWindow.Level.normal {
            let windowArr = UIApplication.shared.windows
            for window in windowArr {
                if window.windowLevel == UIWindow.Level.normal {
                    currentWindow = window
                    break
                }
            }
        }
        return UIViewController.getNextXController(nextController: currentWindow.rootViewController)
    }
    
    private class func  getNextXController(nextController: UIViewController?) -> UIViewController? {
        if nextController == nil {
            return nil
        }else if nextController?.presentedViewController != nil {
            return UIViewController.getNextXController(nextController: nextController?.presentedViewController)
        }else if let tabbar = nextController as? UITabBarController {
            return UIViewController.getNextXController(nextController: tabbar.selectedViewController)
        }else if let nav = nextController as? UINavigationController {
            return UIViewController.getNextXController(nextController: nav.visibleViewController)
        }
        return nextController
    }
}
