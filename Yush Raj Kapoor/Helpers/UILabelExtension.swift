//
//  UILabelExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/23/21.
//

import UIKit

extension UILabel {
    func textHeight(withWidth width: CGFloat) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.height(withWidth: width, font: font)
    }
    
    func textWidth(withHeight height: CGFloat) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.width(withHeight: height, font: font)
    }

    func attributedTextHeight(withWidth width: CGFloat) -> CGFloat {
        guard let attributedText = attributedText else {
            return 0
        }
        return attributedText.height(withWidth: width)
    }
}

