//
//  HomePageView.swift
//  Whats the Move
//
//  Created by Chiara Sabato on 4/12/23.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var vm: AuthViewModel
    @ObservedObject var searchvm = SearchEventsViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack{
                    HStack{
                        Text("what's the \nmove?")
                        //i'm having trouble getting the font imported
                            .font(.custom("Limelight-Regular", size: 25))
                            .foregroundColor(Color.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        NavigationLink  {
                            PostEventView()
                                .environmentObject(searchvm)
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("mustard"))
                                .font(.system(size: 35))
                                .padding(.trailing)
                        }
                        
//                        Image(systemName: "message.fill")
//                            .foregroundColor(Color("mustard"))
//                            .font(.system(size: 32))
//                            .padding(.trailing)

                    }
                    ScrollView {
                        ForEach(searchvm.events) { event in
                            EventCellView(event: event)
                            
                        }
                    }
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(AuthViewModel())
    }
}
