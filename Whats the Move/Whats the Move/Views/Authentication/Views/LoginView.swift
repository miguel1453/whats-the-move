//
//  LoginView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/12/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var vm: AuthViewModel
    
    @State var createAccount: Bool = false
    @State var showError: Bool = false
    @State var errorMessage: String = ""

    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()

            VStack() {
                Text("Start the party")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("mustard"))
                    .padding()
                Text("Sign in")
                    .font(.title2)
                    .foregroundColor(Color.white)
                VStack {
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading)
                        .padding(.trailing)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading)
                        .padding(.trailing)
                    Button {
                        vm.login(withEmail: email, password: password)
                    } label: {
                        Text("sign in")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.blue))
                    }
                }
                NavigationLink {
                    RegisterView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account yet?")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
    
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
