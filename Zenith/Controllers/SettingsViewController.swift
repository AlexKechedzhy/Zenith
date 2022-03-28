//
//  SettingsViewController.swift
//  Zenith
//
//  Created by Alex173 on 15.03.2022.
//

import UIKit
import Combine

enum Settings: CaseIterable {
    case setting1
    case setting2
    case setting3
    case setting4
    var key: String {
        switch self {
        case .setting1:
            return "highResolutionPlanets"
        case .setting2:
            return "weightRelativeToEarth"
        case .setting3:
            return "distanceInKilometers"
        case .setting4:
            return "temperatureUnit"
        }
    }
}

class SettingsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let constants = Constants()
    var appDefaults = AppDefaultsData()
    var achievementModel = AchievementsModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // Defining number of Settings cells to be created as per Settings enum
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.allCases.count
    }
    
    // Setting up TableView cells' contents
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingsTableViewCell
        cell.label.text = constants.settingsLabels[indexPath.row]
        cell.settingType = Settings.allCases[indexPath.row]
        if let userDefaultValue = appDefaults.retrieveData(key: Settings.allCases[indexPath.row].key) {
            if indexPath.row < 3 {
                cell.segmentedButton.isHidden = true
                cell.settingSwitch.setOn(userDefaultValue as! Bool, animated: false)
            } else {
                cell.settingSwitch.isHidden = true
                cell.segmentedButton.selectedSegmentIndex = AppDefaultsData.temperatureUnit
            }
        }
        return cell
    }
    
    // Method for setting up the TableView (Delegate, Datasource and registering UINibs)
    private func setupTableView() {
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "settingCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}
