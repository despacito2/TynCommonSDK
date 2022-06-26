//
//  ExtensionUIView.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/17.
//

import UIKit

extension UIView {
    /// Xib 加载 UIView
    class func loadFromXib(bundle: Bundle? = nil) -> Self {
        let named = String(describing: Self.self)
        guard let view = UINib(nibName: named, bundle: bundle).instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("First element in xib file \(named) is not of type \(named)")
        }
        return view
    }
    
    func circular() {
        layer.cornerRadius = bounds.width/2
        layer.masksToBounds = true
    }
    
}
