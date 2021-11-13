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
        var horizontalHeights:[CGFloat] = []
        arrangedSubviews.forEach( { subview in
            if let sub = subview as? UIImageView {
                let ht = sub.image?.size.height
                subview.frame = CGRect(x: x, y: y, width: width, height: ht ?? 0)
                if axis == .horizontal {
                    horizontalHeights.append(ht ?? 0)
                } else {
                    
                    heights.append(ht ?? 0)
                }
            }
            else if let sub = subview as? UILabel {
                let ht = sub.textHeight(withWidth: width)
                subview.frame = CGRect(x: x, y: y, width: width, height: ht)
                heights.append(ht)
            } else if let sub = subview as? UIButton {
                let lbl = sub.titleLabel
                //equation for height = (textHeight/0.83797054) + 14
                //Why is it so obscure? I have no frickin idea!!
                let ht = (lbl?.text?.height(withWidth: width, font: (lbl?.font!)!) ?? 0.0) + 14
                subview.frame = CGRect(x: x, y: y, width: width, height: ht)
                heights.append(ht)
            } else {
                heights.append(subview.frame.height)
            }
        })
        let maxHorizontalHeight = horizontalHeights.max()
        if maxHorizontalHeight != nil && maxHorizontalHeight != 0 {
            heights.append(maxHorizontalHeight!)
        }
        
        
        frame = CGRect(x: x, y: y, width: width, height: (spacing * CGFloat(heights.count - 1)) + heights.sum())
    }
}
