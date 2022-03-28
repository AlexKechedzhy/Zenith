//
//  TabBarController.swift
//  Zenith
//
//  Created by Alex173 on 15.03.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    // Setting default ViewController to represent when the App is launched (HomeViewController)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
    }
}
