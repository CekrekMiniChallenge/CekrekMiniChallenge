//
//  CameraService.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 01/07/24.
//
//
//struct ContentView: View {
//    @ObservedObject var camera = CameraService()
//    @State private var isTorchOn: Bool = false
//    @State private var delayInSeconds: Int = 5
//
//    var body: some View {
//        VStack {
//            CameraView(camera: camera, isTorchOn: $isTorchOn)
//                .frame(height: UIScreen.main.bounds.width * 4 / 3)
//                .clipped()
//            
//            HStack {
//                Button(action: {
//                    camera.capturePhotoAfterDelay(seconds: 5)
//                }) {
//                    Text("Capture in 5s")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                
//                Button(action: {
//                    camera.capturePhotoAfterDelay(seconds: 10)
//                }) {
//                    Text("Capture in 10s")
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//        }
//        .onAppear {
//            camera.checkPermissions()
//        }
//    }
//}
//
//struct CameraView: UIViewRepresentable {
//    var camera: CameraService
//    @Binding var isTorchOn: Bool
//
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView(frame: UIScreen.main.bounds)
//        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
//
//        let screenWidth = UIScreen.main.bounds.width
//        let aspectRatio: CGFloat = 3.0 / 4.0
//        let viewHeight = screenWidth / aspectRatio
//
//        camera.preview.frame = CGRect(x: 0, y: (UIScreen.main.bounds.height - viewHeight) / 2, width: screenWidth, height: viewHeight)
//        camera.preview.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(camera.preview)
//        
//        DispatchQueue.global(qos: .background).async {
//            camera.session.startRunning()
//        }
//        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
//        view.addGestureRecognizer(tapGestureRecognizer)
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//    class Coordinator: NSObject {
//        var parent: CameraView
//
//        init(_ parent: CameraView) {
//            self.parent = parent
//        }
//
//        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
//            let location = gesture.location(in: gesture.view)
//            let focusPoint = CGPoint(x: location.x / gesture.view!.bounds.size.width, y: location.y / gesture.view!.bounds.size.height)
//            parent.camera.focus(at: focusPoint)
//        }
//    }
//}
//
//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
