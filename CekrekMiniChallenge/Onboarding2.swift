//
//  Onboarding2.swift
//  CekrekMiniChallenge
//
//  Created by Nadya Margareth Angkawijaya on 30/06/24.
//

import SwiftUI

struct Onboarding2: View {
    @State private var isSplashComplete : Bool = false
    //static let color0 = Color(red: 0/255, green: 0/255, blue: 0/255);
    //static let color1 = Color(red: 10/255, green: 132/255, blue: 255/255);
    
    //let gradient = [color0, color1];
    var body: some View {
        if self.isSplashComplete{
            //CardView(card: CardType.basic(title: "Strong", description: "Bam", imageName: "Foto"))
            Onboarding2()
        }else
        {
            NavigationStack{
                ZStack {
                    VStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 725)
                            .background(
                                Image("Onboarding2")
                                    .resizable()
                                    .opacity(0.55)
                            )
                        Spacer()
                    }
                    .ignoresSafeArea()
                    VStack{
                        Spacer()
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 443, height: 665)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: .black.opacity(0), location: 0.00),
                                        Gradient.Stop(color: .black, location: 0.68),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                )
                            )
                    }
                    VStack{
                        // Title3/Regular
                        VStack{
                            Text("Wear and use your best items that make you feel awesome, and strike a pose!")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 361, height: 75)
                                .padding(.top,70)
                        }
                        VStack{
                            NavigationLink{
                               // Onboarding2()
                            }  label: {
                                Text("Get Started")
                            }
                            .padding(.vertical, 14)
                            .frame(width: 360, alignment: .center)
                            .background(Color(red: 64/255, green: 203/255, blue: 224/255))
                            .cornerRadius(12)
                            .foregroundColor(.black)
                        }.padding(.top, 35)
                    }
                    .padding(.top,500)
                    
                }
                .navigationBarBackButtonHidden(true)
                .frame(width: 393, height: 852)
                .background(Color(red: 64/255, green: 203/255, blue: 224/255))
            }
        }
    }
}

#Preview {
    Onboarding2()
}
