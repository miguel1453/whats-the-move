//
//  EventViewModel.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/18/23.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var didUploadEvent = false
    
    let service = EventService()
    
    func uploadEvent(title: String, tag: String, privacy: String, location: String, address: String, caption: String, date: Date, time: Date, username: String, userFullName: String, userImage: String) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let timeString = dateFormatter.string(from: time)
        
        dateFormatter.dateFormat = "MMM dd"
        let dateString = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "MMM dd, HH:mm"
        let postedDate = Date()
        let postedDateString = dateFormatter.string(from: postedDate)
        
        service.uploadEvent(title: title, tag: tag, privacy: privacy, location: location, address: address, caption: caption, date: dateString, time: timeString, datePosted: postedDateString, username: username, userFullName: userFullName, userImage: userImage) { success in
            if success {
                self.didUploadEvent = true
            } else { return }
        }
    }

    
}
