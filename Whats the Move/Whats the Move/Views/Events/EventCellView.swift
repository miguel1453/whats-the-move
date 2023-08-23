//
//  EventCellView.swift
//  Whats the Move
//
//  Created by Chiara Sabato on 4/12/23.
//

import SwiftUI
import Kingfisher

//for individual events, will need to pull from the Database to get Title, BYOB, address, theme, etc.
struct EventCellView: View {
    @EnvironmentObject var vm: AuthViewModel
    let event: Event
//    let user: User
    @State private var likeButton = "heart"
    @State private var saveButton = "bookmark"
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Text("\(event.tag)")
                        .foregroundColor(Color.gray)
                        .font(.custom("Limelight-Regular", size: 15))
                    Image(systemName: "tag")
                        .foregroundColor(Color("mustard"))
                        .font(.system(size: 15))
                }
                .padding(.bottom, 2)
                HStack {
                        KFImage(URL(string: event.userImage))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 48, height: 48)
                            .padding(.bottom, 60)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(event.userFullName)
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                //.padding(.leading, -33)
                            Text("@\(event.username)")
                         
                                .foregroundColor(Color.gray)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .padding(.leading, 6)
                        }
                        .padding(.bottom, 2)
                        Text(event.date)
                            .foregroundColor(Color.gray)
                            .font(.custom("BIZUDGothic-regular", size: 14))
                            .padding(.bottom, 2)
                        
                        Text(event.title)
                            .foregroundColor(.white)
                            .font(.custom("BIZUDGothic-Bold", size: 20))
                            .padding(.bottom, 2)
                        
                        Text("\(event.caption)")
                            .foregroundColor(.white)
                            .font(.custom("BIZUDGothic-Bold", size: 15))
                        
                        HStack {
                            Button {
                                // TODO: functionality to like an event
                                likeButton = "heart.fill"
                                //idk how to go from liked to unliked
                                
                            } label: {
                                Image(systemName: "\(likeButton)")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 20))
                            }
//                            Text("83") //TODO: replace with number of likes on the event
//                                .foregroundColor(Color("mustard"))
//                                .font(.custom("Limelight-Regular", size: 16))
//                                .padding(.leading, -5)
//                                .padding(.top, 5)
                            Button {
                                saveButton = "bookmark.fill"
                                //idk how to go from saved to unsaved
                                vm.addLikedPost(title: event.title, tag: event.tag, privacy: event.privacy, location: event.location, address: event.address, caption: event.caption, date: event.date, time: event.time, datePosted: event.postedDate, username: event.username, userFullName: event.userFullName, userImage: event.userImage)
                            } label: {
                                Image(systemName: "\(saveButton)")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 19))
                            }
                            Spacer()
                            NavigationLink {
                                EventDetailsView(event: event)
                            } label: {
                                Text("show details")
                                    .font(.custom("Limelight-Regular", size: 13))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(12)
                        }
                        .padding(.top, 7)
                        .padding(.bottom, 3)
                    }
                }
            }
            .padding(12)
            .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
            .cornerRadius(12)
            .padding(12)
        }
    }
}

struct EventCellView_Previews: PreviewProvider {
    static var previews: some View {
        EventCellView(event: Event.previewData)
        
    }
}
