//
//  ConfidentCharacter.swift
//  CekrekMiniChallenge
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 03/07/24.
//

import SwiftUI

struct ConfidentCharacter: View {
    @State private var selectedImage: String = "Wanita1"
    @Binding var selectedPose: Int
    @Binding var selectedValue: Value

        var body: some View {
            NavigationStack{
                VStack {
                    ZStack{
                        VStack(alignment: .leading){
                            Text("Confident")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 15)
                            Image(selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 394, height: 500, alignment: .top)
                                .clipped()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        VStack{
                            Spacer()
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.2), Color.black.opacity(1000)]),
                                                   startPoint: .center,
                                                   endPoint: .bottom))
                        }
                        VStack(alignment: .leading, spacing: 21){
                            Spacer()
                            
                            HStack{
                                VStack {
                                    Image("Wanita1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 114, height: 114, alignment: .top)
                                        .clipped()
                                        .cornerRadius(5)
                                        .onTapGesture {
                                            selectedImage = "Wanita1"
                                            selectedPose = 0
                                            selectedValue = .confident
                                        }
                                }
                                Spacer()
                                Image("Wanita2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 114, height: 114, alignment: .top)
                                    .clipped()
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        selectedImage = "Wanita2"
                                        selectedPose = 1
                                        selectedValue = .confident
                                    }
                                Spacer()
                                Image("Wanita3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 114, height: 114, alignment: .top)
                                    .clipped()
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        selectedImage = "Wanita3"
                                        selectedPose = 2
                                        selectedValue = .confident
                                    }
                            }
                            Text("Simply stand straight and look directly at the camera with a neutral expression.")
                                .font(.body)
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal, 50)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
//                    NavigationLink(destination: ContentView()){
//                        Text("Next")
//                            .modifier(ButtonWhiteTextPurple())
//                    }
                }
                .padding()
                .background(Color(red: 17/255, green: 17/255, blue: 17/255))
                .navigationBarHidden(true)
            }
        }
}

#Preview {
    ConfidentCharacter(selectedPose: .constant(0), selectedValue: .constant(.confident))
}
