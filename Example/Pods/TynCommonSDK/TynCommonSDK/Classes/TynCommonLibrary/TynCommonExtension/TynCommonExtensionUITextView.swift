//
//  TYN_ExtensionUILabel.swift
//  KuPaoMarathon
//
//  Created by HXKJ on 2022/6/3.
//

import Foundation
import UIKit

extension UITextView {
    ///多段文字并设置间距
    func manyText(textArr:[String]) {
        var str:String!
        for (singleIndex, single) in textArr.enumerated() {
            if singleIndex == 0 {
                str = single
            }else {
                str = str + "\n\(single)"
            }
        }
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为20
        paraph.lineSpacing = 8
        //样式属性集合
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15, weight: .regular),
                          NSAttributedString.Key.paragraphStyle: paraph]
        attributedText = NSAttributedString(string: str, attributes: attributes)
    }
}

extension UILabel {
    ///多段文字并设置间距
    func manyText(text:String, lineSpacing:CGFloat, textFont:UIFont, textColor:UIColor) {
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为20
        paraph.lineSpacing = lineSpacing
        //样式属性集合
        let attributes = [NSAttributedString.Key.font:textFont, NSAttributedString.Key.foregroundColor: textColor,
                          NSAttributedString.Key.paragraphStyle: paraph]
        attributedText = NSAttributedString(string: text, attributes: attributes)
    }
}
