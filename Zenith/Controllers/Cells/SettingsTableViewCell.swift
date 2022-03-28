//
//  SettingsTableViewCell.swift
//  Zenith
//
//  Created by Alex173 on 17.03.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    @IBOutlet weak var segmentedButton: UISegmentedControl!
    var settingType: Settings?
    var appDefaults = AppDefaultsData()
    let achievementsModel = AchievementsModel()
    
    var eventNotifier = EventNotifierService.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Updating settings when Switch button is switched
    @IBAction func switchButton(_ sender: UISwitch) {
        achievementsModel.trackSettingsAchievement()
        if sender.isOn {
            appDefaults.update(key: settingType!.key, value: true)
        } else {
            appDefaults.update(key: settingType!.key, value: false)
        }
    }
    
    // Updating setting when Segmented button is switched
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        achievementsModel.trackSettingsAchievement()
        if sender.selectedSegmentIndex == 0 {
            AppDefaultsData.temperatureUnit = 0
        } else if sender.selectedSegmentIndex == 1 {
            AppDefaultsData.temperatureUnit = 1
        } else {
            AppDefaultsData.temperatureUnit = 2
        }
    }
}
