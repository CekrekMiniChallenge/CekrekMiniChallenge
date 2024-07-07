//
//  StrongCharacter.swift
//  CekrekMiniChallenge
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 03/07/24.
//

import SwiftUI

struct StrongCharacter: View {
    @State private var selectedImage: String = "Wanita1"
    @State private var isTextExpanded: Bool = false
    @Binding var selectedPose: Int
    @Binding var selectedValue: Value

        var body: some View {
            NavigationStack{
                VStack {
                    ZStack{
                        VStack(alignment: .leading){
                            Text("Strong")
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
                                            selectedValue = .strong
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
                                        selectedValue = .strong
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
                                        selectedValue = .strong
                                    }
                            }
                            Text("Show your strength with a pose that screams determination and resilience. Stand tall with your shoulders back and feet firmly planted, showing you're solid and steady. A subtle but powerful expression and a focused gaze capture your inner strength and readiness to tackle any challenge.")
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
    StrongCharacter(selectedPose: .constant(0), selectedValue: .constant(.strong))
}
