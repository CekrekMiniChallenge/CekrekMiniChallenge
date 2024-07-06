//
//  ContentView.swift
//  CekrekWatch Watch App
//
//  Created by Nadya Margareth Angkawijaya on 05/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var connectivityManager = WatchConnectivityManager.shared
    @State private var imageIndex = 0
    @State private var timerImageIndex = 0
    @State private var isAlternateImage = false
    
    let images = ["bolt.slash.circle","bolt.circle.fill"]
    let timerImages = ["timer", "timer.circle.fill"]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: images[imageIndex])
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(connectivityManager.flash ? .yellow : .primary)
                    .onTapGesture {
                        imageIndex = (imageIndex + 1) % images.count
                        connectivityManager.callFlash()
                    }
                Spacer()
                Spacer()
                Image(systemName: timerImages[timerImageIndex])
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(connectivityManager.fiveSecTimer ? .yellow : .primary)
                    .onTapGesture {
                        timerImageIndex = (timerImageIndex + 1) % timerImages.count
                        isAlternateImage.toggle()
                        connectivityManager.callFiveSec()
                    }
                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            Button(action: {
                connectivityManager.callCaptured()
            }, label: {
                Image(isAlternateImage ? "Image 1" : "Image")
                    .resizable()
                    .renderingMode(.original) // Try setting rendering mode to original
                    .frame(width: 97, height: 97)
                    .background(Color.clear) // Set background color if needed
                    .clipShape(Rectangle()) // Clip to a specific shape
            }).frame(width: 97, height: 97)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

