//
//  CameraCaptureView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 01/07/24.
//

import SwiftUI
import Photos

struct CameraCaptureView: View {
    @StateObject var cameraService = CameraService()
    @State var capturedImage : UIImage? = nil
    @State var photoPreview : UIImage? = nil
    
    @State private var showFlash = false
    @State private var countdown: Int? = nil
    @State private var timer: Timer? = nil
    
    var body: some View {
        ZStack{
            CameraView(camera: cameraService)
                .offset(y: -60)
                .ignoresSafeArea()
            
            if showFlash {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .opacity(showFlash ? 1 : 0)
                    .animation(.easeInOut(duration: 0.1), value: showFlash)
            }
            
            ZStack {
                VStack{
                    Spacer()
                    CameraFeatureButton(featureActive: .flash)
                        .padding(.bottom, 100)
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        cameraService.capturePhoto()
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
//                            
//                            Color.clear
//                                .frame(width: 60, height: 60)
//                                .overlay(
//                                    Image(.logos)
//                                        .resizable()
//                                        .scaledToFill()
//                                )
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        })
                        .padding(.leading, 25)
                        
                        Spacer()
                    }
                }
            }
            .padding(.bottom, 25)
        }
        .background(.black)
        .onChange(of: cameraService.picData) {oldValue, newValue in
            if let uiImage = UIImage(data: newValue) {
                capturedImage = uiImage
            }
        }
        .onChange(of: capturedImage){
            photoPreview = capturedImage
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
    
    private func startCountdown() {
        countdown = 5
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if let countdown = countdown, countdown > 0 {
                self.countdown = countdown - 1
            } else {
                timer.invalidate()
                self.timer = nil
                self.countdown = nil
                triggerFlash()
                cameraService.capturePhoto()
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
