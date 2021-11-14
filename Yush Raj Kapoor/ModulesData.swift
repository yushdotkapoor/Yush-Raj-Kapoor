//
//  ModulesData.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 11/13/21.
//

import Foundation

class ModulesData {
    static let shared = ModulesData()
    
    var modules:[Module] = []
    
    let morseCodeFlasher = Module(storyboardIdentifier: "MorseCodeFlasher", buttonText: "Morse Code Flasher", tags: ["haptics", "torch"])
    let colorPicker = Module(storyboardIdentifier: "ColorPicker", buttonText: "Camera Color Picker", tags: ["photo"])
    let wtf = Module(storyboardIdentifier: "SpeechRecognizer", buttonText: "WTF Bleeper", tags: ["speech", "avkit"])
    
    init() {
        modules = [morseCodeFlasher, colorPicker, wtf]
    }
}
