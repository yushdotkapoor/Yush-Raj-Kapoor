//
//  ArrayExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/24/21.
//

import Foundation
import UIKit

extension Array where Element == CGFloat {
    func sum() -> CGFloat {
        var sum:CGFloat = 0
        for i in self {
            sum += i
        }
        return sum
    }
}

extension Array where Element == Substring {
    func allButFirst() -> String {
        var strArr = self
        strArr.removeLast()
        return strArr.joined(separator: "")
    }
}
