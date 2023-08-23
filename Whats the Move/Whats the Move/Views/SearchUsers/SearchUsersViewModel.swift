//
//  SearchUsersViewModel.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/21/23.
//

import Foundation

class SearchUsersViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    @Published var userEvents = [Event]()
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: UserS fetched!")
        }
    }
    
  
}

