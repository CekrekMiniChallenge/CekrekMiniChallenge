//
//  FeaturesButtonView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 04/07/24.
//

import SwiftUI

struct FeaturesButtonView: View {
    @State var featureClicked : Features = .none
    
    @Binding var poseShow : Bool
    
    @Binding var currentFlash : Flash
    @Binding var currentDuration : Duration
    
    var body: some View {
            HStack{
                FlashButton(currentFeature: $featureClicked, currentFlash: $currentFlash)
                TimerButton(currentFeature: $featureClicked, currentDuration: $currentDuration)
                PoseButton(isClicked: $poseShow)
            }
    }
}

#Preview {
    FeaturesButtonView(poseShow: .constant(false), currentFlash: .constant(.off), currentDuration: .constant(.off))
}
