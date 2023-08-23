//
//  SearchUsersView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/21/23.
//

import SwiftUI

struct SearchUsersView: View {
    @ObservedObject var vm = SearchUsersViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                SearchBar(text: $vm.searchText)
                ScrollView {
                    LazyVStack {
                        ForEach(vm.searchableUsers) { user in
                            NavigationLink{
                                UserProfileView(vm: SearchUserEventsViewModel(user: user))
                            } label: {
                                UserCellView(user: user)
                                    .frame(width: 350)
                            }

                        }
                    }
                }
            }
        }
    }
}

struct SearchUsersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUsersView()
    }
}
