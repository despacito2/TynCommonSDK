//
//  TYN_UIView_TouchZone.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/25.
//

import Foundation
import UIKit

fileprivate enum UIViewAssociatedObjectByHQ {
    static var isChangedHitTest = false
    
    static var topKey = "UIView_TouchZone.UIViewAssociatedObjectByHQ.topKey"
    static var leftKey = "UIView_TouchZone.UIViewAssociatedObjectByHQ.leftKey"
    static var bottomKey = "UIView_TouchZone.UIViewAssociatedObjectByHQ.bottomKey"
    static var rightKey = "UIView_TouchZone.UIViewAssociatedObjectByHQ.rightKey"
}

public extension UIView {
    
    @IBInspectable
    var touchZone: CGFloat {
        get {
            if topExpand == leftExpand,
               topExpand == bottomExpand,
               topExpand == rightExpand {
                return topExpand
            } else {
                return 0
            }
        }
        set {
            expandTouchZone(.init(top: newValue, left: newValue, bottom: newValue, right: newValue))
        }
    }
    
    func expandTouchZone(_ edge: UIEdgeInsets) {
        if !UIViewAssociatedObjectByHQ.isChangedHitTest {
            UIViewAssociatedObjectByHQ.isChangedHitTest = true
            guard let m1 = class_getInstanceMethod(self.classForCoder, #selector(hitTest(_:with:))) else {
                return
            }
            guard let m2 = class_getInstanceMethod(self.classForCoder, #selector(hq_hitTest(_:with:))) else {
                return
            }
            method_exchangeImplementations(m1, m2)
        }
        topExpand = edge.top
        bottomExpand = edge.bottom
        leftExpand = edge.left
        rightExpand = edge.right
    }
    
    @objc fileprivate func hq_hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let rect = enlargedRect()
        if rect.equalTo(bounds) {
            return hq_hitTest(point, with: event)
        }
        if isUserInteractionEnabled == false || alpha < 0.05 || isHidden {
            return nil
        }
        if rect.contains(point) {
            for i in 0 ..< subviews.count {
                let subView = subviews[i]
                let coverPoint = subView.convert(point, from: self)
                
                let hiteTestView = subView.hitTest(coverPoint, with: event)
                if hiteTestView != nil {
                    return hiteTestView
                }
            }
        }
        return rect.contains(point) ? self : nil
    }
    
    fileprivate func enlargedRect() -> CGRect {
        .init(x: bounds.origin.x - leftExpand, y: bounds.origin.y - topExpand, width: bounds.width + leftExpand + rightExpand, height: bounds.height + topExpand + bottomExpand)
    }
    
}

fileprivate extension UIView {
    
    var topExpand: CGFloat {
        get {
            objc_getAssociatedObject(self, &UIViewAssociatedObjectByHQ.topKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &UIViewAssociatedObjectByHQ.topKey, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    
    var bottomExpand: CGFloat {
        get {
            objc_getAssociatedObject(self, &UIViewAssociatedObjectByHQ.bottomKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &UIViewAssociatedObjectByHQ.bottomKey, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    
    var leftExpand: CGFloat {
        get {
            objc_getAssociatedObject(self, &UIViewAssociatedObjectByHQ.leftKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &UIViewAssociatedObjectByHQ.leftKey, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    
    var rightExpand: CGFloat {
        get {
            objc_getAssociatedObject(self, &UIViewAssociatedObjectByHQ.rightKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &UIViewAssociatedObjectByHQ.rightKey, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    
}
