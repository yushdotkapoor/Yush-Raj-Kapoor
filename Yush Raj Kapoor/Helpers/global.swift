//
//  global.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit

//for haptic feedback
func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
}

func impact(style: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(style)
}

//opens url
func goToLink(ur:String) {
    guard let url = URL(string: ur) else { return }
    UIApplication.shared.open(url)
}

//calls a phone number
func callPhoneNumber(number: String) {
    guard let url = URL(string: "telprompt://\(number)"),
          UIApplication.shared.canOpenURL(url) else {
        return
    }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
}

//formats a string array to a singular string as a bulleted list
func formatBullets(arr:[String]) -> String {
    var bulletArray = arr
    bulletArray.sort()
    var str = ""
    for (i, a) in bulletArray.enumerated() {
        var formatted = " • \(a)"
        if (i+1) != bulletArray.count {
            formatted += "\n"
        }
        str.append(formatted)
    }
    return str
}

//initializes label with many properties to save space
func initLabel(textLbl:String="", size:CGFloat=17, color:UIColor=UIColor.label, textAlignment:NSTextAlignment=NSTextAlignment.left) -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = textAlignment
    label.font = label.font.withSize(size)
    label.textColor = color
    label.text = textLbl
    return label
}

//initializes label with an array to form bullet point style text
func initLabel(textLbls:[String], size:CGFloat=17, color:UIColor=UIColor.label, textAlignment:NSTextAlignment=NSTextAlignment.left) -> UILabel {
    let text = formatBullets(arr: textLbls)
    return initLabel(textLbl: text, size: size, color: color, textAlignment: textAlignment)
}


