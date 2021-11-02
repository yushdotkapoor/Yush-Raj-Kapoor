//
//  UIColorExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/28/21.
//

import Foundation
import UIKit

extension UIColor {
    
    func inverted() -> UIColor {
        let rgbColorNext = CIColor(color: self)
        let red:CGFloat = 255 - rgbColorNext.red * 255
        let green:CGFloat = 255 - rgbColorNext.green * 255
        let blue:CGFloat = 255 - rgbColorNext.blue * 255
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    func toHexString() -> String {
          var r:CGFloat = 0
          var g:CGFloat = 0
          var b:CGFloat = 0
          var a:CGFloat = 0

          getRed(&r, green: &g, blue: &b, alpha: &a)

          let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

          return NSString(format:"#%06x", rgb) as String
      }

      convenience init(red: Int, green: Int, blue: Int) {
          assert(red >= 0 && red <= 255, "Invalid red component")
          assert(green >= 0 && green <= 255, "Invalid green component")
          assert(blue >= 0 && blue <= 255, "Invalid blue component")

          self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
      }

}
