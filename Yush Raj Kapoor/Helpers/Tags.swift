//
//  Tags.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 11/13/21.
//

import Foundation


class Tags {
    static let shared = Tags()
    
    var tags:[String] = []
    
    init() {
        var tag:[String] = []
        
        let projectData = ProjectsData.shared.projects
        for i in projectData {
            tag.append(i.name)
        }
        
        let moduleData = ModulesData.shared.modules
        for i in moduleData {
            for j in i.tags {
                tag.append(j)
            }
        }
        tags = tag
    }
    
}
