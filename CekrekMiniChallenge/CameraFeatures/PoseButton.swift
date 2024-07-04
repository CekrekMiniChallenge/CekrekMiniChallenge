//
//  PoseButton.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 04/07/24.
//

import SwiftUI

struct PoseButton: View {
//    @State var isActive: Bool = false
    @Binding var isClicked: Bool
    
    var body: some View {
        VStack{
            Image(systemName: "figure.stand")
                .foregroundStyle(.white)
                .font(.title)
                .frame(width: 30, height: 30)
                .onTapGesture {
                    withAnimation{
//                        isActive.toggle()
                        isClicked.toggle()
                    }
                }
        }
        .frame(height: 30)
        .padding(10)
        .background(.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    PoseButton(/*isActive: false, */isClicked: .constant(false))
}
