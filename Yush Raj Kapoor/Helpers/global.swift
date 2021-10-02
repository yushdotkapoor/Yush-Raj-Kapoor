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


func formatBullets(arr:[String]) -> String {
    var str = ""
    for a in arr {
        let formatted = " • \(a)\n"
        str.append(formatted)
    }
    return str
}


