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
    
    @State var currentDuration : duration = .off
    
    var body: some View {
        HStack{
            if isExpanded{
                Image(systemName: "timer")
                    .foregroundStyle(isTimerActive ? .yellow : .black)
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
                        isTimerActive = false
                        currentDuration = .off
                    }
                } label: {
                    Text("Off")
                    Spacer().frame(width: 50)
                }
                
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isTimerActive = true
                        currentDuration = .five
                    }
                } label: {
                    Text("5s")
                        .foregroundStyle(currentDuration == .five ? .yellow : .black)
                    Spacer().frame(width: 50)
                }
                
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isTimerActive = true
                        currentDuration = .ten
                    }
                } label: {
                    Text("10s")
                        .foregroundStyle(currentDuration == .ten ? .yellow : .black)
                        .padding(.trailing, 5)
                }
            }else{
                Image(systemName: "timer")
                    .foregroundStyle(isTimerActive ? .yellow : .black)
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        withAnimation{
                            isExpanded.toggle()
                        }
                    }
            }
        }
        .frame(height: 30)
        .padding(10)
        .background(.black.opacity(0.5))
        .foregroundColor(.black)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .animation(.spring(), value: isExpanded)
    }
}

#Preview {
    TimerButton()
}
