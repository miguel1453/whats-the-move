//
//  NotificationView.swift
//  Whats the Move
//
//  Created by Chiara Sabato on 4/17/23.
//

import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var vm: AuthViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Notification")
                .foregroundColor(Color.white)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
