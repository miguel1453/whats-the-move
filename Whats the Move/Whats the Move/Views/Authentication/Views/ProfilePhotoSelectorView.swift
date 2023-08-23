 //
//  ProfilePhotoSelectorView.swift
//  Whats the Move
//
//  Created by Chiara Sabato on 4/19/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var vm: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                    Text("add a profile pic")
                        .foregroundColor(Color("mustard"))
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }
                Button{
                    showImagePicker.toggle()
                } label: {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .modifier(ProfileImageModifier())
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.crop.circle.badge.plus")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(ProfileImageModifier())
                    }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                    ImagePicker(selectedImage: $selectedImage)
                }
                .padding(.top, 44)

                if let selectedImage = selectedImage {
                    Button {
                        vm.uploadProfileImage(selectedImage)
                        dismiss()
                    } label: {
                        Text("Continue")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.blue))
                    }
                }
                
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
    
    private func dismissView() {
            dismiss()
            vm.fethUser()
        }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("mustard"))
            .scaledToFill()
            .frame(width: 180, height: 180)
    }
}
