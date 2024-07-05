//
//  Onboarding1.swift
//  CekrekMiniChallenge
//
//  Created by Nadya Margareth Angkawijaya on 30/06/24.
//

import SwiftUI

struct Onboarding1: View {
    @State private var isSplashComplete : Bool = false
    //static let color0 = Color(red: 0/255, green: 0/255, blue: 0/255);
    //static let color1 = Color(red: 10/255, green: 132/255, blue: 255/255);
    
    //let gradient = [color0, color1];
    var body: some View {
        if self.isSplashComplete{
            //CardView(card: CardType.basic(title: "Strong", description: "Bam", imageName: "Foto"))
            Onboarding1()
        }else
        {
            NavigationStack{
                ZStack {
                    VStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 620)
                            .background(
                                Image("Onboarding1")
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
                            .frame(width: 394, height: 700)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: .black.opacity(0), location: 0.00),
                                        Gradient.Stop(color: .black, location: 0.67),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                )
                            )
                    }
                    VStack{
                        // Title3/Regular
                        VStack{
                            Text("Before taking your best picture, let’s find something to hold or prop up your phone!")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 361, height: 75)
                                .padding(.top,70)
                        }
                        VStack{
                            NavigationLink{
                                Onboarding2()
                            }  label: {
                                Text("Next")
                            }
                            .padding(.vertical, 14)
                            .frame(width: 360, alignment: .center)
                            .background(Color(red: 64/225, green: 203/225, blue: 224/225))
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
        //        {
        //            ZStack{
        //                VStack{
        //                    VStack{
        //                        VStack{
        //                            Image("Onboarding1")
        //                                .resizable()
        //                                .ignoresSafeArea()
        //                                .foregroundColor(.clear)
        //                        }.frame(height: 725)
        //                    }
        //                    Spacer()
        //                        .frame(width: .infinity ,height: .infinity)
        //                        .cornerRadius(10.0)
        //                    //.frame(width: 420, height: 900)
        //                    VStack{
        //                        Text("CEKREK PRO")
        //                            .font(.title2)
        //                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        //                            .frame(width: 136, height: 28)
        //                            .padding(.top, 14.0)
        //                    }
        //
        //                }
        //                Rectangle()
        //                    .foregroundColor(.clear)
        //                    .frame(width: 394, height: .infinity)
        //                    .background(
        //                        LinearGradient(
        //                            stops: [
        //                                Gradient.Stop(color: .black.opacity(0), location: 0.00),
        //                                Gradient.Stop(color: .black, location: 0.68),
        //                            ],
        //                            startPoint: UnitPoint(x: 0.5, y: 0),
        //                            endPoint: UnitPoint(x: 0.5, y: 1)
        //                        )
        //                    )
        //            }.background(Color(.blue))
        //                .preferredColorScheme(.dark)
        //                .padding()
        //                .onAppear{
        //                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        //                        withAnimation{
        //                            self.isSplashComplete = true
        //                        }
        //                    }
        //                }
        //        }
        
        
    }
}

#Preview {
    Onboarding1()
}


