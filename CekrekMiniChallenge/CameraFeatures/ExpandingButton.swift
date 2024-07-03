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
    @State var isFlashActive = false
    @State var isTimerActive = false
    
    var featureActive : Features
    @Binding var currentFeature : Features
    
    var body: some View {
        HStack{
            if isExpanded{
                if featureActive == .flash{
                    Image(systemName: "bolt.fill")
                        .foregroundStyle(isFlashActive ? .yellow : .white)
                        .font(.title)
                        .padding(.leading, 5)
                        .onTapGesture {
                            withAnimation{
                                isExpanded.toggle()
                            }
                        }
                    Spacer().frame(width: 50)
                    Button {
                        withAnimation{
                            isExpanded.toggle()
                            isFlashActive = true
                        }
                    } label: {
                        Text("On")
                        Spacer().frame(width: 50)
                    }
                    Button {
                        withAnimation{
                            isExpanded.toggle()
                            isFlashActive = false
                        }
                    } label: {
                        Text("Off")
                            .padding(.trailing, 5)
                    }
                }else if featureActive == .timer{
                    Image(systemName: "timer")
                        .foregroundStyle(isTimerActive ? .yellow : .white)
                        .font(.title)
                        .padding(.leading, 5)
                        .onTapGesture {
                            withAnimation{
                                isExpanded.toggle()
                            }
                        }
                    Spacer().frame(width: 30)
                    Button {
                        withAnimation{
                            isExpanded.toggle()
                            isTimerActive = false
                        }
                    } label: {
                        Text("Off")
                        Spacer().frame(width: 30)
                    }
                    Button {
                        withAnimation{
                            isExpanded.toggle()
                            isTimerActive = true
                        }
                    } label: {
                        Text("5s")
                        Spacer().frame(width: 30)
                    }
                    Button {
                        withAnimation{
                            isExpanded.toggle()
                            isTimerActive = true
                        }
                    } label: {
                        Text("10s")
                            .padding(.trailing, 5)
                    }
                    
                }else if featureActive == .pose{
                    Image(systemName: "figure.fall")
                        .foregroundStyle(isTimerActive ? .yellow : .white)
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            withAnimation{
                                isExpanded.toggle()
                            }
                        }
//                    Button {
//                        
//                    } label: {
//                        Image(systemName: "figure.fall")
//                            .font(.title)
//                            .frame(width: 30, height: 30)
//                    }
                }
            }else{
                if featureActive == .flash{
                    FeatureButton(currentClicked: featureActive, isActive: isFlashActive, isClicked: $isExpanded)
                }else if featureActive == .timer{
                    FeatureButton(currentClicked: featureActive, isActive: isTimerActive, isClicked: $isExpanded)
                }else{
                    FeatureButton(currentClicked: featureActive, isActive: false, isClicked: $isExpanded)
                }
//                if featureActive == .flash{
////                    Image(systemName: "bolt.fill")
////                        .font(.title)
////                        .frame(width: 30, height: 30)
//
//                }else if featureActive == .timer{
//                    Image(systemName: "timer")
//                        .font(.title)
//                        .frame(width: 30, height: 30)
//                }else if featureActive == .pose{
//                    Image(systemName: "figure.fall")
//                        .font(.title)
//                        .frame(width: 30, height: 30)
//                }
            }
        }
            .frame(height: 30)
            .padding(10)
            .background(.white.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .animation(.spring(), value: isExpanded)
//            .onTapGesture {
//                withAnimation{
//                    isExpanded.toggle()
//                }
//            }
        
//        ZStack{
//            Button(action: {
//                withAnimation {
//                    isExpanded.toggle()
//                }
//            }, label: {
//                HStack{
//                    if isExpanded{
//                        if featureActive == .flash{
//                            Image(systemName: "bolt.fill")
//                                .font(.title)
//                                .padding(.leading, 5)
//                            Spacer().frame(width: 50)
//                            Button {
//                                
//                            } label: {
//                                Text("On")
//                                Spacer().frame(width: 50)
//                            }
//                            Button {
//                                
//                            } label: {
//                                Text("Off")
//                                    .padding(.trailing, 5)
//                            }
//                        }else if featureActive == .timer{
//                            Image(systemName: "timer")
//                                .font(.title)
//                                .padding(.leading, 5)
//                            Spacer().frame(width: 50)
//                            Button {
//                                
//                            } label: {
//                                Text("Off")
//                                Spacer().frame(width: 50)
//                            }
//                            Button {
//                                
//                            } label: {
//                                Text("5s")
//                                Spacer().frame(width: 50)
//                            }
//                            Button {
//                                
//                            } label: {
//                                Text("10s")
//                                    .padding(.trailing, 5)
//                            }
//                            
//                        }else if featureActive == .pose{
//                            Button {
//                                
//                            } label: {
//                                Image(systemName: "figure.fall")
//                                    .font(.title)
//                                    .frame(width: 30, height: 30)
//                            }
//                        }
//                    }else{
//                        if featureActive == .flash{
//                            Image(systemName: "bolt.fill")
//                                .font(.title)
//                                .frame(width: 30, height: 30)
//                        }else if featureActive == .timer{
//                            Image(systemName: "timer")
//                                .font(.title)
//                                .frame(width: 30, height: 30)
//                        }else if featureActive == .pose{
//                            Image(systemName: "figure.fall")
//                                .font(.title)
//                                .frame(width: 30, height: 30)
//                        }
//                    }
//                }
//            })
//            .frame(height: 30)
//            .padding(10)
//            .background(.white.opacity(0.5))
//            .foregroundColor(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 25))
//            .animation(.spring(), value: isExpanded)
//            
//            
//        }
    }
}

#Preview {
    CameraFeatureButton( featureActive: .timer, currentFeature: .constant(.flash))
}
