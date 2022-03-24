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
