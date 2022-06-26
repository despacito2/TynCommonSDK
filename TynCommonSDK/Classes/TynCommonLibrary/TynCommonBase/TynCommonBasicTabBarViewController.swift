//
//  BasicTabBarViewController.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/19.
//

import UIKit



class TYN_BasicTabBarViewController: UITabBarController {
    
    var humpBtn:UIButton!
    var bgView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///tabBar按钮选中和未选中颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: "#333333"), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12.0)], for: .selected)
        self.tabBar.unselectedItemTintColor = UIColor(hex: "#AAAAAA")
        
        tabBar.isTranslucent = false
        
        ///tabBar背景颜色
        tabBar.backgroundColor = UIColor(hex: "#FFFFFF")
        
        delegate = self

    }
    
    ///凸起按钮
    func configConvexButton() {
        createConvexButton()
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "hideBtn"), object: nil, queue: .main) { [weak self] _ in
            self?.convexButton(isHide: true)
        }
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "addBtn"), object: nil, queue: .main) { [weak self] _ in
            self?.convexButton(isHide: false)
        }
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "clickBtn"), object: nil, queue: .main) { [weak self] _ in
            self?.humpBtnClick()
        }
    }
    
    func createConvexButton() {
        bgView = UIView.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        bgView.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height - 40)
        bgView.backgroundColor = UIColor(hex: "#FAFAFA")
        bgView.circular()
        bgView.layer.zPosition = .greatestFiniteMagnitude
        view.addSubview(bgView)
        
        
        humpBtn = UIButton.init(type: .custom)
        humpBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        humpBtn.circular()
        humpBtn.setImage(UIImage(named: "编组 11"), for: .normal)
        humpBtn.center = CGPoint(x: bgView.bounds.size.width / 2, y: bgView.bounds.size.height / 2)
        humpBtn.addTarget(self, action: #selector(humpBtnClick), for: .touchUpInside)
        bgView.addSubview(humpBtn)
    }
    
    func convexButton(isHide:Bool? = false) {
        humpBtn.isHidden = isHide!
        bgView.isHidden = isHide!
    }
    
    @objc func humpBtnClick() {
//        let vc = UIStoryboard.createMainBundleSB(with: "TYN_Login").instantiateViewController(withIdentifier: "TYN_LoginViewController") as! TYN_LoginViewController
//        present(vc, animated: true)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
}

extension TYN_BasicTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        var isJumpPage = true
        
        //凸起按钮
//        if viewController.tabBarItem.tag == 2 {
//            isJumpPage = false
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "clickBtn"), object: nil)
//        }
        
        
        if viewController.tabBarItem.tag == 3 || viewController.tabBarItem.tag == 2 {
            TYN_LoginViewController.isUserLogin {

            } faileCallBack: {
                isJumpPage = false
            }
        }
        return isJumpPage
    }
}
