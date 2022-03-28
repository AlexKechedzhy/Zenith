//
//  AchievementsViewController.swift
//  Zenith
//
//  Created by Alex173 on 22.03.2022.
//

import UIKit

class AchievementsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var achievements: [Bool] = []
    var achievementModel = AchievementsModel()
    let constants = Constants()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateAchievementsArray()
        tableView.reloadData()
    }
    
    // Defining number of Achievement cells to be created as per achievements array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    // Setting up TableView cells' contents
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if achievements[indexPath.row] == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "unlockedCell", for: indexPath) as! UnlockedAchievementTableViewCell
            cell.cellView.layer.cornerRadius = 15
            cell.achievementLabel.text = constants.achievementLabels[indexPath.row]
            cell.achievementDescription.text = constants.achievementDescriptions[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lockedCell", for: indexPath) as! LockedAchievementTableViewCell
            cell.cellView.layer.cornerRadius = 15
            return cell
        }
    }
    
    // Method for setting up the TableView (Delegate, Datasource and registering UINibs)
    private func setupTableView() {
        tableView.register(UINib(nibName: "LockedAchievementTableViewCell", bundle: nil), forCellReuseIdentifier: "lockedCell")
        tableView.register(UINib(nibName: "UnlockedAchievementTableViewCell", bundle: nil), forCellReuseIdentifier: "unlockedCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Method for updating Achievements Array (may be either true or false)
    private func updateAchievementsArray() {
        achievements = [
            AppDefaultsData.viewAllPlanetsInAR,
            AppDefaultsData.seenAllWikiPages,
            AppDefaultsData.spent10MinutesInApp,
            AppDefaultsData.changeSomeSettings,
            AppDefaultsData.openMarsPage10Times
        ]
    }
    
}
