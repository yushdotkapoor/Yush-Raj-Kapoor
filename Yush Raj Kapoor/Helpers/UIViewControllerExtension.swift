//
//  UIViewControllerExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/30/21.
//

import Foundation
import UIKit
import MessageUI

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
    
    //for sending emails
    func sendEmail(sender: MFMailComposeViewControllerDelegate, emailAddress:String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = sender
            mail.setToRecipients([emailAddress])
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    @objc(mailComposeController:didFinishWithResult:error:) func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}

