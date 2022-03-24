//
//  PlanetData.swift
//  Zenith
//
//  Created by Alex173 on 17.03.2022.
//

import Foundation

struct PlanetData: Codable {
    var id: Int?
    var name: String?
    var imageName8k: String?
    var imageName2k: String?
    var pageImageName: String?
    var iconName: String?
    var type: String?
    var temperatureCelcius: String?
    var temperatureFarenheit: String?
    var temperatureKelvin: String?
    var shortDescription: String?
    var description: String?
    var diameterKm: String?
    var diameterMiles: String?
    var massKg: String?
    var massInEarths: String?
    var wikiLink: String?
}
