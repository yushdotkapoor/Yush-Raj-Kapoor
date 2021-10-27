//
//  MainScreen.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit

class MainScreen:UIViewController {
    @IBOutlet weak var yrkStack: UIStackView!
    @IBOutlet weak var ush: UILabel!
    @IBOutlet weak var aj: UILabel!
    @IBOutlet weak var apoor: UILabel!
    @IBOutlet weak var Y: UILabel!
    @IBOutlet weak var R: UILabel!
    @IBOutlet weak var K: UILabel!
    @IBOutlet weak var tagStack: UIStackView!
    @IBOutlet weak var tagHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shiftStackLeft()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Hide label tags
        ush.isHidden = true
        aj.isHidden = true
        apoor.isHidden = true
        //Make sure labels are also transparent
        ush.alpha = 0
        aj.alpha = 0
        apoor.alpha = 0
        
        //Make sure Stack is centered
        yrkStack.translatesAutoresizingMaskIntoConstraints = true
        yrkStack.center = view.center
        
        //tagStack needs to match yrkStack
        tagStack.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: tagStack!, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 20 + yrkStack.frame.size.width))
        tagStack.transform = CGAffineTransform(translationX: 0, y: (Y.font.pointSize/2)-(apoor.font.pointSize))
        
    }
    
    func shiftStackLeft() {
        let deviceWidth = UIScreen.main.bounds.width
        UIView.animate(withDuration: 0.75, delay: 1, options: .curveEaseInOut, animations: { [self] in
            //move the stack 10 units from the leading edge
            yrkStack.transform = CGAffineTransform(translationX: -(deviceWidth/2) + 20 + (yrkStack.frame.width/2), y: 0)
        }, completion: {[self] _ in
            fadeTagsIn()
        })
    }
    
    
    
    func fadeTagsIn() {
        ush.isHidden = false
        aj.isHidden = false
        apoor.isHidden = false
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: { [self] in
            ush.alpha = 1
            aj.alpha = 1
            apoor.alpha = 1
        }, completion: { [self] _ in
            shrinkStack()
        })
    }
    
    func shrinkStack() {
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: { [self] in
            
            let height = Y.frame.height
            let detailDelta = (height-Y.font.pointSize)
            var transforms = CGAffineTransform.identity
            transforms = transforms.scaledBy(x: 0.25, y: 0.25)
            transforms = transforms.translatedBy(x: 0, y: height-detailDelta)
            K.transform = transforms
            transforms = transforms.translatedBy(x: 0, y: 3*height)
            R.transform = transforms
            transforms = transforms.translatedBy(x: 0, y: 3*height)
            Y.transform = transforms
            
            
            
            //reset transforms for tag transforms
            tagStack.transform = CGAffineTransform.init(translationX: -(yrkStack.frame.width)/3-(tagStack.transform.ty/8), y: tagStack.transform.ty+yrkStack.frame.height/4)
            
            tagHeight.constant -= yrkStack.frame.height*3/4
            tagStack.layoutIfNeeded()
        }, completion: { [self] _ in
            displayButton()
        })
    }
  
    func displayButton() {
        let nextButton = UIButton(frame: CGRect(x: view.frame.width - 100, y: K.frame.origin.y+(K.transform.ty/2)-(K.frame.height/2), width: 100, height: 100))
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        
        let introViewed = UserDefaults.standard.bool(forKey: "introViewed")
        var segueIdentifier = "MainToIntro"
        if introViewed {
            segueIdentifier = "straightToTabBar"
        }
        
        nextButton.addAction(UIAction(handler: {[self] _ in
            performSegue(withIdentifier: segueIdentifier, sender: self)
        }), for: .touchUpInside)
        
        
        view.addSubview(nextButton)
    }
    
}
