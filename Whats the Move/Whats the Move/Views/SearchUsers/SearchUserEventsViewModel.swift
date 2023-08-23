//
//  SearchUserEventsViewModel.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/21/23.
//

import Foundation

class SearchUserEventsViewModel: ObservableObject {
    @Published var userEvents = [Event]()
    
    let user: User?
    
    let service = UserService()
    
    init(user: User) {
        self.user = user
        fetchUserEvents(uid: user.id ?? "")
    }
    
    func fetchUserEvents(uid: String) {
        service.fetchUserEvents(uid: uid) { events in
            self.userEvents = events
        }
    }
}
