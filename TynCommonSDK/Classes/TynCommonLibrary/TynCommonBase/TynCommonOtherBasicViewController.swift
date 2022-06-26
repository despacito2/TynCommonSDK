//
//  TYN_OtherBasicViewController.swift
//  Komorebi
//
//  Created by HXKJ on 2022/6/6.
//

import UIKit

class TYN_OtherBasicViewController: UIViewController,TYN_DefaultStyleViewController {
    var bgImageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefauTYN_tyle()
//        topImageView(toView: view)
    }
    
    deinit {
        print("\(Self.self)")
    }

    func topImageView(toView:UIView) {
        bgImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: toView.bounds.size.width, height: 155 - navigationHandStatusH()))
        bgImageView.image = UIImage(named: "1")
        toView.addSubview(bgImageView)
    view.sendSubviewToBack(bgImageView)
    }
    
}
