//
//  LoginView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/12/23.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State var email: String = ""
    @State var username: String = ""
    @State var fullname: String = ""
    @State var password: String = ""
    @State var showProfilePhoto = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: AuthViewModel
    
    @State var createAccount: Bool = false
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack() {
                NavigationLink(destination: ProfilePhotoSelectorView(), label: { })
                
                
                Text("Start the Party")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color( "mustard"))
                Text("Register")
                    .font(.title2)
                VStack {
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                    TextField("Full name", text: $fullname)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        showProfilePhoto.toggle()
                        vm.register(withEmail: email, password: password, fullname: fullname, username: username)
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color("mustard")))
                    }
                    .sheet(isPresented: $showProfilePhoto) {
                        ProfilePhotoSelectorView()
                    }
                    .frame(width: 350)
                }
            }
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(AuthViewModel())
    }
}


