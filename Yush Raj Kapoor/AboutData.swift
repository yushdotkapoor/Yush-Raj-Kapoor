//
//  AboutData.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/2/21.
//

import Foundation
import UIKit

class AboutData {
    
    var pondo = school(name: "Ponderosa High School", city: "Shingle Springs", state: "CA", graduationYear: "2020", GPA: "4.3")
    var jhu = school(name: "Johns Hopkins University", city: "Baltimore", state: "MD", graduationYear: "2024", GPA: "")
    
    
    var mBand = community(organization: "Bruin Marching Band", positions: [position(name: "Head Drum Major", startDate: "May 2019", endDate: "January 2020", jobs: ["Conducted the 2019 show \"Boundless\" and received 1st, 3rd, and 5th place in the field conductor caption at multiple competition in the Northern California division.", "Led leadership seminars to train students on effective leadership strategies and the importance of taking initiative."]), position(name: "Assistant Drum Major", startDate: "May 2018", endDate: "January 2019", jobs: ["Assisted in conducting the 2018 show \"Fahrenheit 451\"", "Learned and applied effective leadership strategies"]), position(name: "Equipment Manager", startDate: "May 2017", endDate: "May 2018", jobs: ["Created logistics plans for everything equipment related for practices and other events."])])
    var keyClub = community(organization: "Ponderosa Key Club", positions: [position(name: "President", startDate: "May 2019", endDate: "May 2020", jobs: ["Executed a door to door style recruitment campaign.", "Overhauled the previous service collection system to expand to an iOS app (see Ponderosa Key Club in the Projects tab) which allowed users to submit their contributions themselves.", "Addressed concerns and held meetings bi-monthly meetings to keep members active."]), position(name: "Vice President", startDate: "May 2018", endDate: "May 2019", jobs: ["Merged service collection system to a digital format in which volunteers could view their contributions digitally."]), position(name: "Student Class Representative", startDate: "September 2016", endDate: "May 2018", jobs: ["Trained to be an officer and learned the intricacies of the service oriented club."])])
    
    
    var biking = hobby(name: "Mountain Biking", years: "4 years", description: "")
    var music = hobby(name: "Music", years: "11 years", description: "")
    
    
    func getSchool() -> [school] {
        return [pondo, jhu]
    }
    
    func getCommunity() -> [community] {
        return [mBand, keyClub]
    }
    
    func getHobbies() -> [hobby] {
        return [biking, music]
    }
}

