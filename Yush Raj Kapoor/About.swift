//
//  Hobbies.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import UIKit
import AVKit

class About: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    @IBOutlet weak var scrollView: UIScrollView!
    
    let textFieldHeightConstant = 0.8379705401
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.layer.masksToBounds = false
        
        let masterStack = UIStackView()
        masterStack.axis = .vertical
        masterStack.spacing = 20
        
        let width = screenWidth - 80
        
        let sectionHeaders = ["Hobbies", "Community", "School"]
        let aboutData = AboutData()
        
        for sectionHeader in sectionHeaders {
            
            let sectionSpacingConstant:CGFloat = 16
            
            let topBuffer = initLabel(textLbl: " ", size: (17.5-sectionSpacingConstant) * textFieldHeightConstant)
            let headerLbl = initLabel(textLbl: sectionHeader, size: 30)
            
            let sectionStack = UIStackView()
            sectionStack.spacing = sectionSpacingConstant
            sectionStack.axis = .vertical
            sectionStack.addArrangedSubview(topBuffer)
            sectionStack.addArrangedSubview(headerLbl)
            
            headerLbl.constrain(reference: sectionStack, leading: 20)
            
            var newView = UIStackView()
            
            if sectionHeader == sectionHeaders[0] {
                let infoData = aboutData.getHobbies()
                for i in infoData {
                    newView = newHobbyStack(title: i.name, duration: i.years, description: i.description, media: i.media)
                    
                    sectionStack.addArrangedSubview(newView)
                    newView.constrain(reference: sectionStack, leading: 20, trailing: 20)
                }
            } else if sectionHeader == sectionHeaders[1] {
                let infoData = aboutData.getCommunity()
                for i in infoData {
                    newView = newCommunityStack(title: i.organization, positions: i.positions)
                    
                    sectionStack.addArrangedSubview(newView)
                    newView.constrain(reference: sectionStack, leading: 20, trailing: 20)
                }
            } else if sectionHeader == sectionHeaders[2] {
                let infoData = aboutData.getSchool()
                for i in infoData {
                    newView = newSchoolStack(school: i.name, gradYear: i.graduationYear, location: "\(i.city), \(i.state)", studyGPA: (i.GPA != "") ? "\(i.GPA) GPA":i.subjects.joined(separator: ", "))
                    
                    sectionStack.addArrangedSubview(newView)
                    newView.constrain(reference: sectionStack, leading: 20, trailing: 20)
                }
            }
            
            let bottomBuffer = initLabel(textLbl: " ", size: (17.5-sectionSpacingConstant) * textFieldHeightConstant)
            sectionStack.addArrangedSubview(bottomBuffer)
            
            sectionStack.backgroundColor = .secondarySystemBackground
            sectionStack.layer.cornerRadius = 20
            sectionStack.layer.shadowColor = UIColor.secondaryLabel.cgColor
            sectionStack.layer.shadowOpacity = 1
            sectionStack.layer.shadowOffset = CGSize(width: 2, height: 2)
            sectionStack.layer.shadowRadius = 6
            
            masterStack.addArrangedSubview(sectionStack)
            sectionStack.refactor(withWidth: width)
        }
        masterStack.refactor(withWidth: width + 40, x:20, y:20)
        
        scrollView.addSubview(masterStack)
        masterStack.constrain(reference: scrollView, top: 20, bottom: 30, leading: 20, trailing: 20)
        
    }
    
    func newHobbyStack(title:String, duration:String, description:String, media:[String]=[]) -> UIStackView {
        let width = screenWidth - 80
        
        let titlLbl = initLabel(textLbl: title, size: 25, color: .secondaryLabel)
        let durLbl = initLabel(textLbl: duration, size: 12, color: .secondaryLabel)
        let titleStack = UIStackView()
        titleStack.axis = .vertical
        titleStack.addArrangedSubview(titlLbl)
        titleStack.addArrangedSubview(durLbl)
        titleStack.refactor(withWidth: width)
        
        let descLbl = initLabel(textLbl: description)
        
        let mediaStack = createImageStack(media: media)
        
        let VStack = UIStackView()
        VStack.axis = .vertical
        VStack.spacing = 8
        VStack.addArrangedSubview(titleStack)
        VStack.addArrangedSubview(descLbl)
        if media != [] {
            VStack.addArrangedSubview(mediaStack)
        }
        
        VStack.refactor(withWidth: width)
        return VStack
    }
    
    func newCommunityStack(title:String, positions:[position]) -> UIStackView {
        let VStackSpacing:CGFloat = 10
        
        let titlLbl = initLabel(textLbl: title, size: 25, color: .secondaryLabel)
        
        let width = screenWidth - 80
        
        let titlHeight = titlLbl.textHeight(withWidth: width)
        
        let VStack = UIStackView(frame: CGRect(x: 0, y: 0, width: width, height: titlHeight))
        VStack.spacing = VStackSpacing
        VStack.axis = .vertical
        VStack.addArrangedSubview(titlLbl)
        var totalViews:[UIStackView]?
        
        var newHeights:CGFloat = titlHeight
        for n in positions {
            let newView = newPositionStack(position: n.name, duration: "\(n.startDate)-\(n.endDate)", description: formatBullets(arr: n.jobs), media: n.media)
            VStack.addArrangedSubview(newView)
            newHeights += (newView.frame.height + VStackSpacing)
            totalViews?.append(newView)
        }
        VStack.refactor(withWidth: width)
        
        return VStack
    }
    
    func newPositionStack(position:String, duration:String, description:String, media:[String]=[]) -> UIStackView {
        let width = screenWidth - 80
        
        let posLbl = initLabel(textLbl: position, size: 20)
        let durLbl = initLabel(textLbl: duration, size: 12, color: .secondaryLabel)
        let titleStack = UIStackView()
        titleStack.axis = .vertical
        titleStack.addArrangedSubview(posLbl)
        titleStack.addArrangedSubview(durLbl)
        
        titleStack.refactor(withWidth: width)
        
        let descLbl = initLabel(textLbl: description)
        
        let mediaStack = createImageStack(media: media)
        
        
        let VStack = UIStackView()
        VStack.axis = .vertical
        VStack.spacing = 8
        VStack.addArrangedSubview(titleStack)
        VStack.addArrangedSubview(descLbl)
        if media != [] {
            VStack.addArrangedSubview(mediaStack)
        }
        
        VStack.refactor(withWidth: width)
        
        return VStack
    }
    
    func newSchoolStack(school:String, gradYear:String, location:String, studyGPA:String, media:[String]=[]) -> UIStackView {
        let width = screenWidth - 80
        
        let schlLbl = initLabel(textLbl: school, color: .secondaryLabel)
        let gradLbl = initLabel(textLbl: gradYear, size: 12, color: .secondaryLabel)
        let titleStack = UIStackView()
        titleStack.axis = .vertical
        titleStack.addArrangedSubview(schlLbl)
        titleStack.addArrangedSubview(gradLbl)
        titleStack.refactor(withWidth: width)
        
        let locLbl = initLabel(textLbl: location)
        let stdyLbl = initLabel(textLbl: studyGPA)
        let meatStack = UIStackView()
        meatStack.axis = .vertical
        meatStack.spacing = 5
        meatStack.addArrangedSubview(locLbl)
        meatStack.addArrangedSubview(stdyLbl)
        meatStack.refactor(withWidth: width)
        
        let mediaStack = createImageStack(media: media)
        
        let VStack = UIStackView()
        VStack.axis = .vertical
        VStack.spacing = 8
        VStack.addArrangedSubview(titleStack)
        VStack.addArrangedSubview(meatStack)
        if media != [] {
            VStack.addArrangedSubview(mediaStack)
        }
        
        VStack.refactor(withWidth: width)
        
        return VStack
    }
    
    
    func createImageStack(media:[String]) -> UIStackView {
        let width = screenWidth - 80
        
        let mediaStack = UIStackView()
        mediaStack.axis = .horizontal
        mediaStack.spacing = 10
        mediaStack.distribution = .fillEqually
        
        for i in media {
            let splitted = i.split(separator: ".")
            let name = splitted.first!
            let type = splitted.last!
            
            let imageView = UIImageView()
            imageView.isUserInteractionEnabled = true
            imageView.contentMode = .scaleAspectFill
            var img:UIImage?
            if type == "JPG" {
                img = UIImage(named: i)
                imageView.accessibilityLanguage = nil
            } else if type == "mov" {
                let u = createLocalUrl(for: "\(name)", ofType: "\(type)")
                img = getThumbnailFrom(path: u!)
                img = img?.drawPlayButton()
                imageView.accessibilityLanguage = i
            }
            let prevWidth = img?.size.width ?? 0
            let newWidth = width/CGFloat(media.count)
            let newHeight = (img?.size.height ?? 0) * (newWidth / prevWidth)
            imageView.image = img?.resize(targetSize: CGSize(width: width/CGFloat(media.count), height: newHeight))
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 25
            
            mediaStack.addArrangedSubview(imageView)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }
        mediaStack.refactor(withWidth: width)
        
        return mediaStack
    }
    
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        if let imgView = sender.view as? UIImageView {
            if let name = imgView.accessibilityLanguage {
                let url = createLocalUrl(for: "\(name.split(separator: ".").first!)", ofType: "\(name.split(separator: ".").last!)") ?? URL(fileURLWithPath: "")
                playVideo(path: url, sender: self)
            } else {
                let vc = PhotoViewerViewController(with: imgView)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
