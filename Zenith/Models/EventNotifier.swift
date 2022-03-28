//
//  EventNotifier.swift
//  Zenith
//
//  Created by Alex173 on 24.03.2022.
//

import Foundation
import Combine


protocol EventNotifierServiceProtocol: AnyObject {
    associatedtype Event
    
    var publisher: PassthroughSubject<Event, Never> { get }
}

// Class which allows to be subscribed to in order to trigger events in subscribed ViewController (Alert)
// Cases in Event enum are triggered through AchievementsModel
class EventNotifierService: EventNotifierServiceProtocol {
    enum Event {
        case didUpdateSettings(title: String, message: String)
        case didSpentElegibleTimeInApp(title: String, message: String)
        case didSeen10PlanetsinAR(title: String, message: String)
        case didVisit10WikiPages(title: String, message: String)
        case didVisitMarsPage10Times(title: String, message: String)
    }
    
    static let shared = EventNotifierService()
    
    let publisher = PassthroughSubject<Event, Never>()
    
    private init() {}
}
