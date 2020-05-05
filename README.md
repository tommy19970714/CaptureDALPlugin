# SimpleDALCameraPlugin
This repogitory was forked from SimpleDALPlugin created by seanchas116.
An another [repogitory](https://github.com/kishikawakatsumi/VirtualCameraComposer-Example) created by kishikawa suports for  camera and screen capture(AVCaptureDevice and AVCaptureScreenInput).
I merged two repositories. This repository supports for camera and is written in all swift.


The following is a readme of DALPlugin.

# SimpleDALPlugin

This is a simple CoreMediaIO DAL virtual camera plugin written in Swift.

Based on [johnboiles/coremediaio-dal-minimal-example](https://github.com/johnboiles/coremediaio-dal-minimal-example). (thanks a lot [@johnboiles](https://github.com/johnboiles) for deciphering [Apple's CoreMediaIO example](https://developer.apple.com/library/archive/samplecode/CoreMediaIO/Introduction/Intro.html)!)

![ezgif com-optimize](https://user-images.githubusercontent.com/1025246/80326334-5eb8b000-8873-11ea-8724-adfbed078851.gif)

## How to run

* Build SimpleDALPlugin in Xcode
* Copy SimpleDALPlugin.plugin into `/Library/CoreMediaIO/Plug-Ins/DAL`
* Open Webcam-using app and choose SimpleDALPlugin as camera input
  * [Cameo](https://github.com/lvsti/Cameo) is good for debugging!
