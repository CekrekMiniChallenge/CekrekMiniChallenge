//
//  OnBoarding.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 07/07/24.
//

import SwiftUI

struct onBoardItems {
    let image : String
    let content : String
}

let onBoardingStep = [
    onBoardItems(image: "onboarding1", content: "Before taking your best picture, let’s find something to hold or prop up your phone & make sure to set your camera straight to your eyes."),
    onBoardItems(image: "onboarding2", content: "Wear and use your best items that make you feel awesome, and strike a pose!")
]

struct OnBoarding: View {
    @State var currentStep = 0
    
    var body: some View {
        ZStack{
            TabView(selection: $currentStep){
                ForEach(0..<onBoardingStep.count){ i in
                    ZStack{
                        Color.blue
                        VStack(spacing: 0){
                            Image("\(onBoardingStep[i].image)")
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
                    .ignoresSafeArea()
                }
            }
            
            VStack{
                Spacer()
                Button{
                    
                }label: {
                    Text(currentStep < onBoardingStep.count - 1 ? "Next" : "Get Started")
                        .frame(width: 150, height: 20)
                        .padding(.bottom, 16)
                        .foregroundStyle(.black)
                        .font(.title3)
//                        .frame(maxWidth: .infinity)
                        .background(.blue)
                }
            }
        }
    }
}

#Preview {
    OnBoarding()
}
