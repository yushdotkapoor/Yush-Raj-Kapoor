//
//  ProjectsStruct.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import Foundation


struct project {
    var name:String
    var shortDescription:String
    var longDescription:String
    var features:[String]
    var languages:[String]
    var startDate:String
    var endDate:String
    var appIconName:String
    var skillsUsed:[String:String]
    var challenges:[String]
    var thumbnails:[String]
    
    
    init(name:String,
         shortDescription:String,
         longDescription:String,
         features:[String],
         languages:[String],
         startDate:String,
         endDate:String,
         appIconName:String,
         skillsUsed:[String:String],
         challenges:[String],
         thumbnails:[String]) {
        self.name = name
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.features = features
        self.languages = languages
        self.startDate = startDate
        self.endDate = endDate
        self.appIconName = appIconName
        self.skillsUsed = skillsUsed
        self.challenges = challenges
        self.thumbnails = thumbnails
    }
    
    
}
