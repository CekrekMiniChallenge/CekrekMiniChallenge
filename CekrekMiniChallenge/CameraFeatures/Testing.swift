//
//  Testing.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 03/07/24.
//

import Foundation

import SwiftUI

struct ExpandingButtonView: View {
    @State private var isExpanded = false
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isExpanded.toggle()
            }
        }) {
            HStack {
                if isExpanded {
                    Text("Timer Off")
                    Spacer().frame(width: 10)
                    Text("5s")
                }
                Image(systemName: isExpanded ? "power.circle.fill" : "power")
            }
            .padding(isExpanded ? 20 : 10)
            .background(Color.gray.opacity(0.2))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: isExpanded ? 20 : 25))
            .font(.system(size: isExpanded ? 18 : 24))
            .animation(.spring(), value: isExpanded)
        }
    }
}

#Preview {
    ExpandingButtonView()
}

