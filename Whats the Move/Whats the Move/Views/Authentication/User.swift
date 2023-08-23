//
//  User.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/17/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}

extension User {
    static let previewData = User(username: "john123", fullname: "John Appleseed", profileImageUrl: "", email: "john123@gmail.com")
}
