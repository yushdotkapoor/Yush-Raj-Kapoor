//
//  ContactMe.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import UIKit
import MessageUI

class ContactMe: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var phoneImg: UIButton!
    @IBOutlet weak var emailImg: UIButton!
    @IBOutlet weak var gitImg: UIButton!
    
    let personalInfo = PersonalInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: "Headshot")
        img.layer.cornerRadius = img.frame.height / 2
        
        var tag = "Light"
        if traitCollection.userInterfaceStyle == .light {
            tag = "Dark"
        }
        
        gitImg.setImage(UIImage(named: "GitHub-\(tag)")!, for: .normal)
        gitImg.tintColor = .label
        emailImg.tintColor = .label
        phoneImg.tintColor = .label
        
    }
    
    @IBAction func phoneTapped(_ sender: Any) {
        callPhoneNumber(number: personalInfo.phoneNumber)
    }
    
    @IBAction func emailTapped(_ sender: Any) {
        sendEmail(sender: self, emailAddress: personalInfo.emailAddress)
    }
    
    @IBAction func instagramTapped(_ sender: Any) {
        goToLink(ur: personalInfo.instagramLink)
    }
    
    @IBAction func linkedinTapped(_ sender: Any) {
        goToLink(ur: personalInfo.linkedinLink)
    }
    
    @IBAction func githubTapped(_ sender: Any) {
        goToLink(ur: personalInfo.githubLink)
    }
    
    
}
