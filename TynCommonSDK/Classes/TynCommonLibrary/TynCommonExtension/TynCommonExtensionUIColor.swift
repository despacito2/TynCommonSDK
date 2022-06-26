//
//  ExtensionUIColor.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/16.
//

import UIKit

extension UIColor {
    class func color(with name: String) -> UIColor? {
        UIColor(named: "Color\(name)")
    }
}

extension UIColor {
    
    /// 颜色初始化 默认 白色
    /// - Parameter hex: 类似 #F9F9F9F0
    convenience init(ahex hex: String) {
        var string = hex.replacingOccurrences(of: "0x", with: "").replacingOccurrences(of: "#", with: "")
        if string.count <= 4 {
            var str = ""
            for character in string {
                str.append(String(repeating: String(character), count: 2))
            }
            string = str
        }
        let scanner = Scanner(string: string)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            let r, g, b: UInt
            let a: CGFloat
            r = UInt((hexNumber & 0xFF000000) >> 24)
            g = UInt((hexNumber & 0x00FF0000) >> 16)
            b = UInt((hexNumber & 0x0000FF00) >> 8)
            a = CGFloat(hexNumber & 0x000000FF) / 255
            self.init(red: r, green: g, blue: b, transparency: a)
            return
        }
        self.init(hex: 0xFFFFFF)
    }
    
    /// 颜色初始化 默认 白色
    /// - Parameters:
    ///   - hex: 类似 #000000
    ///   - alpha: 透明度
    convenience init(hex: String, alpha: CGFloat = 1) {
        var string = ""
        let lowercaseHexString = hex.lowercased()
        if lowercaseHexString.hasPrefix("0x") {
            string = lowercaseHexString.replacingOccurrences(of: "0x", with: "")
        } else if hex.hasPrefix("#") {
            string = hex.replacingOccurrences(of: "#", with: "")
        } else {
            string = hex
        }

        if string.count == 3 {
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }

        guard let hexValue = UInt(string, radix: 16) else {
            self.init(hex: 0xFFFFFF)
            return
        }

        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        let red = (hexValue >> 16) & 0xFF
        let green = (hexValue >> 8) & 0xFF
        let blue = hexValue & 0xFF
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
    
}

extension UIColor {
    convenience init(red: UInt, green: UInt, blue: UInt, transparency: CGFloat = 1) {
        guard red >= 0, red <= 255 else {
            self.init(hex: 0xFFFFFF)
            return
        }
        guard green >= 0, green <= 255 else {
            self.init(hex: 0xFFFFFF)
            return
        }
        guard blue >= 0, blue <= 255 else {
            self.init(hex: 0xFFFFFF)
            return
        }
        
        let trans: CGFloat
        if transparency < 0 {
            trans = 0
        } else if transparency > 1 {
            trans = 1
        } else {
            trans = transparency
        }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
}

private extension UIColor {
    
    convenience init(hex: CUnsignedLongLong, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hex & 0x00FF00) >>  8) / divisor
        let blue = CGFloat( hex & 0x0000FF) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
