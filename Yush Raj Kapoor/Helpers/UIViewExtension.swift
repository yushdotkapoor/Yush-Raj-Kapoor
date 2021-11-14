//
//  UIViewExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/30/21.
//

import Foundation
import UIKit

extension UIView {
    
    func fadeIn() {
        UIView.animate(withDuration: 1.0) {
            self.alpha = 1.0
        }
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0) {
            self.alpha = 0.0
        }
    }
    
    func constrain(reference:UIView, top:CGFloat?=nil, bottom:CGFloat?=nil, leading:CGFloat?=nil, trailing:CGFloat?=nil) {
        if let topConstant = top {
            topAnchor.constraint(equalTo: reference.topAnchor, constant: topConstant).isActive = true
        }
        if let bottomConstant = bottom {
            bottomAnchor.constraint(equalTo: reference.bottomAnchor, constant: -bottomConstant).isActive = true
        }
        if let leadingConstant = leading {
            leadingAnchor.constraint(equalTo: reference.leadingAnchor, constant: leadingConstant).isActive = true
        }
        if let trailingConstant = trailing {
            trailingAnchor.constraint(equalTo: reference.trailingAnchor, constant: -trailingConstant).isActive = true
        }
    }
    
    func labelSniffer() -> [UILabel] {
        var labelToReturn:[UILabel] = [UILabel]()
        if let lbl = self as? UILabel {
            labelToReturn.append(lbl)
        } else if let stck = self as? UIStackView {
            let substack = stck.arrangedSubviews
            for i in substack {
                let lbls = i.labelSniffer()
                for j in lbls {
                    labelToReturn.append(j)
                }
            }
        } else {
            let subvus = self.subviews
            for i in subvus {
                let lbls = i.labelSniffer()
                for j in lbls {
                    labelToReturn.append(j)
                }
            }
        }
        return labelToReturn
    }
    
    func buttonSniffer() -> [UIButton] {
        var buttonToReturn:[UIButton] = [UIButton]()
        if let btn = self as? UIButton {
            buttonToReturn.append(btn)
        } else if let stck = self as? UIStackView {
            let substack = stck.arrangedSubviews
            for i in substack {
                let btns = i.buttonSniffer()
                for j in btns {
                    buttonToReturn.append(j)
                }
            }
        } else {
            let subvus = self.subviews
            for i in subvus {
                let btns = i.buttonSniffer()
                for j in btns {
                    buttonToReturn.append(j)
                }
            }
        }
        return buttonToReturn
    }
    
    
}
