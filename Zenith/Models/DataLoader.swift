//
//  DataLoader.swift
//  Zenith
//
//  Created by Alex173 on 17.03.2022.
//

import Foundation

class DataLoader {
    var data = [PlanetData]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "JSONData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([PlanetData].self, from: data)
                self.data = decodedData
            } catch {
                print(error)
            }
        }
    }
    
}
