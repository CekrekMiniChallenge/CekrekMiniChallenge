//
//  FlashButton.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 04/07/24.
//

import SwiftUI

struct FlashButton: View {
    @State var isFlashActive = false
    @State var isExpanded = false
    
    @Binding var currentFeature : Features
    
    @Binding var currentFlash : Flash
    
    var body: some View {
        HStack{
            if isExpanded{
                Image(systemName: "bolt.fill")
                    .foregroundStyle(isFlashActive ? .yellow : .white)
                    .font(.title)
                    .padding(.leading, 5)
                    .onTapGesture {
                        withAnimation{
                            isExpanded.toggle()
                            currentFeature = .none
                        }
                    }
                Spacer().frame(width: 50)
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isFlashActive = true
                        currentFeature = .none
                    }
                } label: {
                    Text("On")
                        .foregroundStyle(isFlashActive ? .yellow : .white)
                    Spacer().frame(width: 50)
                }
                Button {
                    withAnimation{
                        isExpanded.toggle()
                        isFlashActive = false
                        currentFeature = .none
                    }
                } label: {
                    Text("Off")
                        .foregroundStyle(.white)
                        .padding(.trailing, 5)
                }
            }else{
                Image(systemName: "bolt.fill")
                    .foregroundStyle(isFlashActive ? .yellow : .white)
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        withAnimation{
                            isExpanded.toggle()
                            currentFeature = .flash
                        }
                    }
            }
        }
        .frame(height: 30)
        .padding(10)
        .background(.white.opacity(0.5))
        .foregroundColor(.black)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .animation(.spring(), value: isExpanded)
        .onChange(of: currentFeature){
            withAnimation{
                if currentFeature == .flash{
                    isExpanded = true
                }else{
                    isExpanded = false
                }
            }
        }
    }
}

#Preview {
    FlashButton(currentFeature: .constant(.flash), currentFlash: .constant(.off))
}
