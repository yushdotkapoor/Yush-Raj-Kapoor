//
//  NSMutableAttributedStringExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/29/21.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    var fontSize:CGFloat { return 20 }
    var boldFont:UIFont { return UIFont(name: "Helvetica-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "Helvetica-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
