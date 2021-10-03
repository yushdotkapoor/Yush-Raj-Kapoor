//
//  HobbiesStruct.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/1/21.
//

import Foundation
import UIKit

struct hobby {
    var name:String
    var years:String
    var description:String
    
    init(name:String,
         years:String,
         description:String) {
        self.name = name
        self.years = years
        self.description = description
    }
}

struct position {
    var name:String
    var startDate:String
    var endDate:String
    var jobs:[String]
    
    init(name:String,
         startDate:String,
         endDate:String,
         jobs:[String]) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.jobs = jobs
    }
}

struct community {
    var organization:String
    var positions:[position]
    
    init(organization:String,
         positions:[position]) {
        self.organization = organization
        self.positions = positions
    }
}

struct school {
    var name:String
    var city:String
    var state:String
    var graduationYear:String
    var GPA:String

    init(name:String,
         city:String,
         state:String,
         graduationYear:String,
         GPA:String) {
        self.name = name
        self.city = city
        self.state = state
        self.graduationYear = graduationYear
        self.GPA = GPA
    }
}

