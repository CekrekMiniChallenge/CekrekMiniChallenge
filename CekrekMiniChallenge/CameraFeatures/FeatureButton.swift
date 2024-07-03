//
//  FeatureButton.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 03/07/24.
//

import SwiftUI

struct FeatureButton: View {
    @State var currentClicked : Features
    @State var isActive: Bool
    @Binding var isClicked: Bool
    
    
    var body: some View {
//        Button(action: {
//            isClicked.toggle()
//        }, label: {
//            Image(systemName: buttonImg)
//                .font(.title)
//                .frame(width: 30, height: 30)
//        })
        Image(systemName: buttonImg)
            .foregroundStyle(isActive ? .yellow : .white)
            .font(.title)
            .frame(width: 30, height: 30)
            .onTapGesture {
                withAnimation{
                    isClicked.toggle()
                }
            }
    }
    
    var buttonImg : String {
        switch currentClicked {
        case .flash:
            "bolt.fill"
        case .timer:
            "timer"
        case .pose:
            "figure.fall"
        case .none:
            ""
        }
    }
}

#Preview {
    FeatureButton(currentClicked: .flash, isActive: false, isClicked: .constant(true))
}
