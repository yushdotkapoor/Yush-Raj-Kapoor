//
//  Hello.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit

class Hello:UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var blurb: UILabel!
    @IBOutlet weak var stack: UIStackView!
    
    var imgOriginalHeight:CGFloat?
    var lastHeightConstraint:NSLayoutConstraint?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubviewToFront(frontView)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        createBWGradient(page: 1)
        img.alpha = 0
        blurb.alpha = 0
        setUpImage()
        setBlurb()
        
        ScrollView.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.img.fadeIn()
            self.blurb.fadeIn()
        })
    }
    
    func setUpImage() {
        lastHeightConstraint = img.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40)
        activateConstraintAndUpdateCorners()
        imgOriginalHeight = img.frame.height
    }
    
    func setBlurb() {
        blurb.text = "My name is Yush and I want to make sure you get to know me and see firsthand what magic I can create through making iOS apps.\n\nLet's get this party started!"
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let threshold:CGFloat = 260
        let yOffset = scrollView.contentOffset.y
        if yOffset < threshold && yOffset > 0 {
            //recycles constraint
            img.removeConstraint(lastHeightConstraint!)
            lastHeightConstraint = img.heightAnchor.constraint(equalToConstant: imgOriginalHeight! - (yOffset))
            activateConstraintAndUpdateCorners()
        }
    }
    
    func activateConstraintAndUpdateCorners() {
        lastHeightConstraint!.isActive = true
        img.layoutIfNeeded()
        img.layer.cornerRadius = img.frame.height/4
    }
    
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        createBWGradient(page: 1)
    }
    
    
}

