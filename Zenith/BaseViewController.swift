//
//  BaseViewController.swift
//  Zenith
//
//  Created by Alex173 on 24.03.2022.
//

import UIKit
import Combine

// This Class subscribes for EventNotifier's Events (completing achievemtns) and defines Alert displaying method.
// All ViewControllers, which should display the alert, inherit BaseViewController Class.
class BaseViewController: UIViewController {
    
    private var cancellableBag: Set<AnyCancellable> = []
    var eventNotifier = EventNotifierService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeForEvents()
    }
    
    // Subscribing to eventNotifier's Events
    private func subscribeForEvents() {
        eventNotifier
            .publisher
            .receive(on: DispatchQueue.main)
            .sink(
                receiveValue: { [weak self] event in
                    guard let strongSelf = self else { return }
                    if strongSelf.viewIfLoaded?.window != nil {
                        switch event {
                        case .didUpdateSettings(let title, let message):
                            self?.presentAchievementAlert(title: title, message: message)
                        case .didSpentElegibleTimeInApp(let title, let message):
                            self?.presentAchievementAlert(title: title, message: message)
                        case .didSeen10PlanetsinAR(let title, let message):
                            self?.presentAchievementAlert(title: title, message: message)
                        case .didVisit10WikiPages(let title, let message):
                            self?.presentAchievementAlert(title: title, message: message)
                        case .didVisitMarsPage10Times(let title, let message):
                            self?.presentAchievementAlert(title: title, message: message)
                        }
                    }
                    
                })
            .store(in: &cancellableBag)
    }
    
    // Displaying Achievement Alert when Event is triggered
    private func presentAchievementAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
