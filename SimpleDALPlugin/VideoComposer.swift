//
//  VideoComposer.swift
//  SimpleDALPlugin
//
//  Created by kishikawakatsumi.
//  https://github.com/kishikawakatsumi/VirtualCameraComposer-Example/blob/master/Sources/CoreMediaIO%20DAL%20Plug-In/VideoComposer.swift
//

import Cocoa
import AVFoundation

@objcMembers
class VideoComposer: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    //private let screenCapture = ScreenCapture()
    private let cameraCapture = CameraCapture()

    private let context = CIContext()
    var lastScreenImageBuffer: CVImageBuffer?

    weak var delegate: VideoComposerDelegate?

    private let session = URLSession(configuration: .default)
    private var settings = [String: Any]()

    deinit {
        stopRunning()
    }

    func startRunning() {
//        screenCapture.output.setSampleBufferDelegate(self, queue: .main)
        cameraCapture.output.setSampleBufferDelegate(self, queue: .main)
        
//        screenCapture.startRunning()
        cameraCapture.startRunning()

    }

    func stopRunning() {
//        screenCapture.stopRunning()
        cameraCapture.stopRunning()
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        NSLog("■ CMIOMS: captureOutput called.")

        if output == self.cameraCapture.output {

            guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            let compositedImage = CIImage(cvImageBuffer: imageBuffer)

            var pixelBuffer: CVPixelBuffer?
            let options: [String: Any] = [
                kCVPixelBufferCGImageCompatibilityKey as String: true,
                kCVPixelBufferCGBitmapContextCompatibilityKey as String: true,
                kCVPixelBufferIOSurfacePropertiesKey as String: [:]
            ]

            _ = CVPixelBufferCreate(
                kCFAllocatorDefault,
                Int(compositedImage.extent.size.width),
                Int(compositedImage.extent.height),
                kCVPixelFormatType_32BGRA,
                options as CFDictionary,
                &pixelBuffer
            )

            if let pixelBuffer = pixelBuffer {
                context.render(compositedImage, to: pixelBuffer)
                delegate?.videoComposer(self, didComposeImageBuffer: pixelBuffer)
            }
        }
    }
}

@objc
protocol VideoComposerDelegate: class {
    func videoComposer(_ composer: VideoComposer, didComposeImageBuffer imageBuffer: CVImageBuffer)
}
