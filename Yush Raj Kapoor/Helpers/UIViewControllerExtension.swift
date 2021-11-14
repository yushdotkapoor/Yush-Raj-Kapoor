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
    
    func presentBasedOnText(text: String) {
        
        
        if text.isClassModules() {
            let mods = ModulesData.shared.modules
            for i in mods {
                let tags = i.tags
                for j in tags {
                    if j == text {
                        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: i.storyboardIdentifier)
                        navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        } else if text.isClassProjects() {
            let projs = ProjectsData.shared.projects
            
            for i in projs {
                if i.name == text {
                    let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: "ProjectsLandingPage") as ProjectsLandingPage
                    vc.textDesc = i.longDescription
                    vc.textSkills = i.skillsUsed
                    vc.textChallenges = i.challenges
                    vc.textFeatures = i.features
                    vc.textLanguages = i.languages
                    vc.urls = i.urls
                    vc.thumbs = i.thumbnails
                    vc.iconName = i.appIconName
                    vc.title =  i.name
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
        
        
        
        
//        if text.isClassProjects() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: { [self] in
//                tabBarController?.selectedIndex = 0
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
//                    if let top = UIApplication.getTopViewController() as? Projects {
//                        print("IS WORK!!")
//                        let projectArray = top.data
//                        let tb = top.tableView
//                        for (i, proj) in (projectArray ?? []).enumerated() {
//                            if proj.name == text {
//                                let indexPath = IndexPath(row: 0, section: i)
//                                tb?.selectRow(at: indexPath, animated: true, scrollPosition: .none)
//                                tb?.delegate?.tableView!(tb!, didSelectRowAt: indexPath)
//                            }
//                        }
//                    }
//                })
//            })
//        } else if text.isClassModules() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: { [self] in
//                tabBarController?.selectedIndex = 3
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
//                    if let top = UIApplication.getTopViewController() as? ContactMe {
//                        top.goToModules(self)
//                        if let secondTop = UIApplication.getTopViewController() as? ModulesLandingPage {
//                            let mods = secondTop.modules
//                            let buttons = secondTop.view.buttonSniffer()
//                            for i in mods {
//                                let tags = i.tags
//                                for j in tags {
//                                    if j == text {
//                                        for k in buttons {
//                                            if k.title(for: .normal) == i.buttonText {
//                                                k.sendActions(for: .touchUpInside)
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                })
//            })
//        }
        
        
    }
    
}

