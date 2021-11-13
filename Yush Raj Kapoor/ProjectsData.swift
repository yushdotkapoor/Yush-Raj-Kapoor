//
//  ProjectsData.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import Foundation


class ProjectsData {
    
    static let shared = ProjectsData()
    
    var projects:[project] = []
    
    var KeyClub = project(name: "Ponderosa Key Club Apps", shortDescription: "This project allows Ponderosa students to log and view their service hours as well as sign up for more events and more.", longDescription: "The Ponderosa Key Club Apps project allows for extensive data logging for members of the Ponderosa High School Key Club. The scope of this project exceeds just an iOS app, but includes a website and a spreadsheet interface as well. There are three major sectors, all of which have similar functionality, just using different interfaces and languages: iOS, website, and spreadsheet sectors.", features: ["Send Service Hours for approval", "View Service Hour logs", "Sign up for volunteer events", "View meeting dates and request absenses", "Full Admin controls to edit and change anything"], languages: ["Swift", "Google AppsScript", "JavaScript", "HTML"], startDate: "2019/07/15", endDate: "2020/08/15", appIconName: "KeyClub", skillsUsed: ["Xcode":"Used a hybrid storyboard and programatic coding structure.", "Firebase":"Stored data with Firebase Realtime Database and Firebase Storage, performed Analytics and Performance monitoring.", "Push Notifications":"Integrated the OneSignal service within Swift and JavaScript to send push notifications to users.", "Authentication":"Employs Firebase Authentication to create accounts for users.", "Google AppsScript":"United the Firebase Database with Google Spreadsheets for easy access to data as a non-mobile alternative.", "HTML":"Generated a non-mobile interface for our website.", "WixSite":"Designed a website for our services and integrated HTML elements.", "CocoaPods":"Installed several CocoaPods including Firebase and OneSignal."], challenges: ["Learning everything from scratch", "Adding a spreadsheet to the project that was delayed up to 30 minutes in updating its data and having to updating the database with the delayed spreadsheet", "Creating easy to follow documentation for client"], thumbnails: 5, urls:["AppStore":"https://apps.apple.com/us/app/ponderosa-key-club/id1484601641"])
    
    var HiddenMessagingApp = project(name: "Hidden Messaging App", shortDescription: "Provides a shell to create a private messaging app that is designed to look like a calculator.", longDescription: "The Hidden Messaging App looks like a calculator, but is actually a password protected messaging app. This app cannot be marketed on the app store because of the name of the app 'Calculator' to keep it hidden, but can be distributed ad Hoc, hosted by Firebase.", features: ["Send text messages", "Send images and videos", "Private database", "Password required and screen blackout when user puts app into background for security", "Customizable notifications"], languages: ["Swift"], startDate: "2021/01/19", endDate: "2021/08/09", appIconName: "Calc", skillsUsed: ["Xcode":"Created custom password protected UI.", "MessageKit":"This framework provides a seamless looking view controller for sending and viewing messages.", "Firebase":"Integrated the Firebase Database and Firebase Storage to store messages.", "Authentication":"Employs Firebase Authentication to create accounts for users.", "Push Notifications":"Sending Push Notifications through Firebase Cloud Messaging using REST."], challenges: ["Trying to decipher the large MessageKit framework and what I could implement", "How to efficiently display messages without overloading Firebase with queries and overloading the client-side when parsing through message data"], thumbnails: 3, urls:["GitHub":"https://github.com/yushdotkapoor/Calculator"])
    
    var CodeGray = project(name: "CodeGray", shortDescription: "Sends emergency notifications to specified contacts.", longDescription: "CodeGray is a safety app that sends notifications to a set list of emergency contacts in response to a custom phrase in Siri. Users can set three emergency priorities (Low, Medium, High) and can specify who to contact for each one.", features: ["Customizable key phrase/word to tell Siri to trigger and emergency scenario", "Push Notifications that open up a Google Maps pin location of the user who triggered an emergency alert"], languages: ["Swift"], startDate: "2021/09/17", endDate: "2021/09/19", appIconName: "CodeGray", skillsUsed: ["Firebase":"Collects user data including live location and profile information.", "Authentication":"Employs Firebase Authentication to create accounts for users.", "Push Notifications":"Sending Push Notifications through Firebase Cloud Messaging using REST.", "CoreLocation":"Receives and handles location data of the user in an emergency.", "SiriKit":"Integrates with Siri to create custom commands to trigger custom emergency scenarios.", "Github":"Collaborated with three other teammates to build a functional product using Github functions to share and review code."], challenges: ["SiriKit was very difficult to implement at first", "Because this project was birthed in a hackathon, it was very difficult to create everything within 36 hours"], thumbnails: 6, urls:["GitHub":"https://github.com/yushdotkapoor/Code-Gray"])
    
