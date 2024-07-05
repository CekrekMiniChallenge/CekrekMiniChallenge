//
//  FourCharacter.swift
//  CekrekMiniChallenge
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 03/07/24.
//

import SwiftUI

struct FourCharacter: View {
    let initialTabIndex: Int
    @State private var selectedIndex: Int
    
    init(initialTabIndex: Int) {
        self.initialTabIndex = initialTabIndex
        _selectedIndex = State(initialValue: initialTabIndex) // Initialize the state variable
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    ConfidentCharacter()
                        .tag(0)
                    StrongCharacter()
                        .tag(1)
                    FriendlyCharacter()
                        .tag(2)
                    GenuineCharacter()
                        .tag(3)
                }
                .tabViewStyle(.page)
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(false)) {
                    Text("Next")
                        .modifier(ButtonWhiteTextPurple())
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .ignoresSafeArea()
            .background(Color(red: 17/255, green: 17/255, blue: 17/255))
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    FourCharacter(initialTabIndex: 0)
}



