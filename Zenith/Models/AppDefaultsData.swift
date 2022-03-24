//
//  AppDefaultsData.swift
//  Zenith
//
//  Created by Alex173 on 17.03.2022.
//

import Foundation

struct AppDefaultsData {
    
    //MARK: - Settings userDefaults
    
    @UserDefaultsWrapper(key: "highResolutionPlanets", defaultValue: true)
    static var highResolutionPlanets: Bool

    @UserDefaultsWrapper(key: "weightRelativeToEarth", defaultValue: true)
    static var weightRelativeToEarth: Bool
    
    @UserDefaultsWrapper(key: "distanceInKilometers", defaultValue: true)
    static var distanceInKilometers: Bool
    
    @UserDefaultsWrapper(key: "temperatureUnit", defaultValue: 0)
    static var temperatureUnit: Int
    
    
    //MARK: - Achievements userDefaults
    
    @UserDefaultsWrapper(key: "viewAllPlanetsInAR", defaultValue: false)
    static var viewAllPlanetsInAR: Bool
    
    @UserDefaultsWrapper(key: "seenAllWikiPages", defaultValue: false)
    static var seenAllWikiPages: Bool
    
    @UserDefaultsWrapper(key: "spent10MinutesInApp", defaultValue: false)
    static var spent10MinutesInApp: Bool
    
    @UserDefaultsWrapper(key: "changeSomeSettings", defaultValue: false)
    static var changeSomeSettings: Bool
    
    @UserDefaultsWrapper(key: "openMarsPage10Times", defaultValue: false)
    static var openMarsPage10Times: Bool
    
    
    //MARK: - Achievement Tracking UserDefaults
    
    
    // Achievement 1
    @UserDefaultsWrapper(key: "sunARPageVisited", defaultValue: false)
    static var sunARPageVisited: Bool
    @UserDefaultsWrapper(key: "mercuryARPageVisited", defaultValue: false)
    static var mercuryARPageVisited: Bool
    @UserDefaultsWrapper(key: "venusARPageVisited", defaultValue: false)
    static var venusARPageVisited: Bool
    @UserDefaultsWrapper(key: "earthARPageVisited", defaultValue: false)
    static var earthARPageVisited: Bool
    @UserDefaultsWrapper(key: "moonARPageVisited", defaultValue: false)
    static var moonARPageVisited: Bool
    @UserDefaultsWrapper(key: "marsARPageVisited", defaultValue: false)
    static var marsARPageVisited: Bool
    @UserDefaultsWrapper(key: "jupiterARPageVisited", defaultValue: false)
    static var jupiterARPageVisited: Bool
    @UserDefaultsWrapper(key: "saturnARPageVisited", defaultValue: false)
    static var saturnARPageVisited: Bool
    @UserDefaultsWrapper(key: "uranusARPageVisited", defaultValue: false)
    static var uranusARPageVisited: Bool
    @UserDefaultsWrapper(key: "neptuneARPageVisited", defaultValue: false)
    static var neptuneARPageVisited: Bool
    
    
    // Achievement 2
    @UserDefaultsWrapper(key: "sunWikiPageVisited", defaultValue: false)
    static var sunWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "mercuryWikiPageVisited", defaultValue: false)
    static var mercuryWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "venusWikiPageVisited", defaultValue: false)
    static var venusWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "earthWikiPageVisited", defaultValue: false)
    static var earthWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "moonWikiPageVisited", defaultValue: false)
    static var moonWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "marsWikiPageVisited", defaultValue: false)
    static var marsWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "jupiterWikiPageVisited", defaultValue: false)
    static var jupiterWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "saturnWikiPageVisited", defaultValue: false)
    static var saturnWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "uranusWikiPageVisited", defaultValue: false)
    static var uranusWikiPageVisited: Bool
    @UserDefaultsWrapper(key: "neptuneWikiPageVisited", defaultValue: false)
    static var neptuneWikiPageVisited: Bool
    
    
    // Achievement 3
    @UserDefaultsWrapper(key: "secondsSpentInApp", defaultValue: 0)
    static var secondsSpentInApp: Int
    
    // Achievement 5
    @UserDefaultsWrapper(key: "marsPageVisited", defaultValue: 0)
    static var marsPageVisited: Int
    
    
    //MARK: - Methods for accessing Settings UserDefaults
    
    // Method which allows to access UserDefault Data for Settings
    mutating func update<T>(key: String, value: T) {
        switch key {
        case "highResolutionPlanets":
            AppDefaultsData.highResolutionPlanets = value as! Bool
            print("Updated \(key) with \(value)")
        case "weightRelativeToEarth":
            AppDefaultsData.weightRelativeToEarth = value as! Bool
            print("Updated \(key) with \(value)")
        case "distanceInKilometers":
            AppDefaultsData.distanceInKilometers = value as! Bool
            print("Updated \(key) with \(value)")
        case "temperatureUnit":
            AppDefaultsData.temperatureUnit = value as! Int
        default:
            return
        }
    }
    
    // Method which allows to retrieve UserDefault Data for Settings
    func retrieveData(key: String) -> Any? {
        switch key {
        case "highResolutionPlanets":
            print("Retrieved \(key) value")
            return AppDefaultsData.highResolutionPlanets
        case "weightRelativeToEarth":
            print("Retrieved \(key) value")
            return AppDefaultsData.weightRelativeToEarth
        case "distanceInKilometers":
            print("Retrieved \(key) value")
            return AppDefaultsData.distanceInKilometers
        case "temperatureUnit":
            print("Retrieved \(key) value")
            return AppDefaultsData.temperatureUnit
        default:
            return nil
        }
    }
    
}
