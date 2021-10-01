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
    
}
