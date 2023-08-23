//
//  SavedEventsView.swift
//  Whats the Move
//
//  Created by Miguel Villasenor on 4/22/23.
//

import SwiftUI

struct SavedEventsView: View {
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
                        Image(systemName: "multiply")
                            .foregroundColor(Color("mustard"))
                            .font(.system(size: 50))
                            .padding(.leading)
                            //.padding(.leading)
                            .padding(.bottom, 3)
                    }
                    Text("saved events")
                        .font(.custom("Limelight-Regular", size: 40))
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.bottom, -28)
                        //.padding(.leading, 10)
                    .padding(.top, -30)
                    Spacer()
                }
                ScrollView {
                    ForEach(vm.likedEvents) { event in
                        EventCellView(event: event)
                        
                    }
                }
                .padding(12)
                .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                .cornerRadius(12)
                .padding(17)
            }
        }
    }
}

struct SavedEventsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedEventsView()
    }
}
