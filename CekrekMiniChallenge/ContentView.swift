//
//  ContentView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    var body: some View {
        VStack {
            if hasCompletedOnboarding {
                OBcharacterDummy()
            }else{
                OnBoarding()
            }
//            CameraCaptureView()
//            CameraCustomView()
            
        }
    }
}

#Preview {
    ContentView()
}
