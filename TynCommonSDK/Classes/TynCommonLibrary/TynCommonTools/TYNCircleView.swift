//
//  TYNCircleView.swift
//  FlyingColors
//
//  Created by tyn on 2022/9/28.
//

import UIKit

public class TYNCircleView: UIView {

    public var circleNum:Double? = 0.0 {
        didSet {
            layoutIfNeeded()
            setNeedsDisplay()
        }
    }
    
    let shapeLayer = CAShapeLayer()
    
    public var baseColor:UIColor? = UIColor(hex: "#FFFFFF")
    public var topColor:UIColor? = UIColor(hex: "#FFAE3B")
    public var lineWidth:CGFloat!
    
    public override func draw(_ rect: CGRect) {

        self.circular()
        
        //底部圆环
        let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2), radius: self.bounds.width/2, startAngle: 0, endAngle: CGFloat(Double.pi*2.0) , clockwise: false)
        path.lineWidth = lineWidth!
        baseColor!.setStroke()
        path.stroke()
        
        //顶部圆环
        let path2 = UIBezierPath(arcCenter: CGPoint(x: bounds.width/2, y: bounds.height/2), radius: bounds.width/2, startAngle: -0.5*Double.pi, endAngle: CGFloat(Double.pi*circleNum!) - 0.5*Double.pi, clockwise: false)

        
        shapeLayer.path = path2.cgPath
        shapeLayer.strokeEnd = 0
        shapeLayer.strokeColor = topColor?.cgColor
        shapeLayer.lineWidth = lineWidth!
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .square
        layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "stokeAnimation")
    }


}
