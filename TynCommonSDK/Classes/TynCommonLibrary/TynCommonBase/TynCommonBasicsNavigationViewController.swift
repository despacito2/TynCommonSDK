//
//  BasicsNavigationViewController.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/18.
//

import UIKit

class TYN_BasicsNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///返回按钮颜色
        navigationBar.tintColor = .white

    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            //凸起按钮
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "hideBtn"), object: nil)
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @discardableResult
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        if self.viewControllers.count > 1 {
            topViewController?.hidesBottomBarWhenPushed = false
            
        }
        
        let controllers = super.popToRootViewController(animated: animated)
        return controllers
    }
    
    @discardableResult
    override func popViewController(animated: Bool) -> UIViewController? {
//        if children.count == 2 {
            //凸起按钮
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "addBtn"), object: nil)
//        }
        let controller = super.popViewController(animated: animated)
        return controller
    }

    deinit {
        print("\(Self.self)")
    }

}

extension UIApplication {
 
 
class var statusBarBackgroundColor: UIColor? {
    get {
        return statusBarUIView?.backgroundColor
    } set {
        statusBarUIView?.backgroundColor = newValue
    }
}
 
class var statusBarUIView: UIView? {
    if #available(iOS 13.0, *) {
        let tag = 987654321
        if let statusBar = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.viewWithTag(tag) {
            return statusBar
        }
        else {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return UIView() }
            guard let statusBarManager = windowScene.statusBarManager else { return UIView() }

            let statusBarView = UIView(frame: statusBarManager.statusBarFrame)
            statusBarView.tag = tag
 
            UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(statusBarView)
            return statusBarView
        }
    } else {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
    }
    return nil
}}

