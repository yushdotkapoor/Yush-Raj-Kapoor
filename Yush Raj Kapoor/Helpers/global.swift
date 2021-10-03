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
    for a in bulletArray {
        let formatted = " • \(a)\n"
        str.append(formatted)
    }
    return str
}


