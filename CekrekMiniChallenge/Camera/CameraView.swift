//
//  CameraView.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 01/07/24.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewRepresentable {
    var camera: CameraService

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)

        let screenWidth = UIScreen.main.bounds.width
        let aspectRatio: CGFloat = 3.0 / 4.0
        let viewHeight = screenWidth / aspectRatio

        camera.preview.frame = CGRect(x: 0, y: (UIScreen.main.bounds.height - viewHeight) / 2, width: screenWidth, height: viewHeight)
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        camera.session.startRunning()

        let tapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: CameraView

        init(_ parent: CameraView) {
            self.parent = parent
        }

        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            let location = gesture.location(in: gesture.view)
            let focusPoint = CGPoint(x: location.x / gesture.view!.bounds.size.width, y: location.y / gesture.view!.bounds.size.height)
            parent.camera.focus(at: focusPoint)
        }
    }
}




//struct CameraView: UIViewControllerRepresentable{
//    typealias UIViewControllerType = UIViewController
//    
//    let cameraService: CameraService
//    let didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
//    
//    func makeUIViewController(context: Context) -> UIViewController {
//        
//        cameraService.start(delegate: context.coordinator){ error in
//            if let error = error {
//                didFinishProcessingPhoto(.failure(error))
//                return
//            }
//        }
//
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = .black
//        viewController.view.layer.addSublayer(cameraService.previewLayer)
//        cameraService.previewLayer.frame = viewController.view.bounds
//        return viewController
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self, didFinishProcessingPhoto: didFinishProcessingPhoto)
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//    
//    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate {
//        let parent: CameraView
//        private var didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
//        
//        init(_ parent: CameraView, didFinishProcessingPhoto: @escaping (Result<AVCapturePhoto, Error>) -> ()){
//            self.parent = parent
//            self.didFinishProcessingPhoto = didFinishProcessingPhoto
//        }
//        
//        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
//            if let error = error {
//                didFinishProcessingPhoto(.failure(error))
//            }
//            didFinishProcessingPhoto(.success(photo))
//        }
//    }
//}

//struct CameraView: UIViewRepresentable {
//    var camera : CameraService
//    
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView(frame: UIScreen.main.bounds)
//        
//        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
//        camera.preview.frame = view.frame
//        
//        camera.preview.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(camera.preview)
//        
//        camera.session.startRunning()
//         
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        
//    }
//    
//}
