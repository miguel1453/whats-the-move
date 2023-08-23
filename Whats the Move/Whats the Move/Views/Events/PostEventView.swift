//
//  PostEventView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/18/23.
//

import SwiftUI

struct PostEventView: View {
    @EnvironmentObject var vm: AuthViewModel
    @EnvironmentObject var searchvm: SearchEventsViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var eventvm = EventViewModel()
    
    @State private var title = ""
    @State private var location = ""
    @State private var address = ""
    @State private var caption = ""
    @State private var date = Date()
    @State private var time = Date()
    @State private var selectedPrivacyOption = "privacy setting"
    @State private var selectedEventTypeOption = "select tag..."
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    Spacer(minLength: 70)
                    Text("new post")
                        .foregroundColor(Color.white)
                        .font(.custom("Limelight-Regular", size: 25))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Button {
                        if let user = vm.currentUser {
                            eventvm.uploadEvent(title: title, tag: selectedEventTypeOption, privacy: selectedPrivacyOption, location: location, address: address, caption: caption, date: date, time: time, username: user.username, userFullName: user.fullname, userImage: user.profileImageUrl)
                            
                            presentationMode.wrappedValue.dismiss()
                            searchvm.fetchEvents()
                        }
                    } label: {
                        Text("post")
                            .foregroundColor(Color.gray)
                            .font(.custom("Limelight-Regular", size: 25))
                            .padding(.trailing)
                            .padding(.trailing)
                    }
                }
                .padding(.bottom, 18)
                VStack {
                    HStack {
                        //insert user profile picture here
                        VStack {
                            if let user = vm.currentUser {
                                Text(user.fullname)
                                    .font(.custom("BIZUDGothic-Regular", size: 20))
                            } else {
                                Text("Not signed in")
                                    .font(.custom("BIZUDGothic-Regular", size: 20))
                                    .foregroundColor(Color.white)
                            }
                            VStack {
                                Menu {
                                    Button {
                                        selectedPrivacyOption = "public"
                                        // need the tag to be stored in database for the event
                                    } label: {
                                        Text("public")
                                        Image(systemName: "lock.open.fill")
                                    }
                                    Button {
                                        selectedPrivacyOption = "friends-only"
                                        // need the tag to be stored in database for the event
                                    } label: {
                                        Text("friends-only")
                                        Image(systemName: "lock.fill")
                                    }
                                } label: {
                                    Text("\(selectedPrivacyOption)")
                                        .font(.custom("BIZUDGothic-Regular", size: 14))
                                        .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color("mustard"))
                                }
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(12)
                            .padding(3)
                        }
                    }
                    .padding(.bottom, 30)
                    .padding(.top, 20)
                    VStack {
                        HStack {
                            Text("event title")
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .foregroundColor(Color.white)
                            Section {
                                TextField("...", text: $title)
                                    .cornerRadius(9)
                            }
                        }
                        .padding(.bottom, 5)
                        Section {
                            HStack{
                                Text("event type")
                                    .foregroundColor(Color.white)
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                VStack {
                                    Menu {
                                        Button("darties") {
                                            selectedEventTypeOption = "darties"
                                            // need the tag to be stored in database for the event
                                        }
                                        Button("narties") {
                                            selectedEventTypeOption = "narties"
                                            // need the tag to be stored in database for the event
                                        }
                                        Button("clubs") {
                                            selectedEventTypeOption = "clubs"
                                            // need the tag to be stored in database for the event
                                        }
                                        Button("bars") {
                                            selectedEventTypeOption = "bars"
                                            // need the tag to be stored in database for the event
                                        }
                                        Button("outdoors") {
                                            selectedEventTypeOption = "outdoors"
                                            // need the tag to be stored in database for the event
                                        }
                                        Button("kickbacks") {
                                            selectedEventTypeOption = "kickbacks"
                                            // need the tag to be stored in database for the event
                                        }
                                        Button("concerts") {
                                            selectedEventTypeOption = "concerts"
                                            // need the tag to be stored in database for the event
                                        }
                                        Button("themed") {
                                            selectedEventTypeOption = "themed"
                                            // need the tag to be stored in database for the event
                                        }
                                    } label: {
                                        Text("\(selectedEventTypeOption)")
                                            .font(.custom("BIZUDGothic-Regular", size: 12))
                                            .foregroundColor(Color.gray)
                                            .frame(alignment: .leading)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(Color("mustard"))
                                    }
                                }
                                .padding(7)
                                .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                                .cornerRadius(12)
                                .padding(3)
                            }
                            .padding(.bottom, 5)
                            HStack{
                                DatePicker("date", selection: $date, displayedComponents: .date)
                                    .foregroundColor(Color.white)
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                    .colorScheme(.dark)
                                    .frame(width: 200)
                                    .padding(.leading, -142)
                            }
                            .padding(.bottom, 5)
                            
                            HStack{
                                DatePicker("time", selection: $time, displayedComponents: .hourAndMinute)
                                    .foregroundColor(Color.white)
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                    .colorScheme(.dark)
                                    .frame(width: 170)
                                    .padding(.leading, -171)
                            }
                            .padding(.bottom, 5)
                            
                            HStack{
                                Text("location")
                                    .foregroundColor(Color.white)
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                TextField("...", text: $location)
                                    .cornerRadius(9)
                                
                            }
                            .padding(.bottom, 5)
                            
                            HStack{
                                Text("address")
                                    .foregroundColor(Color.white)
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                TextField("...", text: $address)
                                    .cornerRadius(9)
                            }
                            .padding(.bottom, 5)
                            VStack {
                                Text("caption")
                                    .font(.custom("BIZUDGothic-Regular", size: 16))
                                    .foregroundColor(Color.white)
                                
                                TextEditor(text: $caption)
                                    .frame(height: 100)
                                    .cornerRadius(12)
                            }
                            .padding(.top, 4)
                            .padding(.bottom, 20)
                        }
                    }
                }
                .textFieldStyle(.roundedBorder)
                .padding(12)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(12)
            }
            .background(Color.black.ignoresSafeArea())
            //.background(Color.primary)
            Spacer()
        }
    }
}

struct PostEventView_Previews: PreviewProvider {
    static var previews: some View {
        PostEventView()
            .environmentObject(AuthViewModel())
            //.preferredColorScheme(.dark)
    }
}
