//
//  BasicViewController.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/16.
//

import UIKit

protocol TYN_DefaultStyleViewController: UIViewController {
    
}

extension TYN_DefaultStyleViewController {
    
    func setDefauTYN_tyle() {
        navigationItem.backBarButtonItem = backBarButton
        
        //顶部透明时，为true
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
    var backBarButton: UIBarButtonItem {
        let view = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        return view
    }
}

open class TYN_BasicsViewController: UIViewController, TYN_DefaultStyleViewController {
    var bgImageView:UIImageView!
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefauTYN_tyle()
        
        //顶部导航栏阴影
        //        let shadowView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 1))
        //        shadowView.backgroundColor = UIColor(hex: "#FFFFFF")
        //        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        //        shadowView.layer.shadowRadius = 6
        //        shadowView.layer.shadowOpacity = 1
        //        shadowView.layer.shadowColor = UIColor(hex: "#000000", alpha: 0.5).cgColor
        //        view.addSubview(shadowView)
        
        //返回按钮颜色
        navigationController?.navigationBar.tintColor = .white
        
        //整体背景图
//        let bgImageView = UIImageView.init(frame: CGRect(x: 0, y: -navigationHandStatusH(), width: screenWidth, height: screenHeight + navigationHandStatusH()))
//        bgImageView.image = UIImage(named: "注册bg")
//        bgImageView.contentMode = .scaleToFill
//        view.insertSubview(bgImageView, at: 0)
        
        //隐藏导航栏之后，开启右滑手势
        if(self.navigationController != nil){
            self.navigationController!.interactivePopGestureRecognizer!.delegate = self;
        }
    }
    
    deinit {
        print("\(Self.self)")
    }
    

}

extension TYN_DefaultStyleViewController {
    func navigationHandStatusH() -> CGFloat {
        let set = UIApplication.shared.connectedScenes
        let sc =  set.first
        guard let windowScene =  (sc as? UIWindowScene) else { return 0}
        guard  let  statusBarManager = windowScene.statusBarManager else { return 0}
        let frame = statusBarManager.statusBarFrame
        let h1 = frame.height
        return h1 + (navigationController?.navigationBar.frame.height ?? 0)
    }
    
    func statusBarManagerH() -> CGFloat {
        let set = UIApplication.shared.connectedScenes
        let sc =  set.first
        guard let windowScene =  (sc as? UIWindowScene) else { return 0}
        guard  let  statusBarManager = windowScene.statusBarManager else { return 0}
        let frame = statusBarManager.statusBarFrame
        let h1 = frame.height
        return h1
    }
}

extension TYN_BasicsViewController:UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 0{
            return false;
        }
        return true;
    }
}
