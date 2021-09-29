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

extension UIViewController {
    func createBWGradient(page:Int) {
        guard page == 1 || page == 2 else {
            return
        }
        
        var grayscale:CGFloat = 0
        UIColor.systemBackground.getWhite(&grayscale, alpha: nil)
        
        //0 means black on grayscale
        var leftGradientColor:CGFloat = 1
        var rightGradientColor:CGFloat = 0
        
        if grayscale == 0 {
            leftGradientColor = 0
            rightGradientColor = 1
        }
        
        let leftColor = CGColor(gray: leftGradientColor, alpha: 1)
        let RightColor = CGColor(gray: rightGradientColor, alpha: 1)
        var colorArray = [CGColor(gray: 1/2, alpha: 1)]
        switch page {
            case 1:
                colorArray.insert(leftColor, at: 0)
                break
            case 2:
                colorArray.append(RightColor)
            default:
            break
        }
        
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = colorArray
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        view.layer.addSublayer(gradient)
        
    }
}

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
