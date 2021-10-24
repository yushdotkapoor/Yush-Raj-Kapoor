//
//  UIStackViewExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/24/21.
//

import Foundation
import UIKit

extension UIStackView {
    func refactor(withWidth width:CGFloat, x:CGFloat=0, y:CGFloat=0) {
        var heights:[CGFloat] = []
        arrangedSubviews.forEach( {subview in
            if let sub = subview as? UILabel {
                let ht = sub.textHeight(withWidth: width)
                subview.frame = CGRect(x: x, y: y, width: width, height: ht)
                heights.append(ht)
            } else {
                heights.append(subview.frame.height)
            }
        })
        frame = CGRect(x: x, y: y, width: width, height: (spacing * CGFloat(heights.count - 1)) + heights.sum())
    }
}
