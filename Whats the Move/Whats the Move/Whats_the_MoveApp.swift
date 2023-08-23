//
//  Whats_the_MoveApp.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/9/23.
//

import SwiftUI
import Firebase

@main
struct Whats_the_MoveApp: App {
    
    @StateObject var vm = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AuthView()
            }
            .environmentObject(vm)
        }
   
    }
    
}
