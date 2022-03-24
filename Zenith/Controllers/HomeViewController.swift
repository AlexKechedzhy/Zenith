//
//  ViewController.swift
//  Zenith
//
//  Created by Alex173 on 15.03.2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AchievementAlertDelegate {
    
    
    
    @IBOutlet weak var viewForCollectionView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    var selectedCellId: Int = 0
    var planetsInfo = [PlanetData]()
    let constants = Constants()
    var achievementModel = AchievementsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let planetData = DataLoader()
        planetsInfo = planetData.data
        setupCollectionView()
        backgroundImage.image = UIImage(named: "background")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        collectionView.reloadData()
        achievementModel.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetsInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as! CollectionViewCell
        let info = planetsInfo[indexPath.item]
        if let name = info.imageName2k {
            cell.renderPlanet(with: name)
        }
        cell.planetLabel.text = info.name
        cell.iconImage.image = UIImage(named: info.iconName!)
        cell.iconImage2.image = UIImage(named: info.iconName!)
        cell.shortDescriptionLabel.text = info.shortDescription
        cell.planetTypeLabel.text = "Type: \(info.type!)"

        if AppDefaultsData.weightRelativeToEarth == true {
            cell.massLabel.text = "Mass: \(info.massInEarths!)"
        } else {
            cell.massLabel.text = "Mass: \(info.massKg!)"
        }
        
        if AppDefaultsData.distanceInKilometers == true {
            cell.diameterLabel.text = "Diameter: \(info.diameterKm!)"
        } else {
            cell.diameterLabel.text = "Diameter: \(info.diameterMiles!)"
        }
        
        if AppDefaultsData.temperatureUnit == 0 {
            cell.temperatureLabel.text = "Temperature: \(info.temperatureCelcius!)"
        } else if AppDefaultsData.temperatureUnit == 1 {
            cell.temperatureLabel.text = "Temperature: \(info.temperatureFarenheit!)"
        } else {
            cell.temperatureLabel.text = "Temperature: \(info.temperatureKelvin!)"
        }
        
        cell.cardViewTopConstraint.constant = (collectionView.bounds.width) / 4
        
        cell.cardView.layer.cornerRadius = 25
        cell.typeView.layer.cornerRadius = 15
        cell.temperatureView.layer.cornerRadius = 15
        cell.massView.layer.cornerRadius = 15
        cell.diameterView.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = collectionView.bounds.height
        let width = collectionView.bounds.width
        return CGSize(width: width , height: height )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCellId = indexPath.item
        performSegue(withIdentifier: "planetSeque", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationVC = segue.destination as! PlanetViewController
        destinationVC.info = planetsInfo[selectedCellId]
        
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlanetCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func presentAchievementAlert(model: AchievementsModel, title: String, message: String) {
        print("ALERT!!!!!!!!!!!!")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
    }
}

