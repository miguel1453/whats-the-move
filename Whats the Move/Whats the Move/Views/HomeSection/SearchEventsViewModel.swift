//
//  SearchEventsViewModel.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/18/23.
//

import Foundation

class SearchEventsViewModel: ObservableObject {
    @Published var events = [Event]()
    
    let service = EventService()
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
        service.fetchEvents { events in
            self.events = events
        }
    }
}
