//
//  ExtensionUIStoryboard.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/17.
//

import UIKit

extension UIStoryboard {
    
    /// Storyboard初始化VC
    /// - Parameter name: 类名
    /// - Returns: VC
    func instantiateVC<T: UIViewController>(withClass name: T.Type) -> T? {
        instantiateViewController(withIdentifier: String(describing: name)) as? T
    }
}

extension UIStoryboard {
    
    class func createMainBundleSB(with name: String) -> UIStoryboard {
        UIStoryboard(name: name, bundle: Bundle.main)
    }
    
}

extension UIStoryboard {
    
    /// 其他Storyboard初始化VC
    /// - Parameters:
    ///   - vcName: 类名
    ///   - storyboardName: storyboardName
    /// - Returns: VC
    class func instantiateVC<T: UIViewController>(withClass vcName: T.Type, storyboardName: String) -> T? {
        let bundle = Bundle(for: T.self)
        let sb = UIStoryboard(name: storyboardName, bundle: bundle)
        return sb.instantiateVC(withClass: vcName)
    }
    
    class func instantiateVC(withClass vcName: String, storyboardName: String) -> UIViewController? {
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        return sb.instantiateViewController(withIdentifier: vcName)
    }


}

