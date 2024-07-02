//
//  CameraCaptureView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 01/07/24.
//

import SwiftUI
import Photos

//struct CameraCaptureView: View {
////    @Binding var capturedImage : UIImage?
//    @State private var capturedImage : UIImage? = nil
//    @State private var photoPreview : UIImage? = nil
//    var body: some View {
//        ZStack{
//            CustomCameraView(capturedImage: $capturedImage, photoPreview: $photoPreview)
//            
////            if photoPreview != nil {
////                Image(uiImage: photoPreview!)
////                    .resizable()
////                    .scaledToFit()
////            }else{
////                
////            }
//            
//            
//        }
//        .onChange(of: capturedImage){
//            requestAuthorizationAndFetchPhotos()
//        }
//        .onAppear(perform: {
//            requestAuthorizationAndFetchPhotos()
//        })
//    }
//    
//    func fetchPhotos(){
//        let imgManager = PHImageManager.default()
//        let requestOptions = PHImageRequestOptions()
//        requestOptions.isSynchronous = true
//        requestOptions.deliveryMode = .highQualityFormat
//        
//        let fetchOptions = PHFetchOptions()
//        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        
//        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
//        
//        if fetchResult.count > 0 {
//            imgManager.requestImage(
//                for: fetchResult.object(at: 0), targetSize: CGSize(width: 100, height: 200),
//                contentMode: .aspectFit,
//                options: requestOptions) { (image, _) in
//                
//                if let image = image {
////                    let photo = Photo(photo: Image(uiImage: image))
//                    photoPreview = image
//                }
//            }
//        } else {
//            DispatchQueue.main.async {
//            }
//        }
//    }
//    
//    func requestAuthorizationAndFetchPhotos(){
//        PHPhotoLibrary.requestAuthorization { status in
//            switch status {
//            case .authorized:
//                DispatchQueue.main.async{
//                    fetchPhotos()
//                }
//            default:
//                break
//            }
//        }
//    }
//    
//}
//

struct CameraCaptureView: View {
//    @Binding var capturedImage : UIImage?
    @StateObject var cameraService = CameraService()
    @State var capturedImage : UIImage? = nil
    @State var photoPreview : UIImage? = nil
    
    var body: some View {
        ZStack{
            CameraView(camera: cameraService)
                .offset(y: -50)
//                .padding(.top, 30)
                .ignoresSafeArea()
                
            
            ZStack {
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
                            cameraService.capturePhoto()
                        },label: {
                            if let capturedImage = capturedImage {
                                Rectangle()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .mask(
                                        Image(uiImage: capturedImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
                                            .padding()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    )
                            }else{
                                Rectangle()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        })
                        .padding(.leading, 25)
                        
                        Spacer()
                    }
                }
            }
            .padding(.bottom, 25)
        }
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
//                    let photo = Photo(photo: Image(uiImage: image))
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
    
}
#Preview {
    CameraCaptureView()
}
