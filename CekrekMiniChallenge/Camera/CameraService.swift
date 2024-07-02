//
//  CameraService.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 01/07/24.
//

import SwiftUI
import AVFoundation
import Photos

class CameraService: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    var session: AVCaptureSession = AVCaptureSession()
    var output = AVCapturePhotoOutput()
    var preview = AVCaptureVideoPreviewLayer()

    @Published var picData: Data = Data()

    override init() {
        super.init()
        checkPermissions()
    }

    func checkPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.setupCamera()
                }
            }
        case .restricted, .denied:
            // Handle restricted or denied status
            break
        case .authorized:
            setupCamera()
        @unknown default:
            break
        }
    }

    private func setupCamera() {
        session.beginConfiguration()

        // Set the session preset to 4:3 aspect ratio
        if session.canSetSessionPreset(.photo) {
            session.sessionPreset = .photo
        }

        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                preview.videoGravity = .resizeAspectFill
                preview.session = session
            } catch {
                print(error.localizedDescription)
            }
        }
        session.commitConfiguration()
    }

    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()) {
        output.capturePhoto(with: settings, delegate: self)
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        }

        guard let imgData = photo.fileDataRepresentation() else { return }
        self.picData = imgData
        saveImage()
    }

    func saveImage() {
        guard let image = UIImage(data: self.picData) else { return }
        // Adjust the image orientation if needed
        let fixedImage = image.fixedOrientation()
        UIImageWriteToSavedPhotosAlbum(fixedImage, nil, nil, nil)
    }

    func focus(at point: CGPoint) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        do {
            try device.lockForConfiguration()

            if device.isFocusPointOfInterestSupported {
                device.focusPointOfInterest = point
                device.focusMode = .autoFocus
            }

            if device.isExposurePointOfInterestSupported {
                device.exposurePointOfInterest = point
                device.exposureMode = .autoExpose
            }

            device.unlockForConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// Extension to fix image orientation
extension UIImage {
    func fixedOrientation() -> UIImage {
        if imageOrientation == .up {
            return self
        }

        var transform = CGAffineTransform.identity

        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -.pi / 2)
        case .up, .upMirrored:
            break
        @unknown default:
            break
        }

        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .up, .down, .left, .right:
            break
        @unknown default:
            break
        }

        guard let cgImage = cgImage else { return self }

        guard let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0, space: cgImage.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: cgImage.bitmapInfo.rawValue) else { return self }

        context.concatenate(transform)
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }

        guard let newCGImage = context.makeImage() else { return self }

        return UIImage(cgImage: newCGImage)
    }
}




//class CameraService  {
//    
//    var session : AVCaptureSession?
//    var delegate : AVCapturePhotoCaptureDelegate?
//    
//    let output = AVCapturePhotoOutput()
//    let previewLayer = AVCaptureVideoPreviewLayer()
//    
//    func start(delegate : AVCapturePhotoCaptureDelegate, completion : @escaping (Error?) -> ()){
//        self.delegate = delegate
//        checkPermissions(completion: completion)
//    }
//    
//    private func checkPermissions(completion : @escaping (Error) -> ()){
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//        case .notDetermined:
//            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
//                guard granted else {return}
//                DispatchQueue.main.async{
//                    self?.setupCamera(completion: completion)
//                }
//            }
//        case .restricted:
//            break
//        case .denied:
//            break
//        case .authorized:
//            setupCamera(completion: completion)
//        @unknown default:
//            break
//        }
//    }
//    
//    private func setupCamera(completion : @escaping (Error) -> ()){
//        let session = AVCaptureSession()
//        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front){
//            do{
//                let input = try AVCaptureDeviceInput(device: device)
//                
//                if session.canAddInput(input){
//                    session.addInput(input)
//                }
//                
//                if session.canAddOutput(output){
//                    session.addOutput(output)
//                }
//                
////                session.sessionPreset = .hd1920x1080
//                
//                previewLayer.videoGravity = .resizeAspectFill
//                previewLayer.session = session
//                DispatchQueue.main.async{
//                    session.startRunning()
//                }
//                self.session = session
//            }catch {
//                completion(error)
//            }
//        }
//    }
//    
//    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()){
//        if let delegate = self.delegate {
//            output.capturePhoto(with: settings, delegate: delegate)
//        }
//        
//    }
//    
//}


//class CameraService: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate  {
//    
//    var session : AVCaptureSession = AVCaptureSession()
//    
//    var output = AVCapturePhotoOutput()
//    var preview = AVCaptureVideoPreviewLayer()
//    
////    isSaved = false
//    @Published var picData : Data = Data()
//    
//    func checkPermissions(){
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//        case .notDetermined:
//            AVCaptureDevice.requestAccess(for: .video) { (status) in
//                if status {
//                    self.setupCamera()
//                }
//            }
//        case .restricted:
//            break
//        case .denied:
//            break
//        case .authorized:
//            setupCamera()
//            break
//        default:
//            break
//        }
//    }
//    
//    private func setupCamera(){
////        let session = AVCaptureSession()
//        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front){
//            do{
//                let input = try AVCaptureDeviceInput(device: device)
//                
//                if session.canAddInput(input){
//                    session.addInput(input)
//                }
//                
//                if session.canAddOutput(output){
//                    session.addOutput(output)
//                }
//                
////                session.sessionPreset = .hd1920x1080
//                
//                preview.videoGravity = .resizeAspectFill
//                preview.session = session
//                
////                session.startRunning()
////                self.session = session
//            }catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()){
//        output.capturePhoto(with: settings, delegate: self)
//    }
//    
//    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
//        if error != nil {
//            return
//        }
//        
//        print("pic taken")
//        
//        guard let imgData = photo.fileDataRepresentation() else {return}
//        self.picData = imgData
//    }
//    
//    func saveImage(){
//        guard let image = UIImage(data: self.picData) else {return}
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil )
//    }
//    
//}