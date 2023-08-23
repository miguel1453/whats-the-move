//
//  Event.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/18/23.
//

import FirebaseFirestoreSwift

struct Event: Identifiable, Decodable {
    @DocumentID var id: String?
    let userID: String
    let username: String
    let userFullName: String
    let userImage: String
    let address: String
    let caption: String
    let location: String
    let privacy: String
    let tag: String
    let title: String
    let date: String
    let time: String
    let postedDate: String
}
extension Event {
    static let previewData = Event(userID: "Mario", username: "Mario123", userFullName: "Mario Bro", userImage: "https://firebasestorage.googleapis.com:443/v0/b/whats-the-move-15a9a.appspot.com/o/profile_image%2FBFA742B9-FCAE-4791-B0DB-24E33ACABC11?alt=media&token=e98f36bc-e07f-4d2b-970d-70d9d73ae2cc", address: "712hd9h3n", caption: "Please come I have no friends", location: "Sitterson", privacy: "public", tag: "darty", title: "Fun party", date: "Mar 12", time: "11:00 AM", postedDate: "Mar 27, 11:00 AM")
}