    var CryptoSiphon = project(name: "Crypto Siphon", shortDescription: "A buying and selling algorithm that siphons profit from a cryptocurrency's volatility.", longDescription: "This project was an attempt to profit of the ups and downs of the cryptocurrency market.", features: ["AWS Lambda function that uploads price data every minute", "Functions that calculate slope and current trends to change buying and selling thresholds", "Connection with Gemini and RobinHood Cryptocurrency exchanges", "iOS interface that displays logs and master shutoff switch for the algorithm", "iOS notifications if the algorithm loses connection or fails in a way that needs human intervention"], languages: ["Python", "Swift"], startDate: "2021/08/13", endDate: "2021/09/13", appIconName: "RobinHealth", skillsUsed: ["Firebase":"Stores price data and other valuable information regarding specified cryptocurrencies.", "AWS Lambda":"A function that gets triggered every minute to push cryptocurrency price data to a Firebase Database.", "Push Notifications":"Sends a notification to the iOS app in case of algorithm failure.", "panda":"Manipulating price and trend data to calculate purchasing snd selling thresholds.", "robinStocks":"Python package integrating the Gemini cryptocurrency exchange API with the code interface.", "prophet":"A predictive regression using past datapoints to predict trend of future prices."], challenges: ["First major project using python and have no prior experience dealing with finance", "Decoding why in theory, the algorithm should be working, but in reality, it doesn't"], thumbnails: 0, urls:["GitHub":"https://github.com/yushdotkapoor/Crypto-Siphon"])
    
    var ProjectMayhem = project(name: "Project Mayhem", shortDescription: "A brain intensive game that tests problem solving skills.", longDescription: "This is a game that is the crown jewel of my projects so far. Project Mayhem is an escape room style puzzle game that applies many of the iPhone's native features to design a creative and stimulating gameplay.", features: ["Volume detection", "Device motion detection", "Pitch and amplitude detection", "Torch and Haptics to spell out morse code", "Speech detection to make cutscenes more interactive as the user will have to say their lines", "Augmented Reality Scene", "Color detection using the phone's camera"], languages: ["Swift"], startDate: "2020/12/21", endDate: "2021/07/27", appIconName: "Mayhem", skillsUsed: ["CloudKit":"Downloaded videos from an iCloud database for cutscenes.", "AVKit and AVFoundation":"Utilzed these frameworks to add video cutscenes, background music, and microphone analytics.", "AudioKit":"Employed to detect pitch and amplitude of incoming input from the device microphone.", "ARKit":"Created a Augmented Reality scene that kept changing in response to users phone motion.", "CoreMotion":"Accessed device gyroscope and accelerometer to detect direction and speed of certain movements using simple cartesian math.", "Speech":"This SDK gave me access to the speech to text algorithm that allowed me to search for key words or phrases that the users says.", "Haptics":"For simple user experience as well as morse code.", "Notification Center Observers":"Many of these observers were used to detect many events such as when the user swiped home and came back, or whether certain settings were changed.", "Custom Settings":"Allowed users to change app settings from the native Settings app, which would affect gameplay.", "StoreKit":"Implemented custom in-app purchases as a way to get additional hints.", "Siren":"An API that allowed me to notify the user of any new game version update.", "MessageKit":"This UI framework provides a skeleton structure to the chat view.", "Firebase":"Integrated the Firebase Database and Firebase Storage to store messages.", "Push Notifications":"Sending Push Notifications through Firebase Cloud Messaging using REST.", "Swift Package Manager (SPM)":"Many of the public SDKs and frameworks were able to be integrated within the project using SPM."], challenges: ["Discovering so many native iPhone capabilities and turning them into interactive puzzles without being redundant.", "Figuring out why microphone would not turn off at times", "Developing a compelling storyline"], thumbnails: 6, urls:["AppStore":"https://apps.apple.com/us/app/project-mayhem/id1551711683", "GitHub":"https://github.com/yushdotkapoor/Project-Mayhem"])
    
    
    init() {
        projects = [ProjectMayhem, CodeGray, KeyClub, HiddenMessagingApp, CryptoSiphon]
    }
    
    func getDate(d:String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: d)!
    }
    
    func getStringDate(dat:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: dat)
    }
    
}
