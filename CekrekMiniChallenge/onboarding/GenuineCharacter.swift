//
//  GenuineCharacter.swift
//  CekrekMiniChallenge
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 03/07/24.
//

import SwiftUI

struct GenuineCharacter: View {
    @State private var selectedImage: String = "Wanita1"
    @State private var isTextExpanded: Bool = false
    @Binding var selectedPose: Int
    @Binding var selectedValue: Value
    
        var body: some View {
            NavigationStack{
                VStack {
                    ZStack{
                        VStack(alignment: .leading){
                            Text("Genuine")
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
                                            selectedValue = .genuine
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
                                        selectedValue = .genuine
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
                                        selectedValue = .genuine
                                    }
                            }
                            Text("Keep it real with a natural, relaxed pose that reflects your true self. Avoid overly formal or staged positions; go for a comfortable stance or seating arrangement. A sincere smile and expressive eyes show honesty and trustworthiness, leaving a lasting impression of authenticity.")
                                .font(.body)
                                .foregroundStyle(.white)
                                .lineLimit(isTextExpanded ? nil : 2)
                                .onTapGesture {
                                                                withAnimation {
                                                                    isTextExpanded.toggle()
                                                                }
                                                            }
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
            }
        }
}

#Preview {
    GenuineCharacter(selectedPose: .constant(0), selectedValue: .constant(.genuine))
}
