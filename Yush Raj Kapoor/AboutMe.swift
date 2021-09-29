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
    
    @IBOutlet weak var ScrollView: UIScrollView!
    let gradient = CAGradientLayer()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubviewToFront(frontView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBWGradient(page: 2)
        setColors()
        
    }
    
    func setColors() {
        let newLabelColor = UIColor.systemBackground
        let newBackgroundColor = UIColor.label
        abtMe.textColor = newLabelColor
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        createBWGradient(page: 2)
    }
    
}
