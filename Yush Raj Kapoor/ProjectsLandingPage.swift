//
//  ProjectsLandingPage.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/28/21.
//

import UIKit

class ProjectsLandingPage: UIViewController {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var skills: UILabel!
    @IBOutlet weak var challenges: UILabel!
    @IBOutlet weak var langs: UILabel!
    
    var textDesc:String?
    var textSkills:[String:String]?
    var textChallenges:[String]?
    var textFeatures:[String]?
    var textLanguages:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desc.text = formatDescription()
        skills.attributedText = formatSkills()
        challenges.text = formatBullets(arr: textChallenges!)
        langs.text = formatBullets(arr: textLanguages!)
    }
 
    func formatBullets(arr:[String]) -> String {
        var str = ""
        for a in arr {
            let formatted = " • \(a)\n"
            str.append(formatted)
        }
        return str
    }
    
    func formatDescription() -> String {
        let formattedFeatures = formatBullets(arr: textFeatures!)
        let str = "\(textDesc!)\n\nFeatures Include:\n\(formattedFeatures)"
        return str
    }
    
    func formatSkills() -> NSMutableAttributedString {
        var str = NSMutableAttributedString()
        
        for key in textSkills!.keys {
            let value = textSkills![key]
            str = str.bold("\(key): ").normal("\(value!)\n")
        }
        return str
    }

}
