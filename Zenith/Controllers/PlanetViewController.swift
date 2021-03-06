//
//  PlanetViewController.swift
//  Zenith
//
//  Created by Alex173 on 16.03.2022.
//

import UIKit

class PlanetViewController: BaseViewController {
    
    
    
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var planetNameView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var wikiButtonView: UIView!
    
    var info: PlanetData?
    var achievementsModel = AchievementsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        if info?.name == "Mars" {
            achievementsModel.trackMarsVisitsAchievement()
        }
    }
    
    // Method for triggering openWikiPage when Wiki button is pressed
    @IBAction func wikiButtonPressed(_ sender: UIButton) {
        achievementsModel.trackWikiVisitsAchievement(id: (info?.id)!)
        openWikiPage(url: info?.wikiLink)
    }
    
    // Method for visiting Wiki page
    private func openWikiPage(url: String?) {
        if let url = URL.init(string: url ?? "") {
            
            UIApplication.shared.open(url)
        } else {
            print ("Error while opening link.")
        }
    }
    
    // Preparing a segue to pass PlanetData (info) to ARViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationVC = segue.destination as! ARViewController
            destinationVC.info = info
    }
    
    // Setting up Labels
    private func setupLabels() {
        planetNameLabel.text = info?.name
        descriptionLabel.text = info?.description
        planetImage.image = UIImage(named: (info?.pageImageName)!)
    }
    
    // Setting up UIViews' corner Radius
    private func setupViews() {
        planetNameView.layer.cornerRadius = 15
        descriptionView.layer.cornerRadius = 15
        wikiButtonView.layer.cornerRadius = 15
    }
}
