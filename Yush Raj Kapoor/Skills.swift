//
//  Skills.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import UIKit

class Skills: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    var skills = SkillsData.shared.skills
    
    var masterLabels:[UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }
    
    func setUpLabels() {
        stackView.spacing = 20
        stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        addSpacer()
        for skill in skills {
            let stack = UIStackView()
            stack.axis = .vertical
            
            let nameLbl = UILabel().initLabel(textLbl: skill.name, size: 30)
            let subLbl = UILabel().initLabel(textLbls: skill.subunits)
            let expLbl = UILabel().initLabel(textLbl: skill.experience, size: 12, color: .secondaryLabel)
            let spacer = UILabel().initLabel(textLbl: " ", size: 8)
            let buffer = UILabel().initLabel(textLbl: " ", size: 17.5)
            
            let attributeLbl = [nameLbl, expLbl, spacer, subLbl, buffer]
            for attribute in attributeLbl {
                stack.addArrangedSubview(attribute)
                attribute.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 20).isActive = true
                attribute.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -20).isActive = true
            }
            nameLbl.topAnchor.constraint(equalTo: stack.topAnchor, constant: 17.5).isActive = true
            subLbl.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -17.5).isActive = true
            
            stack.backgroundColor = .secondarySystemBackground
            stack.layer.cornerRadius = 20
            stack.layer.shadowColor = UIColor.secondaryLabel.cgColor
            stack.layer.shadowOpacity = 1
            stack.layer.shadowOffset = CGSize(width: 2, height: 2)
            stack.layer.shadowRadius = 6
            stackView.addArrangedSubview(stack)
        }
        addSpacer()
        
        masterLabels = stackView.labelSniffer()
        for i in masterLabels {
            i.addAttribution()
            if i.containKeyWords() != [] {
                i.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
            }
        }
    }
    
    func addSpacer() {
        stackView.addArrangedSubview(UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(), height: 10)))
    }
    
    
    @objc func tapLabel(gesture: UIGestureRecognizer) {
        for i in masterLabels {
            guard let lblText = i.text?.lowercased() else {
                continue
            }
            
            let strings = i.containKeyWords()
            for j in strings {
                let textRange = (lblText as NSString).range(of: j.lowercased())
                
                if gesture.didTapAttributedTextInLabel(label: i, inRange: textRange) {
                    impact(style: .medium)
                    presentBasedOnText(text: j)
                }
            }
        }
    }
    
    
}
