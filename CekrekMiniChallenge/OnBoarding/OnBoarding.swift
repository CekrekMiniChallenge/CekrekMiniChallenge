//
//  OnBoarding.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 07/07/24.
//

import SwiftUI

struct OnBoardItems {
    let image: String
    let content: String
}

let onBoardingStep = [
    OnBoardItems(image: "onboarding1", content: "Before taking your best picture, let’s find something to hold or prop up your phone & make sure to set your camera straight to your eyes."),
    OnBoardItems(image: "onboarding2", content: "Wear and use your best items that make you feel awesome, and strike a pose!")
]

struct OnBoarding: View {
    @State var currentStep = 0
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    var body: some View {
        ZStack{
            TabView(selection: $currentStep){
                ForEach(0..<onBoardingStep.count, id: \.self) { i in
                    ZStack{
                        Color.blue
                            .ignoresSafeArea()
                        VStack(spacing: 0){
                            Image(onBoardingStep[i].image)
                                .resizable()
                                .opacity(0.6)
                                .scaledToFill()
                                .overlay{
                                    LinearGradient(stops: [
                                        Gradient.Stop(color: .clear, location: 0.5),
                                        Gradient.Stop(color: .black, location: 1),
                                    ], startPoint: .top, endPoint: .bottom)
                                }
                            Color.black
                        }
                        .ignoresSafeArea()
                        
                        VStack{
                            Spacer()
                            Text(onBoardingStep[i].content)
                                .foregroundStyle(.white)
                                .font(.title3)
                                .fontWeight(.regular)
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 150)
                        }
                        
                    }
                    .tag(i)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                Button {
                    if currentStep < onBoardingStep.count - 1 {
                        withAnimation {
                            currentStep += 1
                        }
                    } else {
                        hasCompletedOnboarding = true
                    }
                } label: {
                    Text(currentStep < onBoardingStep.count - 1 ? "Next" : "Get Started")
                        .modifier(ButtonWhiteTextPurple())
                }
                .padding(.bottom, 20)
            }
        }
    }
}

//@main
//struct CekrekMiniChallengeApp: App {
//    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
//    
//    var body: some Scene {
//        WindowGroup {
//            if hasCompletedOnboarding {
//                ContentView() // Your main content view
//            } else {
//                OnBoarding()
//            }
//        }
//    }
//}

#Preview {
    OnBoarding()
}

