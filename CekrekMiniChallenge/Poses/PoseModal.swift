//
//  PoseModal.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 04/07/24.
//

import SwiftUI

struct PoseModal: View {
    @Binding var pose : Int
    @Binding var value : Value
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 5)
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.top, 3)
                    .padding(.bottom, 25)
                
                HStack{
                    PoseGrid(value: value, pose: $pose)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    PoseModal(pose: .constant(0), value: .constant(.confident))
}
