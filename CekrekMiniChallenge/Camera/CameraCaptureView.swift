//
//  CameraCaptureView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 01/07/24.
//

import SwiftUI
import Photos
import UIKit

struct CameraCaptureView: View {
    @StateObject var cameraService = CameraService()
    @StateObject var watch = WatchConnectivityManager.shared

    @State var capturedImage : UIImage? = nil
    @State var photoPreview : UIImage? = nil
    
    @State private var showFlash = false
    
    @State private var countdown: Int? = nil
    
    @State private var timer: Timer? = nil
    
    @State private var currentFeature: Features = .none
    
    @State private var flashCondition: Flash = .off
    @State private var timerCondition: Duration = .off
    @State private var poseShow: Bool = false
    
    @State private var isFlashOn = false
    @State private var originalBrightness: CGFloat = UIScreen.main.brightness
    
    var body: some View {
        ZStack{
            CameraView(camera: cameraService)
                .offset(y: -60)
                .ignoresSafeArea()
            
//            if showFlash {
//                Color.white
//                    .edgesIgnoringSafeArea(.all)
//                    .opacity(showFlash ? 1 : 0)
//                    .animation(.easeInOut(duration: 0.1), value: showFlash)
//            }
            
            if cameraService.photoCaptured {
                Color.black
                    .opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5))
            }
            
            if let countdown = countdown {
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(countdown)")
                            .font(.title)
                            .bold()
                            .padding(.trailing, 15)
                    }
                }
                .padding(.bottom, 200)
            }
            
            ZStack {
                VStack{
                    Spacer()
                    FeaturesButtonView(poseShow: $poseShow, currentFlash: $flashCondition, currentDuration: $timerCondition)
                        
                }
                .padding(.bottom, 100)
                
                VStack {
                    Spacer()
                    Button(action: {
                        if timerCondition == .off{
                            if flashCondition == .on {
                                withAnimation {
                                    isFlashOn = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                                    withAnimation {
                                        capture()
                                        isFlashOn = false
                                    }
                                }
                            }
                           else if flashCondition == .off {
                               capture()
                            }
                        }else if timerCondition == .five{
                            startCountdown(seconds: 5)
                            if flashCondition == .on {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {
                                    withAnimation {
                                        isFlashOn = true
                                        DispatchQueue.main.asyncAfter(deadline: .now()+1.9) {
                                           withAnimation {
                                               capture()
                                                isFlashOn = false
                                            }
                                        }
                                    }
                                }
                            }
                            else if flashCondition == .off {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {
                                    capture()
                                }
                             }
                        }else if timerCondition == .ten{
                            startCountdown(seconds: 10)
                            if flashCondition == .on {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
                                    withAnimation {
                                        isFlashOn = true
                                        DispatchQueue.main.asyncAfter(deadline: .now()+1.9) {
                                           withAnimation {
                                               capture()
                                                isFlashOn = false
                                            }
                                        }
                                    }
                                }
                            }
                            else if flashCondition == .off {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
                                    capture()
                                }
                             }
                        }
                    },label: {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .overlay{
                                Circle()
                                    .stroke(.white, lineWidth: 5)
                                    .frame(width: 75, height: 75)
                            }
                    })
                }
                
                VStack {
                    Spacer()
                    HStack{
                        Button(action: {

                        },label: {
                            if let capturedImage = capturedImage {
                                Color.clear
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Image(uiImage: capturedImage)
                                            .resizable()
                                            .scaledToFill()
                                        )
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }else{
                                if let photoPreview = photoPreview {
                                    Color.clear
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            Image(uiImage: photoPreview)
                                                .resizable()
                                                .scaledToFill()
                                        )
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        })
                        .padding(.leading, 25)
                        
                        Spacer()
                    }
                }
            }
            .padding(.bottom, 25)
            
            if isFlashOn {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        originalBrightness = UIScreen.main.brightness
                        UIScreen.main.brightness = CGFloat(1.0) // Set brightness to maximum
                    }
                    .onDisappear {
                        UIScreen.main.brightness = originalBrightness // Restore original brightness
                    }
            }
        }
        .sheet(isPresented: $poseShow, content: {
            PoseModal()
                .presentationDetents([.fraction(0.25)])
        })
        .background(.black)
        .onChange(of: cameraService.picData) {oldValue, newValue in
            if let uiImage = UIImage(data: newValue) {
                capturedImage = uiImage
            }
        }
        .onChange(of: capturedImage){
            photoPreview = capturedImage
        }
        .onChange(of: watch.isCaptured){
            if timerCondition == .off{
                if flashCondition == .on {
                    withAnimation {
                        isFlashOn = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                        withAnimation {
                            capture()
                            isFlashOn = false
                        }
                    }
                }
               else if flashCondition == .off {
                   capture()
                }
            }else if timerCondition == .five{
                startCountdown(seconds: 5)
                if flashCondition == .on {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {
                        withAnimation {
                            isFlashOn = true
                            DispatchQueue.main.asyncAfter(deadline: .now()+1.9) {
                               withAnimation {
                                   capture()
                                    isFlashOn = false
                                }
                            }
                        }
                    }
                }
                else if flashCondition == .off {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {
                        capture()
                    }
                 }
                    
            }else if timerCondition == .ten{
                startCountdown(seconds: 10)
                if flashCondition == .on {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
                        withAnimation {
                            isFlashOn = true
                            DispatchQueue.main.asyncAfter(deadline: .now()+1.9) {
                               withAnimation {
                                   capture()
                                    isFlashOn = false
                                }
                            }
                        }
                    }
                }
            }
            else if flashCondition == .off {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
                    capture()
                }
             }

        }
        .onChange(of: watch.flash){
            if watch.flash == true {
                self.flashCondition = .on
            } else if watch.flash == false {
                self.flashCondition = .off
            }
        }
        .onChange(of: watch.fiveSecTimer){
            if watch.fiveSecTimer == true {
                self.timerCondition = .five
            } else if watch.fiveSecTimer == false {
                self.timerCondition = .off
            }
        }
        .onAppear(perform: {
            requestAuthorizationAndFetchPhotos()
            cameraService.checkPermissions()
        })
    }
    
    func fetchPhotos(){
        let imgManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        if fetchResult.count > 0 {
            imgManager.requestImage(
                for: fetchResult.object(at: 0), targetSize: CGSize(width: 100, height: 200),
                contentMode: .aspectFit,
                options: requestOptions) { (image, _) in
                
                if let image = image {
                    photoPreview = image
                }
            }
        } else {
            DispatchQueue.main.async {
            }
        }
    }
    
    func requestAuthorizationAndFetchPhotos(){
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                DispatchQueue.main.async{
                    fetchPhotos()
                }
            default:
                break
            }
        }
    }
    
    func capture(){
        cameraService.capturePhoto()
    }
    
    private func startCountdown(seconds: Int) {
            countdown = seconds
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if let currentCount = countdown, currentCount > 1 {
                    countdown = currentCount - 1
                } else {
                    timer.invalidate()
                    countdown = nil
                    //cameraService.capturePhoto()
                }
            }
        }

    private func triggerFlash() {
        showFlash = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            showFlash = false
        }
    }
    
}

#Preview {
    CameraCaptureView()
}
