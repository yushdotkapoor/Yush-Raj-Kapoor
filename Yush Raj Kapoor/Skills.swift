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
    
    var skills = SkillsData().getSkills()
    
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
            
            let nameLbl = initLabels(skillAttribute: skill.name, size: 30)
            let subLbl = initLabels(skillAttribute: skill.subunits)
            let expLbl = initLabels(skillAttribute: skill.experience, size: 12, color: .secondaryLabel)
            let spacer = initLabels(skillAttribute: " ", size: 8)
            
            let attributeLbl = [nameLbl, expLbl, spacer, subLbl]
            for attribute in attributeLbl {
                stack.addArrangedSubview(attribute)
                attribute.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 20).isActive = true
                attribute.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -20).isActive = true
            }
            nameLbl.topAnchor.constraint(equalTo: stack.topAnchor, constant: 17.5).isActive = true
            
            stack.backgroundColor = .secondarySystemBackground
            stack.layer.cornerRadius = 20
            stack.layer.shadowColor = UIColor.secondaryLabel.cgColor
            stack.layer.shadowOpacity = 1
            stack.layer.shadowOffset = CGSize(width: 2, height: 2)
            stack.layer.shadowRadius = 6
            stackView.addArrangedSubview(stack)
        }
        addSpacer()
    }
    
    func addSpacer() {
        stackView.addArrangedSubview(UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(), height: 10)))
    }
    
    func initLabels(skillAttribute:String, size:CGFloat, color:UIColor=UIColor.label) -> UILabel {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica", size: size)
        label.textColor = color
        label.text = skillAttribute
        return label
    }
    
    func initLabels(skillAttribute:[String]) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = formatBullets(arr: skillAttribute)
        return label
    }
    
}
