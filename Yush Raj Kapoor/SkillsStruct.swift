//
//  SkillsStruct.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/1/21.
//

import Foundation
import UIKit

struct skill {
    var name:String
    var subunits:[String]
    var experience:String
    
    init(name:String,
         subunits:[String],
         experience:String) {
        self.name = name
        self.subunits = subunits
        self.experience = experience
    }
}
