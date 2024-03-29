//
//  QRCreator.swift
//  MoveNow
//
//  Created by Mr.Fire on 2022/5/18.
//

import Foundation
import CoreImage
import UIKit

extension UIColor {

    var coreImageColor: CIColor {
        return CIColor(color: self)
    }

    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {

        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}

public class QRCreateModel: NSObject {

    /// 文本
    public var text: String!

    /// 二维码中间的logo
    public var logo: String?

    /// 二维码缩放倍数{27*scale,27*scale}
    public var scale: Float = 10

    /// 二维码背景颜色
    public var backgroundColor: UIColor = UIColor.white

    /// 二维码颜色
    public var contentColor: UIColor = UIColor.black
}

public class QRCreator {

    public static let shared = QRCreator()

    private let qrFilter: CIFilter
    private let colorFilter: CIFilter

    private init() {

        /// 创建二维码滤镜
        qrFilter = CIFilter(name: "CIQRCodeGenerator")!

        /// 创建颜色滤镜
        colorFilter = CIFilter(name: "CIFalseColor")!
    }

    private func createBase(text: String, scale: Float) -> CIImage? {

        qrFilter.setDefaults()
        guard let data = text.data(using: String.Encoding.utf8) else {

            return nil
        }

        /// 给二维码滤镜设置inputMessage
        qrFilter.setValue(data, forKey: "inputMessage")
        guard var outputImage = qrFilter.outputImage else {

            return nil
        }

        outputImage = outputImage.transformed(by: CGAffineTransform(scaleX: CGFloat(scale), y: CGFloat(scale)))
        return outputImage
    }

    private func colourFilter(ciImage: CIImage, model: QRCreateModel) -> CIImage? {

        /// 颜色滤镜恢复默认值
        colorFilter.setDefaults()

        /// 设置颜色滤镜的inputImage
        colorFilter.setValue(ciImage, forKey: "inputImage")

        /// 设置inputImage的backgroundColor(key: inputColor1)
        colorFilter.setValue(model.backgroundColor.coreImageColor, forKey: "inputColor1")

        /// 设置inputImage的contentColor(key: inputColor0)
        colorFilter.setValue(model.contentColor.coreImageColor, forKey: "inputColor0")

        return colorFilter.outputImage
    }

    private func addLogo(ciImage: CIImage, model: QRCreateModel) -> UIImage? {

        guard let _ = model.logo,
            let logoImage = UIImage(named: model.logo!) else {

                return nil
        }

        let image = UIImage(ciImage: ciImage)
        let originX = (image.size.width - logoImage.size.width)/2.0
        let originY = (image.size.height - logoImage.size.height)/2.0

        UIGraphicsBeginImageContext(image.size)
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        logoImage.draw(in: CGRect(x: originX, y: originY, width: logoImage.size.width, height: logoImage.size.height))

        let outPutImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return outPutImage
    }

    public func create(_ model: QRCreateModel) -> UIImage? {

        guard var outputImage = createBase(text: model.text, scale: model.scale) else {

            return nil
        }

        if let colorOutputImage = colourFilter(ciImage: outputImage, model: model) {

            outputImage = colorOutputImage
        }

        guard let qrImageWithLogo = addLogo(ciImage: outputImage, model: model) else {

            return  UIImage(ciImage: outputImage)
        }

        return qrImageWithLogo
    }
}


//let qrModel = QRCreateModel()
//qrModel.text = "https://www.yaozuopan.top"
//qrModel.contentColor = UIColor.yellow
//qrModel.backgroundColor = UIColor.gray
//
///// 二维码的容错率最大为30%(即二维码被遮挡的部分不能大于30%,否则二维码无法被识别)
///// e.g.
///// 假设二维码大小为{100,100}, logo的大小最大为{30,30}
///// 在设置loog请注意
//// qrModel.logo = "mylogo"
//
//if let qrImage = QRCreator.shared.create(qrModel) {
//
//    print(qrImage.size.width)
//    print(qrImage.size.height)
//    // imageView.image = qrImage
//}
