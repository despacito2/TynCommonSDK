//
//  TYN_ExtensionUITextField.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/25.
//

import Foundation
import UIKit

extension UITextField {
    ///判断内容是否为空，默认不为空
    func isNotEmpty() -> Bool {
        var isNotEmpty = true
        if text?.count == 0 {
            isNotEmpty = false
        }
        return isNotEmpty
    }
    
    ///通过KVC修改占位文字的颜色
    func placeholder(color:UIColor) {
        setValue(color, forKeyPath: "placeholderLabel.textColor")
    }
}

extension UITextView {
    ///判断内容是否为空，默认不为空
    func isNotEmpty() -> Bool {
        var isNotEmpty = true
        if text?.count == 0 {
            isNotEmpty = false
        }
        return isNotEmpty
    }
}

