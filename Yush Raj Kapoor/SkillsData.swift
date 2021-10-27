//
//  SkillsData.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/1/21.
//

import Foundation
import UIKit

class SkillsData {
    
    var xcode = skill(name: "Xcode", subunits: ["App development/deployment", "MVC/MVMM", "SPM", "Cocoapods", "Push Notifications"], experience: "2 years of experience")
    var swift = skill(name: "Swift", subunits: ["Photo and Video capture", "AVKit", "AVFoundation", "Music handling", "SiriKit", "ARKit", "CoreMotion", "CoreLocation", "StoreKit", "Haptics", "AudioKit", "MessageKit", "Firebase"], experience: "2 years of experience")
    var firebase = skill(name: "Firebase", subunits: ["Integrations with JavaScript, Swift, Python, AppsScript, and HTML", "Firebase Cloud Messaging (Push Notification)", "Realtime Database", "Performance monitoring", "Analytics monitoring", "App distribution"], experience: "2 years of experience")
    var aws = skill(name: "AWS Lambda", subunits: ["Python script on a trigger"], experience: "")
    var html = skill(name: "HTML", subunits: ["Basic forms", "Firebase"], experience: "6 months of experience")
    var appsscript = skill(name: "Google AppsScript", subunits: ["Spreadsheet connections", "Firebase", "HTML connections", "Scripts on timers"], experience: "2 years of experience")
    var python = skill(name: "Python", subunits: ["pip", "prophet", "panda", "playsound", "robin_stocks", "logging", "signal", "pyrebase", "matplotlib"], experience: "1 year of experience")
    var java = skill(name: "Java", subunits: ["Linked Lists", "Trees", "Graphs", "Good code writing practices"], experience: "1 year of experience")
    var beard = skill(name: "Ability to grow a Beard", subunits: ["Can grow full stuble in 1 week and a thin beard in 2.5", "Essential for any code to work", "It seems as though my powers reside within each beard follicle", "The bigger the beard, the better the code"], experience: "Many years of experience")
    
    
    
    func getSkills() -> [skill] {
        let skills = [xcode, swift, beard, firebase, appsscript, java, python, html, aws]
        return skills
    }
}
