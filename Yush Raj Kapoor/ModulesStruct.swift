//
//  ModulesStruct.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 11/13/21.
//

import Foundation


struct Module {
    var storyboardIdentifier: String
    var buttonText: String
    var tags: [String]
    
    init(storyboardIdentifier:String,
         buttonText:String,
         tags:[String]) {
        self.storyboardIdentifier = storyboardIdentifier
        self.buttonText = buttonText
        self.tags = tags
    }
    
}
