//
//  TYN_SystemFunction.swift
//  LanTunSwimming
//
//  Created by 田宴宁 on 2022/5/25.
//

import Foundation
import UIKit

enum TYN_SystemFunction {

}

extension TYN_SystemFunction {
    ///随机拨打电话
    static func call(phone:String? = nil, isRandom:Bool) {
        var phoneText = phone
        if isRandom {
            phoneText = TYN_RandomNumber.phoneNumbers()
        }
        let url = NSURL(string: "tel://\(phoneText ?? "028-888888")")! as URL
        if UIApplication.shared.canOpenURL(url) {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
