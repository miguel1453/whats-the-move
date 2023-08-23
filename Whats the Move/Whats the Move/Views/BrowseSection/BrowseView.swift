//
//  BrowseView.swift
//  Whats the Move
//
//  Created by Chiara Sabato on 4/17/23.
//

import SwiftUI

struct BrowseView: View {
    @EnvironmentObject var vm: AuthViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack{
                    HStack{
                        Text("browse")
                            .font(.custom("Limelight-Regular", size: 55))
                            .foregroundColor(Color.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .padding(.bottom, -28)
                            .padding(.leading, 10)
                            .padding(.top, 15)
                        Spacer()
                    }
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "sun.max")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 40))
                                Text("darties")
                                    .font(.custom("BIZUDGothic-Bold", size: 26))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(12)
                        .frame(width: 180, height: 200)
                        .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                        .cornerRadius(12)
                        .padding(17)
                        .padding(.trailing, -25)
                        VStack {
                            HStack {
                                Image(systemName: "moon.stars")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 40))
                                Text("parties")
                                    .font(.custom("BIZUDGothic-Bold", size: 26))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(12)
                        .frame(width: 180, height: 200)
                        .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                        .cornerRadius(12)
                        .padding(17)
                    }
                    .padding(.bottom, -30)
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "party.popper")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 40))
                                Text("clubs")
                                    .font(.custom("BIZUDGothic-Bold", size: 28))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(12)
                        .frame(width: 180, height: 200)
                        .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                        .cornerRadius(12)
                        .padding(17)
                        .padding(.trailing, -25)
                        VStack {
                            HStack {
                                Image(systemName: "wineglass")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 40))
                                Text("bars")
                                    .font(.custom("BIZUDGothic-Bold", size: 28))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(12)
                        .frame(width: 180, height: 200)
                        .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                        .cornerRadius(12)
                        .padding(17)
                    }
                    .padding(.bottom, -30)
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "tree")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 40))
                                Text("outdoor")
                                    .font(.custom("BIZUDGothic-Bold", size: 23))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(12)
                        .frame(width: 180, height: 200)
                        .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                        .cornerRadius(12)
                        .padding(17)
                        .padding(.trailing, -25)
                        VStack {
                            HStack {
                                Image(systemName: "figure.socialdance")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 40))
                                Text("kickback")
                                    .font(.custom("BIZUDGothic-Bold", size: 22))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(12)
                        .frame(width: 180, height: 200)
                        .background(Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255))
                        .cornerRadius(12)
                        .padding(17)
                    }
                    Spacer()
                        
                    }
                }
            }
        }
    }


struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
