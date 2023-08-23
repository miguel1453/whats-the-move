//
//  UserCellView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/21/23.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    var user: User
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)

                    Text(user.username)
                        .font(.custom("BIZUDGothic-Regular", size: 16))
                        .foregroundColor(Color.white)
                    Spacer()
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(12)
            .frame(width: 350)
            .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
            .cornerRadius(12)
            .padding(12)
            
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView(user: User.previewData)
    }
}
