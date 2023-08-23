//
//  AuthViewModel.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/17/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    //private var tempUserSession: FirebaseAuth.User?
    
    @Published var currentUser: User?
    @Published var userEvents = [Event]()
    @Published var likedEvents = [Event]()
    
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fethUser()
        self.fetchLikedPosts()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: oopsy signin wrong -- \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fethUser()
            print("DEBUG: susccessfully logged in")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            //self.tempUserSession = user
            self.userSession = user
            
            print("DEBUG: register user succesful: \(user.uid)")
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
            self.fethUser()
        }
    }
    
    func signOut() {
        self.userSession = nil
        self.currentUser = nil
        try? Auth.auth().signOut() 
        print("DEBUG: logged out")
    }
    
    func fethUser() {
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUID: uid) { user in
            self.currentUser = user
        }
        service.fetchUserEvents(uid: uid) { events in
            self.userEvents = events
        }
    }
    
    
//    func fetchUserX(withUID uid: String, completion: @escaping(User) -> Void) {
//        service.fetchUser(withUID: uid) { user in
//            completion(user)
//        }
//    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = userSession?.uid else {
            print("DEBUG: user uid Error")
            return }
        print("UID passed")
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.userSession
                }
        }
        self.fethUser()
    }
    
    func addLikedPost(title: String, tag: String, privacy: String, location: String, address: String, caption: String, date: String, time: String, datePosted: String, username: String, userFullName: String, userImage: String) {
        service.addLikedPost(title: title, tag: tag, privacy: privacy, location: location, address: address, caption: caption, date: date, time: time, datePosted: datePosted, username: username, userFullName: userFullName, userImage: userImage) { events in
            print("\(events)")
        }
//        self.fetchLikedPosts()
    }
    
    func fetchLikedPosts() {
        guard let uid = userSession?.uid else {return}
        service.fetchLikedEvents(uid: uid) { likedEvents in
            self.likedEvents = likedEvents
        }
    }
    
    
}
