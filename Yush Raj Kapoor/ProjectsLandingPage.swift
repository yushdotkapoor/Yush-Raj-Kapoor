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
    @IBOutlet weak var features: UILabel!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var imgStack: UIStackView!
    @IBOutlet weak var thumbScrollView: UIScrollView!
    
    var textDesc:String?
    var textSkills:[String:String]?
    var textChallenges:[String]?
    var textFeatures:[String]?
    var textLanguages:[String]?
    var urls:[String:String]?
    var thumbs:Int?
    var iconName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desc.text = textDesc
        skills.attributedText = formatSkills()
        challenges.text = formatBullets(arr: textChallenges!)
        langs.text = formatBullets(arr: textLanguages!)
        features.text = formatBullets(arr: textFeatures!)
        
        titleResize()
        setThumbs()
        setButttonView()
        
    }
    
    func setThumbs() {
        var ct = 0
        var maxHeight:CGFloat = 0
        while ct < thumbs! {
            ct += 1
            let imgName = "\(iconName!)_screen_\(ct)"
            let uiimage = UIImage(named: imgName)
            let width = UIScreen.main.bounds.width/2.3
            let height = width * (uiimage?.size.height ?? 2) / (uiimage?.size.width ?? 1)
            
            let img = UIImageView(frame: CGRect(x: width * CGFloat(ct - 1), y: 0, width: width, height: height))
            img.image = uiimage?.resize(targetSize: CGSize(width: width, height: height))
            
            if height > maxHeight {
                maxHeight = height
            }
            
            imgStack.addArrangedSubview(img)
        }
        
        thumbScrollView.heightAnchor.constraint(equalToConstant: maxHeight).isActive = true
        thumbScrollView.layoutIfNeeded()
    }
    
    func setButttonView() {
        for u in urls!.keys {
            let button = UIButton()
            button.addAction(UIAction(handler: { [self]_ in
                goToLink(ur: urls![u]!)
            }), for: .touchUpInside)
            button.setTitleColor(.systemBlue, for: .normal)
            button.setImage(chooseButtonImage(str: u), for: .normal)
            
            buttonStack.addArrangedSubview(button)
        }
    }
    
    func chooseButtonImage(str:String) -> UIImage {
        var tag = "Light"
        if traitCollection.userInterfaceStyle == .light {
            tag = "Dark"
        }
        
        switch str {
        case "AppStore":
            return UIImage(named: "AppStore-\(tag)")!
        case "GitHub":
            return UIImage(named: "GitHub-\(tag)")!
        default:
            return UIImage(named: "null")!
        }
    }
    
    func titleResize() {
        var fontSize:CGFloat = 35
        var size:CGFloat?
        repeat {
            fontSize -= 1
            size = self.title?.size(withAttributes:[.font: UIFont.systemFont(ofSize: fontSize)]).width
        } while size! > UIScreen.main.bounds.width - 50
        
        let font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        let attributes = [NSAttributedString.Key.font: font]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
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
