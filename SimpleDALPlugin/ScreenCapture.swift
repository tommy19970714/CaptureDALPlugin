//
//  ScreenCapture.swift
//
//  Created by kishikawakatsumi.
//  https://github.com/kishikawakatsumi/VirtualCameraComposer-Example/blob/master/Sources/CoreMediaIO%20DAL%20Plug-In/ScreenCapture.swift
//

import Cocoa
import AVFoundation

@objcMembers
class ScreenCapture: NSObject {
    private let session = AVCaptureSession()
    let output = AVCaptureVideoDataOutput()

    override init() {
        session.sessionPreset = .high

        if let input = AVCaptureScreenInput(displayID: CGMainDisplayID()) {
            if session.canAddInput(input) {
                session.addInput(input)
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
            }
        }
    }

    func startRunning() {
        session.startRunning()
    }

    func stopRunning() {
        session.stopRunning()
    }
}
