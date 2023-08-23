//
//  UserProfileView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/21/23.
//

import SwiftUI
import Kingfisher

struct UserProfileView: View {
    @ObservedObject var vm: SearchUserEventsViewModel
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    if let user = vm.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 48, height: 48)
                        VStack(alignment: .leading) {
                            Text(user.fullname)
                                .font(.custom("Limelight-Regular", size: 30))
                                .foregroundColor(Color.white)
                            Text("@\(user.username)")
                                .font(.custom("Limelight-Regular", size: 22))
                                .foregroundColor(Color.white)
                        }
                    }
                    
                }
                .textFieldStyle(.roundedBorder)
                .padding(12)
                .frame(width: 350)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(12)
                VStack {
                    Text("past events")
                        .font(.custom("Limelight-Regular", size: 22))
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)
                    ScrollView {
                        ForEach(vm.userEvents) { event in
                            EventCellView(event: event)
                        }
                    }
            }
           
        }
            
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(vm: SearchUserEventsViewModel(user: User.previewData))
    }
}
