//
//  UILabelExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/23/21.
//

import UIKit
import Foundation

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
    
    //initializes label with many properties to save space
    func initLabel(textLbl:String="", size:CGFloat=17, color:UIColor=UIColor.label, textAlignment:NSTextAlignment=NSTextAlignment.left) -> UILabel {
        self.numberOfLines = 0
        self.textAlignment = textAlignment
        self.font = font.withSize(size)
        self.textColor = color
        self.text = textLbl
        return self
    }
    
    //initializes label with an array to form bullet point style text
    func initLabel(textLbls:[String], size:CGFloat=17, color:UIColor=UIColor.label, textAlignment:NSTextAlignment=NSTextAlignment.left) -> UILabel {
        let text = formatBullets(arr: textLbls)
        return initLabel(textLbl: text, size: size, color: color, textAlignment: textAlignment)
    }
    
    //Adds attributed buttons as needed
    func addAttribution() {
        guard var t = text else {
            print("NO TEXT IN UILABEL - CANNOT ADD ATTRIBUTION")
            return
        }
        let underlineAttriString = NSMutableAttributedString(string: t)
        
        t = t.lowercased()
        
        for i in Tags.shared.tags {
            let targetTag = i.lowercased()
            if t.contains(targetTag) {
                let rangeOfText = (t as NSString).range(of: targetTag)
                
                underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeOfText)
                underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: rangeOfText)
            }
        }
        
        self.attributedText = underlineAttriString
        print(underlineAttriString)
        self.isUserInteractionEnabled = true
    }
    
    func containKeyWords() -> [String] {
        guard let t = text else {
            print("NO TEXT IN UILABEL - CANNOT ADD ATTRIBUTION")
            return []
        }
        var keyWords:[String] = []
        
        for i in Tags.shared.tags {
            if t.lowercased().contains(i.lowercased()) {
                keyWords.append(i)
            }
        }
        return keyWords
    }
}

