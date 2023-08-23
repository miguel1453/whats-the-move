//
//  ContentView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel
    var body: some View {
        NavigationStack {
            TabView{
                HomePageView()
                    .tabItem {
                        Image(systemName: "house.fill")
                            .foregroundColor(Color("mustard"))
                        Text("Home")
                    }
                SearchUsersView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("mustard"))
                            .font(.system(size: 35))
                            .padding(.trailing)
                        Text("Search")
                    }
                BrowseView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Browse")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                            .foregroundColor(Color("mustard"))
                        Text("Profile")
                    }
                    .onAppear() {
                        vm.fethUser()
                        vm.fetchLikedPosts()

                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
