//
//  ProfileView.swift
//  Whats the Move
//
//  Created by Chiara Sabato on 4/17/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @EnvironmentObject var vm: AuthViewModel
    @ObservedObject var eventsvm = SearchUsersViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack{
                    if let user = vm.currentUser {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .padding(.trailing)
                            .padding(.trailing, 10)
                            .padding(.leading, -5)
                            
                      
                    } else {
                        Image("riya-modak-profile-picture")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.top, 15)
                            .padding(.trailing, 10)
                            .padding(.leading, -5)
                    }
                    VStack(alignment: .leading) {
                        if let user = vm.currentUser {
                            Text("\(user.fullname)")
                                .foregroundColor(Color.white)
                                .font(.custom("Limelight-Regular", size: 30))
                        } else {
                            Text("Riya Modak")
                                .foregroundColor(Color.white)
                                .font(.custom("Limelight-Regular", size: 30))
                        }
                        // TODO: include num friends as a variable in an if let user statement
                        Text("37 friends")
                            .foregroundColor(.gray)
                            .font(.custom("Limelight-Regular", size: 23))
                    }
                    .padding(.top, 25)
                }
                //                Button("Sign out") {
                //                    vm.signOut()
                //                }
                VStack {
                    HStack {
                        Text("hosting history")
                            .foregroundColor(Color.white)
                            .font(.custom("Limelight-Regular", size: 30))
                            .frame(alignment: .leading)
                        Spacer()
                    }
                    ScrollView {
                        ForEach(vm.userEvents) {event in
                            EventCellView(event: event)
                        }
                    }
                }
                .padding(12)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(17)
                NavigationLink {
                    SavedEventsView()
                } label: {
                    Text("saved events")
                        .foregroundColor(Color.white)
                        .font(.custom("Limelight-Regular", size: 24))
                        .padding(.leading, 7)
                    Spacer()
                    Image(systemName: "bookmark")
                        .padding(.trailing, 7)
                        .foregroundColor(Color("mustard"))
                        .frame(width: 20)
                        .font(.system(size: 22))
                }
                .onTapGesture {
                    vm.fetchLikedPosts()
                }
                .padding(12)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(.leading, 17)
                .padding(.trailing, 17)
                .padding(.top, -10)
            
            Button {
                    //TODO: Nav Link to Event Preferences View
            } label: {
                    Text("event preferences")
                        .foregroundColor(Color.white)
                        .font(.custom("Limelight-Regular", size: 24))
                        .padding(.leading, 7)
                    Spacer()
                    Image(systemName: "slider.horizontal.3")
                        .padding(.trailing, 7)
                        .foregroundColor(Color("mustard"))
                        .frame(width: 20)
                        .font(.system(size: 20))
            }
                .padding(12)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(.leading, 17)
                .padding(.trailing, 17)
            Button {
                        //TODO: Nav Link to Friends List View
            } label: {
                        Text("friends list")
                            .foregroundColor(Color.white)
                            .font(.custom("Limelight-Regular", size: 24))
                            .padding(.leading, 7)
                        Spacer()
                        Image(systemName: "person.3")
                            .padding(.trailing, 10)
                            .foregroundColor(Color("mustard"))
                            .frame(width: 20)
            }
                    .padding(12)
                    .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                    .cornerRadius(12)
                    .padding(.leading, 17)
                    .padding(.trailing, 17)
                NavigationLink {
                    SettingsView()
                } label: {
                    Text("profile settings")
                        .foregroundColor(Color.white)
                        .font(.custom("Limelight-Regular", size: 24))
                        .padding(.leading, 7)
                    Spacer()
                    Image(systemName: "gear")
                        .padding(.trailing, 7)
                        .foregroundColor(Color("mustard"))
                        .frame(width: 20)
                        .font(.system(size: 20))
                }
                .padding(12)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(.leading, 17)
                .padding(.trailing, 17)
                .padding(.bottom, 30)
                    
        }
    }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
