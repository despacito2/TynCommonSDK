//
//  ConfigurationUIAppearanceAndIQKeyboard.swift
//  test
//
//  Created by HXKJ on 2022/6/27.
//

import Foundation
import IQKeyboardManagerSwift
import TynCommonSDK

extension TYN {
    ///在AppDelegate中didFinishLaunchingWithOptions需要调用的方法
    /// - Parameters:
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题大小
    ///   - backImageName: 返回按钮的图片
    ///   - bgImageName: 顶部导航栏背景图片
    ///   - bgColor: 顶部导航栏背景颜色
    ///
    /// IQKeyboardManager的使用，顶部导航栏的全局配置
    static func configurationUIAppearanceAndIQKeyboard(titleColor:UIColor? = UIColor(hex: "#333333"), titleFont:UIFont? = UIFont.systemFont(ofSize: 16, weight: .bold), backImageName:String? = "", bgImageName:String? = "", bgColor:UIColor? = .white) {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        //事件的第一响应者，手指离开屏幕前，其它控件是不会响应任何触摸事件
        UIButton.appearance().isExclusiveTouch = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        //顶部导航栏标题颜色大小
        appearance.titleTextAttributes = [
            .foregroundColor: titleColor!,
            .font: titleFont!
        ]
        
        if backImageName != "" {
            appearance.setBackIndicatorImage(UIImage(named: backImageName!), transitionMaskImage: UIImage(named: backImageName!))
        }
        
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        ///顶部导航栏背景颜色
        if bgImageName != "" {
            appearance.backgroundImage = UIImage(named: bgImageName!)
        }else {
            appearance.backgroundColor = bgColor
        }

    }
}
