//
//  SettingsView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/22/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: AuthViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("mustard"))
                            .font(.system(size: 50))
                            .padding(.leading)
                            //.padding(.leading)
                            .padding(.bottom, 3)
                    }
                    Text("settings")
                        .font(.custom("Limelight-Regular", size: 55))
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.bottom, -28)
                        //.padding(.leading, 10)
                        //.padding(.top, 15)
                        .padding(.top, -30)
                    Spacer()
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("email & password")
                            .font(.custom("Limelight-Regular", size: 18))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    if let user = vm.currentUser {
                        Text("\(user.email)")
                            .font(.custom("Limelight-Regular", size: 18))
                            .foregroundColor(Color.white)
                            .padding(.leading, 10)
                            .padding(.top, 10)
                    } else {
                        Text("riyamodak@gmail.com")
                            .font(.custom("Limelight-Regular", size: 18))
                            .foregroundColor(Color.white)
                            .padding(.leading, 10)
                            .padding(.top, 2)
                    }
                    Button {
                        //TODO: link to change password functionality
                    } label: {
                        Text("change password")
                            .font(.custom("Limelight-Regular", size: 18))
                            .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                            .padding(.top, -2)
                            .padding(.bottom, -2)
                    }
                    .padding(7)
                    .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                    .cornerRadius(12)
                    .padding(.leading, 10)
                }
                .padding(12)
                //.frame(width: 180, height: 200)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(17)
                Button {
                    vm.signOut()
                } label: {
                    Text("sign out")
                        .font(.custom("Limelight-Regular", size: 18))
                        .foregroundColor(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                        .padding(.top, -2)
                        .padding(.bottom, -2)
                }
                .padding(7)
                .background(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255))
                .cornerRadius(12)
                .padding(.leading, 10)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
