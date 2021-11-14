//
//  global.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit
import AVKit

//for haptic feedback
func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
}

func impact(style: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(style)
}

//opens url
func goToLink(ur:String) {
    guard let url = URL(string: ur) else { return }
    UIApplication.shared.open(url)
}

//calls a phone number
func callPhoneNumber(number: String) {
    guard let url = URL(string: "telprompt://\(number)"),
          UIApplication.shared.canOpenURL(url) else {
              return
          }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
}

//formats a string array to a singular string as a bulleted list
func formatBullets(arr:[String]) -> String {
    var bulletArray = arr
    bulletArray.sort()
    var str = ""
    for (i, a) in bulletArray.enumerated() {
        var formatted = " • \(a)"
        if (i+1) != bulletArray.count {
            formatted += "\n"
        }
        str.append(formatted)
    }
    return str
}


//creates a Local URL for a file
func createLocalUrl(for filename: String, ofType: String) -> URL? {
    let fileManager = FileManager.default
    let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let url = cacheDirectory.appendingPathComponent("\(filename).\(ofType)")
    
    guard fileManager.fileExists(atPath: url.path) else {
        guard let video = NSDataAsset(name: filename)  else { return nil }
        fileManager.createFile(atPath: url.path, contents: video.data, attributes: nil)
        return url
    }
    
    return url
}

//gets thumbnail from a video
func getThumbnailFrom(path: URL) -> UIImage? {
    do {
        let asset = AVURLAsset(url: path , options: nil)
        let length = Float(CMTimeGetSeconds(asset.duration))
        let imgGenerator = AVAssetImageGenerator(asset: asset)
        imgGenerator.appliesPreferredTrackTransform = true
        let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: Int64(length)/2, timescale: 1), actualTime: nil)
        let thumbnail = UIImage(cgImage: cgImage)
        
        return thumbnail
        
    } catch let error {
        print("*** Error generating thumbnail: \(error.localizedDescription)")
        return nil
    }
}

//corrects spaces in URL path
func correctSpaces(str: String) -> String {
    return str.replacingOccurrences(of: " ", with: "_")
}

//plays a media file using a url
func playVideo(path:URL, sender: UIViewController) {
    let player = AVPlayer(url: path)
    let playerController = AVPlayerViewController()
    playerController.player = player
    sender.present(playerController, animated: true) {
        player.play()
    }
}

//plays an audio file
var player: AVAudioPlayer?
func playSound(name:String, type:String? = nil) {
    var fileType:String?
    var fileName:String?
    let split = name.split(separator: ".")
    
    if split.count == 1 {
        //just the name and needs type
        if let first = split.first {
            fileName = String(first)
        }
        fileType = type
    } else {
        fileName = split.allButFirst()
        if let last = split.last {
            fileType = String(last)
        }
    }
    
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileType) else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        
        
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        
        guard let player = player else { return }
        
        player.volume = 3
        player.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}

//imports data
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
    
    var modules:[Module] = []
    ref.child("Modules").observeSingleEvent(of: .value, with: { snapshot in
        if let data = snapshot.value as? NSArray {
            for i in data {
                if let info = i as? NSDictionary {
                    let story = info["storyboardIdentifier"] as? String ?? ""
                    let bText = info["buttonText"] as? String ?? ""
                    let tags = (info["tags"] as? NSArray) as? [String] ?? []
                    
                    let newModule = Module(storyboardIdentifier: story, buttonText: bText, tags: tags)
                    modules.append(newModule)
                }
            }
        }
        ModulesData.shared.modules = modules
    })
}
