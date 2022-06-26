//
//  TYN_RandomNumber.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/25.
//

import Foundation

enum TYN_RandomNumber {

}

extension TYN_RandomNumber {
    ///随机生成订单号
    static func orderNumbers() -> String {
        let num1 = Int(arc4random_uniform(8999) + 1000)
        let num2 = Int(arc4random_uniform(8999) + 1000)
        let num3 = Int(arc4random_uniform(8999) + 1000)
        let totalNum = "\(num1) \(num2) \(num3)"
        return totalNum
    }
    
    ///随机生成座机电话号码
    static func phoneNumbers() -> String {
        let num = Int(arc4random_uniform(89999999) + 10000000)
        let phone = "028-\(num)"
        return phone
    }
}
