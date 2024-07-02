//
//  CustomCameraView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 01/07/24.
//

import SwiftUI

struct CustomCameraView : View {
        @StateObject var cameraService = CameraService()
        @Binding var capturedImage: UIImage?

        var body: some View {
            ZStack {
                CameraView(camera: cameraService)
                    .edgesIgnoringSafeArea(.all)
                    .onChange(of: cameraService.picData) {oldValue, newValue in
                        if let uiImage = UIImage(data: newValue) {
                            capturedImage = uiImage
                        }
                    }

                VStack {
                    Spacer()
                    Button(action: {
                        cameraService.capturePhoto()
                    }) {
                        Text("Capture")
                            .font(.title)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                    }

                    if let capturedImage = capturedImage {
                        Image(uiImage: capturedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
                    }
                }
            }
        }
//
//    @ObservedObject var cameraService = CameraService()
//    
//    let imageSaver = ImageSaver()
//    @Binding var capturedImage: UIImage?
//    @Binding var photoPreview: UIImage?
//    
//    var currentImage : Data?
//    
//    @Environment(\.presentationMode) private var presentationMode
//    
//    var body: some View {
//        ZStack{
//            
////            CameraView(cameraService: cameraService) { result in
////                switch result {
////                case .success(let success):
////                    if let data = success.fileDataRepresentation() {
////                        capturedImage = UIImage(data: data)
////                        imageSaver.writeToPhotoAlbum(image: capturedImage!)
//////                        guard let inputImage = selectedImage else {return}
////
////                        presentationMode.wrappedValue.dismiss()
////                    }else{
////                        print("error: no image data found")
////                    }
////                case .failure(let failure):
////                    print(failure.localizedDescription)
////                }
////            }
//            CameraView(camera: cameraService)
//            
//            VStack{
//                Color(.white)
//                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                    .background(.white)
//                    .opacity(0.5)
//                Spacer()
//                Color(.white)
//                    .frame(height: 150)
//                    .background(.white)
//                    .opacity(0.5)
//            }
//            
//            ZStack {
//                VStack{
//                    Spacer()
//                        
//                    ZStack{
//                        HStack{
//                            Button(action: {
////                                cameraService.capturePhoto()
//                            }, label: {
//                                if photoPreview != nil{
//                                    Image(uiImage: photoPreview!)
//                                        .resizable()
//                                        .frame(width: 60, height: 60)
//                                }else{
//                                    Image(systemName: "photo")
//                                        .font(.system(size: 72))
//                                        .foregroundColor(.black)
//                                }
//                            })
//                            .padding(.leading, 20)
//                            Spacer()
//                        }
//                        
//                        Button(action: {
//                            cameraService.capturePhoto()
//                        }, label: {
//                            Image(systemName: "circle")
//                                .font(.system(size: 72))
//                                .foregroundColor(.black)
//                        })
//                        
////                        HStack{
////                            Spacer()
////                            Button(action: {
//////                                cameraService.capturePhoto()
////                            }, label: {
////                                Image(systemName: "circle")
////                                    .font(.system(size: 72))
////                                    .foregroundColor(.black)
////                            })
////                            .padding(.trailing, 20)
////                        }
//                    }
//                    .padding(.bottom, 50)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .onChange(of: cameraService.picData){
//            capturedImage = UIImage(data: cameraService.picData)
//        }
//    }
}

#Preview {
    CustomCameraView(capturedImage: .constant(UIImage()))
}

//import SwiftUI
//
//struct ContentView: View {
//    @StateObject var cameraService = CameraService()
//
//    var body: some View {
//        ZStack {
//            CameraView(camera: cameraService)
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Spacer()
//                Button(action: {
//                    cameraService.capturePhoto()
//                }) {
//                    Text("Capture")
//                        .font(.title)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .padding(.bottom, 20)
//                }
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
