//
//  PoseItem.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 06/07/24.
//

import SwiftUI

struct PoseItem: View {
    let value : String
    
    var body: some View {
        ZStack{
            Color.clear
                .frame(width: 114, height: 114)
                .overlay(
                    Image(value)
                        .resizable()
                        .scaledToFill()
                        .offset(y:10)
                    )
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(width: 115, height: 115)
    }
}

#Preview {
    PoseItem(value: "Confident1")
}
