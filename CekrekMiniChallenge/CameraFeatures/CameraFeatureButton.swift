//
//  FlashButton.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 03/07/24.
//

import SwiftUI

struct CameraFeatureButton: View {
    @ObservedObject var camFeature = CameraFeatures()
    @State var isExpanded = false
    
    var featureActive : Features
    
    var body: some View {
        ZStack{
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }, label: {
                HStack{
                    if isExpanded{
                        if featureActive == .flash{
                            Image(systemName: "bolt.fill")
                                .font(.title)
                                .padding(.leading, 5)
                            Spacer().frame(width: 50)
                            Text("On")
                            Spacer().frame(width: 50)
                            Text("Off")
                                .padding(.trailing, 5)
                        }else if featureActive == .timer{
                            Image(systemName: "timer")
                                .font(.title)
                                .padding(.leading, 5)
                            Spacer().frame(width: 50)
                            Text("Off")
                            Spacer().frame(width: 50)
                            Text("5s")
                            Spacer().frame(width: 50)
                            Text("10s")
                                .padding(.trailing, 5)
                        }else if featureActive == .pose{
                            Image(systemName: "timer")
                                .font(.title)
                                .padding(.leading, 5)
                        }
                    }else{
                        if featureActive == .flash{
                            Image(systemName: "bolt.fill")
                                .font(.title)
                                .frame(width: 30, height: 30)
                        }else if featureActive == .timer{
                            Image(systemName: "timer")
                                .font(.title)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
            })
            .frame(height: 30)
            .padding(10)
            .background(.white.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .animation(.spring(), value: isExpanded)
            
            
        }
    }
}

#Preview {
    CameraFeatureButton( featureActive: .timer)
}
