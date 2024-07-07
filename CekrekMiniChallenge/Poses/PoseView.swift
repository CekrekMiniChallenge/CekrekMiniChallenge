//
//  PoseView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 07/07/24.
//

import SwiftUI

struct PoseView: View {
    var image : String
    
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFit()
                .offset(y: -93)
        }
    }
}

#Preview {
    PoseView(image: "ConfidentOutline1")
}
