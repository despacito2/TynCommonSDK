//
//  ExtensionUIImage.swift
//  MoveNow
//
//  Created by 田宴宁 on 2022/5/16.
//

import Foundation
import UIKit

extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height));
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
     
    /**
     *  等比率缩放
     */
//    func scaleImage(scaleSize:CGFloat)->UIImage {
//        let reSize = CGRect(origin: self.size.width * scaleSize, size: self.size.height * scaleSize)
//        return reSizeImage(reSize: reSize)
//    }
}

public extension UIImage {
    
    /// 颜色生成图片
    /// - Parameters:
    ///   - color: color
    ///   - size: size
    convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))

        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }

        self.init(cgImage: aCgImage)
    }
    
    /// 根据layer获取图片
    /// - Parameter layer: layer
    convenience init(layer: CALayer) {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, false, UIScreen.main.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
                self.init()
                return
            }
            self.init(cgImage: aCgImage)
            return
        }
        self.init()
    }
    
}

public extension UIImage {
    
    /// 返回圆角图片
    /// - Parameter redius: 圆角半径
    /// - Returns: 圆角图片
    func withCornerRadius(_ redius: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.addEllipse(in: rect)
        context?.clip()
        
        self.draw(in: rect)
        context?.addEllipse(in: rect)
        context?.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// 修正图片方向 解决相机拍照后旋转问题
    /// - Returns: 修改后的图片
    func fixOrientation() -> UIImage {
        
        if self.imageOrientation == .up {
            return self
        }
        
        var transform: CGAffineTransform = .identity
        
        switch self.imageOrientation {
        
        case .up, .upMirrored: break
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: CGFloat(Double.pi))
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(Double.pi/2))
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: CGFloat(-Double.pi/2))
            
        @unknown default:
            fatalError()
        }
        
        switch self.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        let context: CGContext = CGContext.init(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: self.cgImage!.bitsPerComponent, bytesPerRow: self.cgImage!.bytesPerRow, space: self.cgImage!.colorSpace!, bitmapInfo: self.cgImage!.bitmapInfo.rawValue)!
        
        context.concatenate(transform);
        
        switch self.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            context.draw(self.cgImage!, in: CGRect.init(x: 0, y: 0, width: self.size.height, height: self.size.width))
        default:
            context.draw(self.cgImage!, in: CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height))
        }
        
        let cgImage = context.makeImage();
        let image = UIImage.init(cgImage: cgImage!)
        
        return image
    }
    
    
    /// render color
    /// - Parameter color: color
    /// - Returns: image
    func render(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(rect)
        draw(in: rect, blendMode: .overlay, alpha: 1)
        draw(in: rect, blendMode: .destinationIn, alpha: 1)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 压缩图片，返回data
    /// - Parameter max: 最大的值 1K = 1024, 1M = 1024*1024
    /// - Returns: 压缩后的data
    func compression(_ max: Int, step: CGFloat = 0.01, successBack:((_ goodImageData:Data) -> Void)? = nil) {
        var data = self.jpegData(compressionQuality: 0.7)
        
        var quality: CGFloat = 0.7
        while data!.count > max && quality > 0.08 {
            quality -= step
            data = self.jpegData(compressionQuality: quality)!
        }
        successBack?(data!)
    }
    
    ///  合并图片
    /// - Parameters:
    ///   - image: 新的图片
    ///   - rect: 新的图片放在rect
    /// - Returns: 合并后的图片
    func merge(image: UIImage, at rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        draw(in: .init(origin: .zero, size: size))
        image.draw(in: rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    func redraw() -> UIImage? {
        guard let cgTempImage = self.cgImage else {
            return nil
        }
        UIGraphicsBeginImageContext(CGSize(width: cgTempImage.width, height: cgTempImage.height))
        defer {
            UIGraphicsEndImageContext()
        }
        
        draw(in: CGRect(origin: .zero, size: CGSize(width: cgTempImage.width, height: cgTempImage.height)))
         
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}

public extension UIImage {
    static func downloadImage(_ url: String, completion: ((UIImage?) -> Void)? = nil) {
        guard let url = URL(string: url) else {
            completion?(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                completion?(UIImage(data: data))
            } else {
                completion?(nil)
            }
        }.resume()
    }
}
