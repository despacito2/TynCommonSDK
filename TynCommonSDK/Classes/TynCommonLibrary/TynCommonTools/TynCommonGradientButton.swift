//
//  GradientButton.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/17.
//

import Foundation
import UIKit

//MARK: -定义button相对label的位置
enum RGButtonImagePosition {
    case top          //图片在上，文字在下，垂直居中对齐
    case bottom       //图片在下，文字在上，垂直居中对齐
    case left         //图片在左，文字在右，水平居中对齐
    case right        //图片在右，文字在左，水平居中对齐
}


public class GradientButton: UIButton {
    
    public override class var layerClass: AnyClass {
        CAGradientLayer.classForCoder()
    }
    
    @IBInspectable var startColor: UIColor?
    @IBInspectable var endColor: UIColor?
    @IBInspectable var isHorizontalColor: Bool = true
    
    public var startPoint: CGPoint? = nil
    public var endPoint: CGPoint? = nil
    
    public var locations: [NSNumber]?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let gl = layer as? CAGradientLayer,
              let start = startColor, let end = endColor else {
            return
        }
        gl.colors = [start, end].map({ $0.cgColor })
        gl.locations = locations ?? [0, 1]
        
        if let startPoint = startPoint, let endPoint = endPoint {
            gl.startPoint = startPoint
            gl.endPoint = endPoint
        } else {
            if isHorizontalColor {
                gl.startPoint = CGPoint(x: 0, y: 0.5)
                gl.endPoint = CGPoint(x: 1, y: 0.5)
            } else {
                gl.startPoint = CGPoint.init(x: 0.5, y: 0)
                gl.endPoint = CGPoint.init(x: 0.5, y: 1)
            }
        }
    }
    
    
    /// - Description 设置Button图片的位置
    /// - Parameters:
    ///   - style: 图片位置
    ///   - spacing: 按钮图片与文字之间的间隔
    func imagePosition(style: RGButtonImagePosition, spacing: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        
        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .top:
            //上 左 下 右
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-spacing/2, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight!-spacing/2, right: 0)
            break;
            
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
            break;
            
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight!-spacing/2, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight!-spacing/2, left: -imageWidth!, bottom: 0, right: 0)
            break;
            
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+spacing/2, bottom: 0, right: -labelWidth-spacing/2)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!-spacing/2, bottom: 0, right: imageWidth!+spacing/2)
            break;
            
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}
