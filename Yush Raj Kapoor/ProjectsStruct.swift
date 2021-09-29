//
//  ProjectsStruct.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import Foundation


struct project {
    var name:String
    var subtitle:String
    var shortDescription:String
    var longDescription:String
    var languages:[String]
    var startDate:String
    var endDate:String
    var appIconName:String
    var skillsUsed:[String:String]
    var challenges:[String]
    var thumbnails:[String]
    
    
    init(name:String,
         subtitle:String,
         shortDescription:String,
         longDescription:String,
         languages:[String],
         startDate:String,
         endDate:String,
         appIconName:String,
         skillsUsed:[String:String],
         challenges:[String],
         thumbnails:[String]) {
        self.name = name
        self.subtitle = subtitle
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.languages = languages
        self.startDate = startDate
        self.endDate = endDate
        self.appIconName = appIconName
        self.skillsUsed = skillsUsed
        self.challenges = challenges
        self.thumbnails = thumbnails
    }
    
    
}
