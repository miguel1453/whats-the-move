//
//  Event Service.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/18/23.
//

import Firebase
import FirebaseFirestoreSwift

struct EventService {
    func uploadEvent(title: String, tag: String, privacy: String, location: String, address: String, caption: String, date: String, time: String, datePosted: String, username: String, userFullName: String, userImage: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        
        
        let data = ["userID": uid,
                    "username": username,
                    "userFullName": userFullName,
                    "userImage": userImage,
                    "title": title,
                    "tag": tag,
                    "privacy": privacy,
                    "location": location,
                    "address": address,
                    "date": date,
                    "time": time,
                    "caption": caption,
                    "postedDate": datePosted]
        Firestore.firestore().collection("events").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload post with error \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
                print("Upload succesful")
            }
        Firestore.firestore().collection("users").document("\(uid)").collection("events").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: FAILED to upload post to USER \(uid)")
                    return
                } else {
                    print("DEBUG: successfully uploaded event to USER \(uid)")
                }
            }
    }
    
    func fetchEvents(completion: @escaping([Event]) -> Void) {
        print("fetch Evetns")
        Firestore.firestore().collection("events")
            .order(by: "postedDate", descending: true)
            .getDocuments { snapshot , _ in
            guard let documents = snapshot?.documents else {
                print("DEBUG: error fetching events")
                return
                
            }
            let events = documents.compactMap({ try? $0.data(as: Event.self)})
            
            completion(events)
            print("DEBUG: Success fetching events")
        }
    }
    

}
