//
//  AppDelegate.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit
import Firebase

let ref = Database.database().reference()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        
        importData()
        
        return true
    }
    
    func importData() {
        if let text = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            
            ref.child("Versions/\(text)").observeSingleEvent(of: .value, with: { snapshot in
                if let val = snapshot.value as? Bool {
                    shouldPass = val
                } else {
                    ref.child("Versions/\(text)").setValue(false)
                    shouldPass = false
                }
            })
        }
        
        var schools:[school] = []
        ref.child("School").observeSingleEvent(of: .value, with: { snapshot in
            if let data = snapshot.value as? NSArray {
                for i in data {
                    if let info = i as? NSDictionary {
                        let name = info["name"] as? String ?? ""
                        let city = info["city"] as? String ?? ""
                        let state = info["state"] as? String ??  ""
                        let gradYear = info["graduationYear"] as? String ?? ""
                        let gpa = info["GPA"] as? String ?? ""
                        let subjects = (info["subjects"] as? NSArray) as? [String] ?? []
                        let newSchool = school(name: name, city: city, state: state, graduationYear: gradYear, GPA: gpa, subjects: subjects == [""] ? []:subjects)
                        schools.append(newSchool)
                    }
                }
            }
            AboutData.shared.schools = schools
        })
        
        var hobbies:[hobby] = []
        ref.child("Hobby").observeSingleEvent(of: .value, with: { snapshot in
            if let data = snapshot.value as? NSArray {
                for i in data {
                    if let info = i as? NSDictionary {
                        let name = info["name"] as? String ?? ""
                        let years = info["years"] as? String ?? ""
                        let desc = info["description"] as? String ??  ""
                        let med = (info["media"] as? NSArray) as? [String] ?? []
                        
                        let newHobby = hobby(name: name, years: years, description: desc, media: med == [""] ? []:med)
                        hobbies.append(newHobby)
                    }
                }
            }
            AboutData.shared.hobbies = hobbies
        })
        
        var communities:[community] = []
        ref.child("Community").observeSingleEvent(of: .value, with: { snapshot in
            if let data = snapshot.value as? NSArray {
                for i in data {
                    if let info = i as? NSDictionary {
                        let org = info["organization"] as? String ?? ""
                        let positions = info["positions"] as? NSArray ?? []
                        
                        var newPositions:[position] = []
                        for pos in positions {
                            if let posInfo = pos as? NSDictionary {
                                let name = posInfo["name"] as? String ?? ""
                                let start = posInfo["startDate"] as? String ?? ""
                                let end = posInfo["endDate"] as? String ?? ""
                                let jobs = (posInfo["jobs"] as? NSArray) as? [String] ?? []
                                let med = (posInfo["media"] as? NSArray) as? [String] ?? []
                                
                                let newPosition = position(name: name, startDate: start, endDate: end, jobs: jobs, media: med == [""] ? []:med)
                                newPositions.append(newPosition)
                            }
                        }
                        let newCommunity = community(organization: org, positions: newPositions)
                        communities.append(newCommunity)
                    }
                }
            }
            AboutData.shared.communities = communities
        })
        
        var skills:[skill] = []
        ref.child("Skills").observeSingleEvent(of: .value, with: { snapshot in
            if let data = snapshot.value as? NSArray {
                for i in data {
                    if let info = i as? NSDictionary {
                        let name = info["name"] as? String ?? ""
                        let exp = info["experience"] as? String ?? ""
                        let subunits = (info["subunits"] as? NSArray) as? [String] ?? []
                        
                        let newSkill = skill(name: name, subunits: subunits, experience: exp)
                        skills.append(newSkill)
                    }
                }
            }
            SkillsData.shared.skills = skills
        })
        
        var projects:[project] = []
        ref.child("Projects").observeSingleEvent(of: .value, with: { snapshot in
            if let data = snapshot.value as? NSArray {
                for i in data {
                    if let info = i as? NSDictionary {
                        let name = info["name"] as? String ?? ""
                        let short = info["shortDescription"] as? String ?? ""
                        let long = info["longDescription"] as? String ?? ""
                        let feat = (info["features"] as? NSArray) as? [String] ?? []
                        let langs = (info["languages"] as? NSArray) as? [String] ?? []
                        let start = info["startDate"] as? String ?? ""
                        let end = info["endDate"] as? String ?? ""
                        let icon = info["appIconName"] as? String ?? ""
                        let skills = info["skillsUsed"] as? [String:String] ?? [:]
                        let challenge = (info["challenges"] as? NSArray) as? [String] ?? []
                        let thumbs = info["thumbnails"] as? Int ?? -1
                        let urls = info["urls"] as? [String:String] ?? [:]
                        
                        let newProject = project(name: name, shortDescription: short, longDescription: long, features: feat, languages: langs, startDate: start, endDate: end, appIconName: icon, skillsUsed: skills, challenges: challenge, thumbnails: thumbs, urls: urls)
                        projects.append(newProject)
                    }
                }
            }
            ProjectsData.shared.projects = projects
        })
        
        
        
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

