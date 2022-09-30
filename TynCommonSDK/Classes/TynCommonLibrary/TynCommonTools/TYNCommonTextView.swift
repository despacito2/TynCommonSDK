//
//  TYN_TextView.swift
//  FlyingColors
//
//  Created by tyn on 2022/9/30.
//

import UIKit

/// 自定义UITextView带提示文字
public class TYN_TextView: UITextView {
    
    /// 占位标签
    fileprivate lazy var placeholderLabel = UILabel()
    var placeholderText:String? = "请输入内容" {
        didSet {
            setupUI()
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

        setupUI()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    
}

public extension TYN_TextView {
    
    func setupUI() {
        placeholderLabel.text = placeholderText
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor(hex: "#9D9D9D")
        placeholderLabel.frame.origin = CGPoint(x: 8, y: 8)
        placeholderLabel.sizeToFit()
        
        addSubview(placeholderLabel)
        
        delegate = self
    }

}

// MARK: - UITextViewDelegate
extension TYN_TextView: UITextViewDelegate {
    public func textViewDidChangeSelection(_ textView: UITextView) {
        if textView.isNotEmpty() {
            placeholderLabel.isHidden = true
        }else {
            placeholderLabel.isHidden = false
        }
    }
}
