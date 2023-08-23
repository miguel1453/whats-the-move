//
//  EventDetailsView.swift
//  Whats the Move
//
//  Created by riya on 4/21/23.
//

import SwiftUI
import Kingfisher

struct EventDetailsView: View {
    var event: Event
    @Environment(\.presentationMode) var presentationMode
    //@ObservedObject var eventvm = EventViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                VStack(alignment: .leading) {
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
                    Text("\(event.title)")
                        .foregroundColor(.white)
                        .font(.custom("Limelight-Regular", size: 40))
                        .padding(.bottom, 13)
                    HStack {
                        KFImage(URL(string: event.userImage))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 48, height: 48)
                        VStack(alignment: .leading) {
                            Text(event.userFullName)
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .padding(.bottom, 2)
                            Text("@\(event.username)") //TODO: replace with event.username
                                .foregroundColor(Color.gray)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                        }
                    }
                    .padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("date")
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .padding(.trailing, 10)
                            VStack {
                                Text("\(event.date)")
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                            Text("time")
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .padding(.trailing, 10)
                                .padding(.leading, 20)
                            VStack {
                                Text("\(event.time)")
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                        }
                        .padding(.bottom, 7)
                        HStack {
                            Text("location")
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .padding(.trailing, 10)
                            VStack {
                                Text("\(event.location)")
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                        }
                        .padding(.bottom, 7)
                        HStack {
                            Text("address")
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .padding(.trailing, 10)
                            VStack {
                                Text("\(event.address)")
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                        }
                        .padding(.bottom, 7)
                        HStack {
                            Text("privacy")
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .padding(.trailing, 10)
                            VStack {
                                Text("\(event.privacy)")
                                    .font(.custom("BIZUDGothic-Regular", size: 14))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                        }
                        .padding(.bottom, 7)
                        Button {
                            // TODO: include functionality for grabbing the current user's full name and username and storing it in the "rsvp maybe" collection for the event
                        } label: {
                            Text("view attachment")
                                .font(.custom("BIZUDGothic-Regular", size: 14))
                                .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                .padding(.top, -2)
                                .padding(.bottom, -2)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("mustard"))
                        }
                        .padding(7)
                        .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                        .cornerRadius(7)
                        .padding(.bottom, 30)
                        HStack {
                            Text("rsvp")
                                .foregroundColor(.white)
                                .font(.custom("BIZUDGothic-Regular", size: 20))
                                .padding(.trailing, 10)
                            Button {
                                // TODO: include functionality for grabbing the current user's full name and username and storing it in the "rsvp yes" collection for the event
                            } label: {
                                Text("yes")
                                    .font(.custom("BIZUDGothic-Regular", size: 20))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                            .padding(.trailing, 15)
                            Button {
                                // TODO: include functionality for grabbing the current user's full name and username and storing it in the "rsvp no" collection for the event
                            } label: {
                                Text("no")
                                    .font(.custom("BIZUDGothic-Regular", size: 20))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                            .padding(.trailing, 15)
                            Button {
                                // TODO: include functionality for grabbing the current user's full name and username and storing it in the "rsvp maybe" collection for the event
                            } label: {
                                Text("maybe")
                                    .font(.custom("BIZUDGothic-Regular", size: 20))
                                    .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                                    .padding(.top, -2)
                                    .padding(.bottom, -2)
                            }
                            .padding(7)
                            .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                            .cornerRadius(7)
                        }
                        .padding(.bottom, 7)
                       
                    }
                }
                .padding(.leading, 8)
                .padding(12)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(12)
            }
        }
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(event: Event.previewData)
        
    }
}
