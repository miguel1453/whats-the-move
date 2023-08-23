//
//  UserService.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/17/23.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUID uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument() { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                print("DEBUG: username [\(user.username)] email: [\(user.email)]")
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: User.self)})
                
                completion(users)
            
            }
    }
    
    func fetchUserEvents(uid: String, completion: @escaping([Event]) -> Void) {
        Firestore.firestore().collection("users").document("\(uid)").collection("events")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let events = documents.compactMap({ try? $0.data(as: Event.self)})
                
                completion(events)
                print("DEBUG: fetchUserEvents success!")
            }
    }
    func fetchLikedEvents(uid: String, completion: @escaping([Event]) -> Void) {
        Firestore.firestore().collection("users").document("\(uid)").collection("likedEvents")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let events = documents.compactMap({ try? $0.data(as: Event.self)})
                
                completion(events)
            }
    }
    
    func addLikedPost(title: String, tag: String, privacy: String, location: String, address: String, caption: String, date: String, time: String, datePosted: String, username: String, userFullName: String, userImage: String, completion: @escaping(Bool) -> Void) {
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
        
        Firestore.firestore().collection("users").document("\(uid)").collection("likedEvents").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: FAILED to upload post to USER \(uid)")
                    return
                } else {
                    print("DEBUG: successfully uploaded event to USER \(uid)")
                }
            }
    }
    
}
    
