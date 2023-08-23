//
//  AuthView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/17/23.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        Group {
            if vm.userSession == nil {
                LoginView()
            } else {
                ContentView()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .environmentObject(AuthViewModel())
    }
}
