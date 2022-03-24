//
//  AchievementsModel.swift
//  Zenith
//
//  Created by Alex173 on 23.03.2022.
//

import UIKit

protocol AchievementAlertDelegate {
    func presentAchievementAlert(model: AchievementsModel, title: String, message: String)
}

class AchievementsModel {
    
    var delegate: AchievementAlertDelegate?  {
        didSet {
            print("New delegate is set: \(delegate)")
        }
    }

    var timer = Timer()
    
    
    func trackARViewsAchievement(id: Int) {
        switch id {
        case 0:
            AppDefaultsData.sunARPageVisited = true
        case 1:
            AppDefaultsData.mercuryARPageVisited = true
        case 2:
            AppDefaultsData.venusARPageVisited = true
        case 3:
            AppDefaultsData.earthARPageVisited = true
        case 4:
            AppDefaultsData.moonARPageVisited = true
        case 5:
            AppDefaultsData.marsARPageVisited = true
        case 6:
            AppDefaultsData.jupiterARPageVisited = true
        case 7:
            AppDefaultsData.saturnARPageVisited = true
        case 8:
            AppDefaultsData.uranusARPageVisited = true
        case 9:
            AppDefaultsData.neptuneARPageVisited = true
        default:
            print("Error while tracking ARView achievement.")
        }
        let arVisited = [
            AppDefaultsData.sunARPageVisited,
            AppDefaultsData.mercuryARPageVisited,
            AppDefaultsData.venusARPageVisited,
            AppDefaultsData.earthARPageVisited,
            AppDefaultsData.moonARPageVisited,
            AppDefaultsData.marsARPageVisited,
            AppDefaultsData.jupiterARPageVisited,
            AppDefaultsData.saturnARPageVisited,
            AppDefaultsData.uranusARPageVisited,
            AppDefaultsData.neptuneARPageVisited
        ]
        print(arVisited)
        if arVisited.allSatisfy({$0 == true}) {
            if AppDefaultsData.viewAllPlanetsInAR == false {
                AppDefaultsData.viewAllPlanetsInAR = true
                print("Completed ARView Achievement!")
                print("The delegate for this achievement was: \(delegate)")
                delegate?.presentAchievementAlert(model: self, title: "Achievement #1 unlocked!", message: "You have seen all planets in AR")
                presentAlert()
            }
        }
    }
    
    
    func trackWikiVisitsAchievement(id: Int) {
        switch id {
        case 0:
            AppDefaultsData.sunWikiPageVisited = true
        case 1:
            AppDefaultsData.mercuryWikiPageVisited = true
        case 2:
            AppDefaultsData.venusWikiPageVisited = true
        case 3:
            AppDefaultsData.earthWikiPageVisited = true
        case 4:
            AppDefaultsData.moonWikiPageVisited = true
        case 5:
            AppDefaultsData.marsWikiPageVisited = true
        case 6:
            AppDefaultsData.jupiterWikiPageVisited = true
        case 7:
            AppDefaultsData.saturnWikiPageVisited = true
        case 8:
            AppDefaultsData.uranusWikiPageVisited = true
        case 9:
            AppDefaultsData.neptuneWikiPageVisited = true
        default:
            print("Error while tracking Wiki achievement.")
        }
        let wikiVisited = [
            AppDefaultsData.sunWikiPageVisited,
            AppDefaultsData.mercuryWikiPageVisited,
            AppDefaultsData.venusWikiPageVisited,
            AppDefaultsData.earthWikiPageVisited,
            AppDefaultsData.moonWikiPageVisited,
            AppDefaultsData.marsWikiPageVisited,
            AppDefaultsData.jupiterWikiPageVisited,
            AppDefaultsData.saturnWikiPageVisited,
            AppDefaultsData.uranusWikiPageVisited,
            AppDefaultsData.neptuneWikiPageVisited
        ]
        print(wikiVisited)
        if wikiVisited.allSatisfy({$0 == true}) {
            if AppDefaultsData.seenAllWikiPages == false {
                AppDefaultsData.seenAllWikiPages = true
                print("Completed Wiki Achievement!")
                print("The delegate for this achievement was: \(delegate)")
                delegate?.presentAchievementAlert(model: self, title: "Achievement #2 unlocked!", message: "You have visited all Wiki pages! New day - new knowledge :)")
                presentAlert()
            }
        }
    }
    
    func startTrackingTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trackSeconds), userInfo: nil, repeats: true)
    }
    
    @objc func trackSeconds() {
        AppDefaultsData.secondsSpentInApp += 1
        if AppDefaultsData.secondsSpentInApp >= 60 {
            if AppDefaultsData.spent10MinutesInApp == false {
                AppDefaultsData.spent10MinutesInApp = true
                print("Completed 10 Min Achievement!")
                print("The delegate for this achievement was: \(delegate)")
                delegate?.presentAchievementAlert(model: self, title: "Achievement #3 unlocked!", message: "You have been using app for 10 minutes total! Hope you enjoy :)")
                presentAlert()
            }
        }
    }
    
    
    func stopTrackingTime() {
        timer.invalidate()
        print(AppDefaultsData.secondsSpentInApp)
    }
    
    
    func trackSettingsAchievement() {
        if AppDefaultsData.changeSomeSettings == false {
            AppDefaultsData.changeSomeSettings = true
            print("Completed Settings Achievement!")
            print("The delegate for this achievement was: \(delegate)")
            delegate?.presentAchievementAlert(model: self, title: "Achievement #4 Unlocked!", message: "You have changed settings for the first time :)")
        }
    }
    
    
    
    func trackMarsVisitsAchievement() {
        AppDefaultsData.marsPageVisited += 1
        print("Mars Page visited: \(AppDefaultsData.marsPageVisited)")
        if AppDefaultsData.marsPageVisited >= 10 {
            if AppDefaultsData.openMarsPage10Times == false {
                AppDefaultsData.openMarsPage10Times = true
                print("Completed Mars Achievement!")
                print("The delegate for this achievement was: \(delegate)")
                delegate?.presentAchievementAlert(model: self, title: "Achievement #5 unlocked!", message: "You have visited Mars page 10 times! Good job!")
                presentAlert()
            }
            
        }
    }
   
    
    func presentAlert() {
        print("Alert is presented!")
    }
}
