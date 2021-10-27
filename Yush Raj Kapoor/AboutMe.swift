//
//  AboutMe.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit


class AboutMe:UIViewController {
    
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var abtMe: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var mainStack: UIStackView!
    
    @IBOutlet weak var ScrollView: UIScrollView!
    let gradient = CAGradientLayer()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubviewToFront(frontView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue(true, forKey: "introViewed")
        
        createBWGradient(page: 2)
        setColors()
        
        mainStack.layer.masksToBounds = false
        ScrollView.indicatorStyle = traitCollection.userInterfaceStyle == .light ? .white:.black
        ScrollView.flashScrollIndicators()
        
        textLabel.text = "Let's take a look at what I can do!\n\nI have been developing iOS applications for over 2 years and have learned lots. Currently, I am a student at Johns Hopkins University and am studying Computer Science and Neuroscience.\n\nThis app is designed to function as a portfolio of my works! You will see a list of projects and their technical details, any skills that I have acquired, hobbies, and contact information.\n\nYou can access this page at anytime from the 'Contact Me' tab."
        
        view.bringSubviewToFront(nextButton)
    }
    
    func setColors() {
        let newLabelColor = UIColor.systemBackground
        abtMe.textColor = newLabelColor
        textLabel.textColor = newLabelColor
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        createBWGradient(page: 2)
    }
    
}
