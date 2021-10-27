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
    var jhu = school(name: "Johns Hopkins University", city: "Baltimore", state: "MD", graduationYear: "2024", GPA: "", subjects: ["Neuroscience", "Computer Science"])
    
    
    var mBand = community(organization: "Bruin Marching Band", positions: [position(name: "Head Drum Major", startDate: "May 2019", endDate: "January 2020", jobs: ["Conducted the 2019 show \"Boundless\" and received 1st, 3rd, and 5th place in the field conductor caption at multiple competition in the Northern California division.", "Led leadership seminars to train students on effective leadership strategies and the importance of taking initiative."], media: ["DrumMajor.JPG"]), position(name: "Assistant Drum Major", startDate: "May 2018", endDate: "January 2019", jobs: ["Assisted in conducting the 2018 show \"Fahrenheit 451\"", "Learned and applied effective leadership strategies"]), position(name: "Equipment Manager", startDate: "May 2017", endDate: "May 2018", jobs: ["Created logistics plans for everything equipment related for practices and other events."])])
    var keyClub = community(organization: "Ponderosa Key Club", positions: [position(name: "President", startDate: "May 2019", endDate: "May 2020", jobs: ["Executed a door to door style recruitment campaign.", "Overhauled the previous service collection system to expand to an iOS app (see Ponderosa Key Club in the Projects tab) which allowed users to submit their contributions themselves.", "Addressed concerns and held meetings bi-monthly meetings to keep members active."]), position(name: "Vice President", startDate: "May 2018", endDate: "May 2019", jobs: ["Merged service collection system to a digital format in which volunteers could view their contributions digitally."]), position(name: "Student Class Representative", startDate: "September 2016", endDate: "May 2018", jobs: ["Trained to be an officer and learned the intricacies of the service oriented club."])])
    
    
    var biking = hobby(name: "Mountain Biking", years: "4 years", description: "I love going outside to see some incredible views on a bike. I would ride trails in Granite Bay, CA and participated in quite a few golden sunsets with my team. We would have a few thrilling races every year in scorching heat to freezing rain. My bike, \"Scotty\" has been with me for 5 years.", media: ["Bike.JPG"])
    var music = hobby(name: "Music", years: "11 years", description: "Playing music is so much fun! I've been playing for over a decade and love the thrill of playing with passion. I've played in solo performances, group band concerts, and marching band shows! I also invented the horrendous sounding flute and clarinet hybrid: The \"Flarinet\" (viewer discretion is advised - seriously, it sounds terrible).", media: ["Sax.JPG", "Flarinet.mov"])
    var chocolate = hobby(name: "Chocolate", years: "Forever", description: "Chocolate is like the world saying, \"Everything is going to be alright.\" My favorite chocolate has to be Harry&David Dark Chocolate Truffles; they are the definition of melt in your mouth. I do not, however, like chocolate with nuts (with the exception of hazelnut). One day, I hope to make my own homemade chocolate.")
    
    
    func getSchool() -> [school] {
        return [pondo, jhu]
    }
    
    func getCommunity() -> [community] {
        return [mBand, keyClub]
    }
    
    func getHobbies() -> [hobby] {
        return [biking, chocolate, music]
    }
    
    func getPositions(comm: [community]) -> [[position]] {
        var toReturn:[[position]] = []
        for i in comm {
            toReturn.append(i.positions)
        }
        return toReturn
    }
}

