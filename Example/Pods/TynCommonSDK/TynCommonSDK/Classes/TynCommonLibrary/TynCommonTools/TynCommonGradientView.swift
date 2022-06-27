//
//  GradientView.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/16.
//

import UIKit

enum GradientType: Int {
    case topToBottom = 0 /// 从上到下
    case leftToRight = 1 /// 从左到右
    case bottomToTop = 2 /// 从下到上
    case rightToLeft = 3 /// 从右到左
}

class GradientView: UIView {

    /// 0 从上到下 1 从左到右 2 从下到上 3 从右到左
    @IBInspectable var gradientType: Int = 1
    @IBInspectable var startColor: UIColor?
    @IBInspectable var endColor: UIColor?
    
    public override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if startColor != nil && endColor != nil {
            gradientColors = [startColor!, endColor!]
        }
        updatebgGradientStyle()
    }
    
    public var gradientColors: [UIColor]? {
        didSet {
            updatebgGradientStyle()
        }
    }

    private func updatebgGradientStyle() {
        guard let bgGradient = layer as? CAGradientLayer else {
            return
        }

        guard let colors = gradientColors else {
            bgGradient.locations = nil
            bgGradient.colors = nil
            return
        }
        
        guard let type = GradientType(rawValue: gradientType)  else {
            return
        }
        
        bgGradient.colors = colors.map({ $0.cgColor })
        if colors.count > 2 {
            bgGradient.locations = [0, 0.5, 1]
        } else {
            bgGradient.locations = [0, 1]
        }
        
        switch type {
        case .topToBottom:
            bgGradient.startPoint = CGPoint(x: 0.5, y: 0)
            bgGradient.endPoint = CGPoint(x: 0.5, y: 1)
        case .bottomToTop:
            bgGradient.startPoint = CGPoint(x: 0.5, y: 1)
            bgGradient.endPoint = CGPoint(x: 0.5, y: 0)
        case .leftToRight:
            bgGradient.startPoint = CGPoint(x: 0, y: 0.5)
            bgGradient.endPoint = CGPoint(x: 1, y: 0.5)
        case .rightToLeft:
            bgGradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            bgGradient.endPoint = CGPoint(x: 0, y: 0.5)
        }
    }


}
