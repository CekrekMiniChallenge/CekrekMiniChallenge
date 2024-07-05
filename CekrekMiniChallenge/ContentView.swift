//
//  ContentView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isSplashComplete : Bool = false
    static let color0 = Color(red: 0/255, green: 0/255, blue: 0/255);
    static let color1 = Color(red: 64/255, green: 203/255, blue: 224/255);
    
    let gradient = [color0, color1];
    var body: some View {
        if self.isSplashComplete{
            //CardView(card: CardType.basic(title: "Strong", description: "Bam", imageName: "Foto"))
            Onboarding1()
        }else{
            ZStack{
                VStack{
                    Spacer()
                    VStack{
                        Rectangle()
                            .foregroundStyle(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
                        //.fill(Gradient(colors: gradient))
                            .ignoresSafeArea()
                        
                    }.frame(width: 463, height: 394)
                }.frame(width: .infinity ,height: .infinity)
                VStack{
                    VStack{
                        Image("Splash")
                            .resizable()
                    }
                    
                    .cornerRadius(10.0)
                    .frame(width: 99, height: 114)
                    VStack{
                        Text("ProPose")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 136, height: 28)
                            .padding(.top, 14.0)
                    }
                    .preferredColorScheme(.dark)
                    .padding()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation{
                                self.isSplashComplete = true
                            }
                        }
                    }
                }
            }
        }
    }
}
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
