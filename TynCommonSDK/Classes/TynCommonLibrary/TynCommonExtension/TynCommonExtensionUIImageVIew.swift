//
//  TYN_ExtensionUIImageVIew.swift
//  KuPaoMarathon
//
//  Created by HXKJ on 2022/6/3.
//

import Foundation
import UIKit

///屏幕的宽度
public let screenWidth = UIScreen.main.bounds.width
///屏幕的高度
public let screenHeight = UIScreen.main.bounds.height

extension UIImageView {
    ///加载长图模式，宽度固定，重绘图片，同时改变imageView的高度
    func loadLongImage(contentImage:UIImage, widthSpacing:CGFloat) -> CGFloat {
        let tempImage = contentImage.reSizeImage(reSize: CGSize(width: screenWidth - widthSpacing, height: (screenWidth - widthSpacing)*contentImage.size.height/contentImage.size.width))
        image = tempImage
        return (screenWidth - widthSpacing)*contentImage.size.height/contentImage.size.width
    }
}
