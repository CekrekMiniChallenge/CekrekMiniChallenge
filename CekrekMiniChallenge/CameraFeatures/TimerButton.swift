//
//  TimerButton.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 04/07/24.
//

import SwiftUI

struct TimerButton: View {
    @State var isTimerActive = false
    @State var isExpanded = false
    
    @Binding var currentFeature : Features
    
    @Binding var currentDuration : Duration

    var body: some View {
        HStack{
            if isExpanded{
                Image(systemName: "timer")
                    .foregroundStyle(isTimerActive ? .yellow : .white)
                    .font(.title)
                    .padding(.leading, 5)
                    .onTapGesture {
                        withAnimation{
                            isExpanded.toggle()
                            currentFeature = .none
                        }
                    }
                
                Spacer().frame(width: 40)
                
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isTimerActive = false
                        currentDuration = .off
                        currentFeature = .none
                    }
                } label: {
                    Text("Off")
                        .foregroundStyle(.white)
                    Spacer().frame(width: 30)
                }
                
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isTimerActive = true
                        currentDuration = .five
                        currentFeature = .none
                    }
                } label: {
                    Text("5s")
                        .foregroundStyle(currentDuration == .five ? .yellow : .white)
                    Spacer().frame(width: 40)
                }
                
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isTimerActive = true
                        currentDuration = .ten
                        currentFeature = .none
                    }
                } label: {
                    Text("10s")
                        .foregroundStyle(currentDuration == .ten ? .yellow : .white)
                        .padding(.trailing, 5)
                }
            }else{
                Image(systemName: "timer")
                    .foregroundStyle(isTimerActive ? .yellow : .white)
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        withAnimation{
                            isExpanded.toggle()
                            currentFeature = .timer
                        }
                    }
            }
        }
        .frame(height: 30)
        .padding(10)
        .background(.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .animation(.spring(), value: isExpanded)
        .onChange(of: currentFeature){
            withAnimation{
                if currentFeature == .timer{
                    isExpanded = true
                }else{
                    isExpanded = false
                }
            }
        }
    }
}

#Preview {
    TimerButton(currentFeature: .constant(.timer), currentDuration: .constant(.off))
}
