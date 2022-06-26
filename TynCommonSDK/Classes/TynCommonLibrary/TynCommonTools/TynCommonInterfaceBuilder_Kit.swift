//
//  InterfaceBuilder_Kit.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/16.
//

import Foundation
import UIKit

// MARK: - 圆角
public extension UIView {
    
    /// A Boolean value that indicates whether the receiver handles touch events exclusively.
    @IBInspectable var isUserExclusiveTouch: Bool {
        get {
            isExclusiveTouch
        }
        set {
            isExclusiveTouch = newValue
        }
    }
    
    /// 圆角半径
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    /// 左上角 默认 true
    @available(iOS 11, *)
    @IBInspectable var cornerTopLeft: Bool {
        get {
            layer.maskedCorners.contains(.layerMinXMinYCorner)
        }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMinYCorner)
            }
        }
    }
    
    /// 右上角 默认 true
    @available(iOS 11, *)
    @IBInspectable var cornerTopRight: Bool {
        get {
            layer.maskedCorners.contains(.layerMaxXMinYCorner)
        }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMinYCorner)
            }
        }
    }
    
    /// 左下角 默认 true
    @available(iOS 11, *)
    @IBInspectable var cornerBottomLeft: Bool {
        get {
            layer.maskedCorners.contains(.layerMinXMaxYCorner)
        }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMaxYCorner)
            }
        }
    }
    
    /// 右下角 默认 true
    @available(iOS 11, *)
    @IBInspectable var cornerBottomRight: Bool {
        
        get {
            layer.maskedCorners.contains(.layerMaxXMaxYCorner)
        }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMaxYCorner)
            }
        }
    }
    
}

// MARK: - 边框
public extension UIView {
    
    /// 边框粗细
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    /// 边框颜色
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
}

// MARK: - 阴影
public extension UIView {
    
    /// 阴影偏移
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// 阴影半径
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    /// 阴影透明度
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// 阴影颜色
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
}

// MARK: - 本地化字符串
public extension UILabel {
    @IBInspectable var localizedKey: String? {
        set {
            guard let newValue = newValue else { return }
            text = NSLocalizedString(newValue, comment: "")
        }
        get { return text }
    }
}

public extension UIButton {
    @IBInspectable var localizedKey: String? {
        set {
            guard let newValue = newValue else { return }
            setTitle(NSLocalizedString(newValue, comment: ""), for: .normal)
        }
        get { return titleLabel?.text }
    }
}

public extension UITextField {
    @IBInspectable var localizedKey: String? {
        set {
            guard let newValue = newValue else { return }
            placeholder = NSLocalizedString(newValue, comment: "")
        }
        get { return placeholder }
    }
}

public extension UINavigationItem {
    @IBInspectable var localizedKey: String? {
        set {
            guard let newValue = newValue else { return }
            title = NSLocalizedString(newValue, comment: "")
        }
        get { return title }
    }
}

public extension UITabBarItem {
    @IBInspectable var localizedKey: String? {
        set {
            guard let newValue = newValue else { return }
            title = NSLocalizedString(newValue, comment: "")
        }
        get { return title }
    }
}
