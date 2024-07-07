//
//  FourCharacter.swift
//  CekrekMiniChallenge
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 03/07/24.
//

import SwiftUI

struct FourCharacter: View {
//    let initialTabIndex: Int
    @State var selectedIndex: Int
    @State var selectedPose: Int
    @State var valueSelected : Value

    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    ConfidentCharacter(selectedPose: $selectedPose, selectedValue: $valueSelected)
                        .tag(0)

                    StrongCharacter(selectedPose: $selectedPose, selectedValue: $valueSelected)
                        .tag(1)

                    FriendlyCharacter(selectedPose: $selectedPose, selectedValue: $valueSelected)
                        .tag(2)

                    GenuineCharacter(selectedPose: $selectedPose, selectedValue: $valueSelected)
                        .tag(3)

                }
                .tabViewStyle(.page)
                
                
                NavigationLink(destination: CameraCaptureView(pose: selectedPose, value: valueSelected).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .modifier(ButtonWhiteTextPurple())
                }
                

//                NavigationLink(destination: CobaLagi(value: $valueSelected, image: $selectedPose).navigationBarBackButtonHidden(true)) {
//                    Text("Next")
//                        .modifier(ButtonWhiteTextPurple())
//                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .ignoresSafeArea()
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .navigationBarHidden(true)
            .onChange(of: selectedIndex) { 
                if selectedIndex == 0 {
                    valueSelected = .confident
                } else if selectedIndex == 1 {
                    valueSelected = .strong
                }else if selectedIndex == 2 {
                    valueSelected = .friendly
                }else if selectedIndex == 3 {
                    valueSelected = .genuine
                }
            }
        }
    }
}

#Preview {
    FourCharacter(selectedIndex: 0, selectedPose: 0, valueSelected: .confident/*initialTabIndex: 0*/)
}



