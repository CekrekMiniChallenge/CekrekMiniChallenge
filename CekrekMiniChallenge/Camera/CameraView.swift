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
