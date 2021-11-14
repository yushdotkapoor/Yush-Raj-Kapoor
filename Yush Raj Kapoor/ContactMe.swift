//
//  ContactMe.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import UIKit
import MessageUI
import Contacts

class ContactMe: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var phoneImg: UIButton!
    @IBOutlet weak var emailImg: UIButton!
    @IBOutlet weak var gitImg: UIButton!
    @IBOutlet weak var introductionPage: UIButton!
    @IBOutlet weak var modules: UIButton!
    @IBOutlet weak var addToContacts: UIButton!
    
    let personalInfo = PersonalInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: "Headshot")
        img.layer.cornerRadius = img.frame.height / 2
        
        var tag = "Light"
        if traitCollection.userInterfaceStyle == .light {
            tag = "Dark"
        }
        gitImg.setBackgroundImage(UIImage(named: "GitHub-\(tag)")!, for: .normal)
        gitImg.tintColor = .label
        emailImg.tintColor = .label
        phoneImg.tintColor = .label
        
        setButton(button: introductionPage)
        setButton(button: modules)
        setButton(button: addToContacts)
    }
    
    func setButton(button:UIButton) {
        button.layer.cornerRadius = button.frame.height/2
        button.backgroundColor = .label
        button.title(for: .normal)
        button.widthAnchor.constraint(equalToConstant: (button.titleLabel?.textWidth(withHeight: 17) ?? 0) + 40).isActive = true
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
    
    @IBAction func goToIntroPage(_ sender: Any) {
        performSegue(withIdentifier: "backToIntro", sender: self)
    }

    @IBAction func goToModules(_ sender: Any) {
        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: "ModulesLandingPage") as! ModulesLandingPage
        vc.title = "iOS Modules"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addContact(_ sender: Any) {
        let contact = CNMutableContact()
        
        contact.imageData = img.image?.pngData()
         
        contact.givenName = "Yush"
        contact.middleName = "Raj"
        contact.familyName = "Kapoor"
        
        let email = CNLabeledValue(label: CNLabelHome, value: personalInfo.emailAddress as NSString)
        contact.emailAddresses = [email]
         
        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:personalInfo.phoneNumber))]
         
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        do {
        try store.execute(saveRequest)
            let alertController = UIAlertController(title: "Success", message: "Yush's contact saved successfully.", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
           
            alertController.addAction(dismiss)
            self.present(alertController, animated: true, completion: nil)
        } catch let error {
            let alertController = UIAlertController(title: "Error", message: "Error in saving contact: \(error)", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
           
            alertController.addAction(dismiss)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
}
