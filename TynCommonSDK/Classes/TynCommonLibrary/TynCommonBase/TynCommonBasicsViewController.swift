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
        navigationController?.navigationBar.isTranslucent = false

    }

    var backBarButton: UIBarButtonItem {
        let view = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        return view
    }
}

class TYN_BasicsViewController: UIViewController, TYN_DefaultStyleViewController {
    var bgImageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefauTYN_tyle()
//        topImageView(toView: view)
        
        //隐藏导航栏之后，开启右滑手势
        if(self.navigationController != nil){
           self.navigationController!.interactivePopGestureRecognizer!.delegate = self;
        }
    }
    
    deinit {
        print("\(Self.self)")
    }
    
    func topImageView(toView:UIView) {
        bgImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: toView.bounds.size.width, height: 155 - navigationHandStatusH()))
        bgImageView.image = UIImage(named: "1")
        toView.addSubview(bgImageView)
    view.sendSubviewToBack(bgImageView)
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
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 0{
            return false;
        }
        return true;
    }
}
