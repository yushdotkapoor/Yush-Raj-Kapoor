//
//  ColorPicker.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/28/21.
//

import AVFoundation
import UIKit

class ColorPicker:UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let WIDTH = UIScreen.main.bounds.width
    let HEIGHT = UIScreen.main.bounds.height
    var center: CGPoint = CGPoint(x: UIScreen.main.bounds.width/2-15, y: UIScreen.main.bounds.width/2-15)
    
    var captureSession = AVCaptureSession()
    var backFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    
    let previewLayer = CALayer()
    let lineShape = CAShapeLayer()
    let topLayer = UIView()
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Camera Color Picker"
    }
    
    func setupUI() {
        previewLayer.bounds = CGRect(x: 0, y: 0, width: WIDTH-30, height: WIDTH-30)
        previewLayer.position = view.center
        previewLayer.contentsGravity = CALayerContentsGravity.resizeAspectFill
        previewLayer.masksToBounds = true
        previewLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(.pi / 2.0)))
        view.layer.insertSublayer(previewLayer, at: 0)
        
        
        let linePath = UIBezierPath.init(ovalIn: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        lineShape.frame = CGRect.init(x: WIDTH/2-20, y:HEIGHT/2-20, width: 40, height: 40)
        lineShape.lineWidth = 5
        lineShape.strokeColor = UIColor.red.cgColor
        lineShape.path = linePath.cgPath
        lineShape.fillColor = UIColor.clear.cgColor
        self.view.layer.insertSublayer(lineShape, at: 1)
        
        
        topLayer.frame = view.frame
        topLayer.backgroundColor = .systemBackground
        view.addSubview(topLayer)
        view.bringSubviewToFront(topLayer)
        
        view.bringSubviewToFront(label)
        
    }
    
    
    func CreateUI() {
        self.captureSession.sessionPreset = AVCaptureSession.Preset.hd1280x720
        
        let devices = AVCaptureDevice.devices(for: AVMediaType.video)
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                self.backFacingCamera = device
            }
        }
        
        
        self.currentDevice = self.backFacingCamera
        do {
            
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentDevice!)
            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.videoSettings = ([kCVPixelBufferPixelFormatTypeKey as AnyHashable: NSNumber(value: kCMPixelFormat_32BGRA)] as! [String : Any])
            videoOutput.alwaysDiscardsLateVideoFrames = true
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "com.camera.video.queue"))
            
            if self.captureSession.canAddOutput(videoOutput) {
                self.captureSession.addOutput(videoOutput)
            }
            self.captureSession.addInput(captureDeviceInput)
        } catch {
            print(error)
            return
        }
        self.captureSession.startRunning()
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        CVPixelBufferLockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: CVOptionFlags(0)))
        guard let baseAddr = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0) else {
            return
        }
        let width = CVPixelBufferGetWidthOfPlane(imageBuffer, 0)
        let height = CVPixelBufferGetHeightOfPlane(imageBuffer, 0)
        let bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(imageBuffer, 0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bimapInfo: CGBitmapInfo = [
            .byteOrder32Little,
            CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)]
        
        guard let content = CGContext(data: baseAddr, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bimapInfo.rawValue) else {
            return
        }
        
        guard let cgImage = content.makeImage() else {
            return
        }
        
        DispatchQueue.main.async {
            self.previewLayer.contents = cgImage
            let color = self.previewLayer.pickColor(at: self.center)
            self.topLayer.backgroundColor = color
            self.label.textColor = color?.inverted()
            let rgbColor = CIColor(color: color!)
            let red = round(rgbColor.red * 100 * 256) / 100
            let green = round(rgbColor.green * 100 * 256) / 100
            let blue = round(rgbColor.blue * 100 * 256) / 100

            let rgbString = "(r: \(red), g: \(green), b: \(blue))"
            let hexString = "\(color?.toHexString() ?? "")"
            self.label.text = "\(rgbString)\n\n\(hexString)"
            
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
        self.captureSession = AVCaptureSession()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        CreateUI()
    }
    
    
}
