//
//  StringExtension.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/23/21.
//

import UIKit

extension String {
    func height(withWidth width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font : font], context: nil)
        return actualSize.height
    }
    
    func width(withHeight height: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font : font], context: nil)
        return actualSize.width
    }
    
    func stringToMorse() -> String {
        var morse = ""
        let string = self
        for i in string {
            switch i.lowercased() {
            case "a":
                morse.append("·- ")
                break
            case "b":
                morse.append("-··· ")
                break
            case "c":
                morse.append("-·-· ")
                break
            case "d":
                morse.append("-·· ")
                break
            case "e":
                morse.append("· ")
                break
            case "f":
                morse.append("··-· ")
                break
            case "g":
                morse.append("--· ")
                break
            case "h":
                morse.append("···· ")
                break
            case "i":
                morse.append("·· ")
                break
            case "j":
                morse.append("·--- ")
                break
            case "k":
                morse.append("-·- ")
                break
            case "l":
                morse.append("·-·· ")
                break
            case "m":
                morse.append("-- ")
                break
            case "n":
                morse.append("-· ")
                break
                
            case "o":
                morse.append("--- ")
                break
            case "p":
                morse.append("·--· ")
                break
            case "q":
                morse.append("--·- ")
                break
            case "r":
                morse.append("·-· ")
                break
            case "s":
                morse.append("··· ")
                break
            case "t":
                morse.append("- ")
                break
            case "u":
                morse.append("··- ")
                break
            case "v":
                morse.append("···- ")
                break
            case "w":
                morse.append("·-- ")
                break
            case "x":
                morse.append("-··- ")
                break
            case "y":
                morse.append("-·-- ")
                break
            case "z":
                morse.append("--·· ")
                break
            case "1":
                morse.append("·---- ")
                break
            case "2":
                morse.append("··--- ")
                break
            case "3":
                morse.append("···-- ")
            case "4":
                morse.append("····- ")
                break
            case "5":
                morse.append("····· ")
                break
            case "6":
                morse.append("-···· ")
                break
            case "7":
                morse.append("--··· ")
                break
            case "8":
                morse.append("---·· ")
                break
            case "9":
                morse.append("----· ")
                break
            case "0":
                morse.append("----- ")
                break
            case "·":
                morse.append("·-·-·- ")
                break
            case ",":
                morse.append("--··-- ")
                break
            default:
                break
            }
        }
        return morse
    }
    
    func isClassProjects() -> Bool {
        let projectData = ProjectsData.shared.projects
        for i in projectData {
            if contains(i.name) {
                return true
            }
        }
        return false
    }
    
    func isClassModules() -> Bool {
        let modulesData = ModulesData.shared.modules
        for i in modulesData {
            for j in i.tags {
                if contains(j) {
                    return true
                }
            }
        }
        return false
    }
    
}

extension NSAttributedString {
    func height(withWidth width: CGFloat) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], context: nil)
        return actualSize.height
    }
}

