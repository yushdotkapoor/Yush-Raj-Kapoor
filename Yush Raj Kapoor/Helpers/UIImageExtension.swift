//
//  UIImageExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/30/21.
//

import Foundation
import UIKit

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
           return UIGraphicsImageRenderer(size:targetSize).image { _ in
               self.draw(in: CGRect(origin: .zero, size: targetSize))
           }
       }
}
