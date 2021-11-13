//
//  MorseCodeFlasher.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 10/28/21.
//

import UIKit
import AVFoundation

var chap6Timer = false

class MorseCodeFlasher: UIViewController {
    
    @IBOutlet weak var targetText: UITextView!
    @IBOutlet weak var vibrateSwitch: UISwitch!
    @IBOutlet weak var flashSwitch: UISwitch!
    @IBOutlet weak var convertedText: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var vibrateOn = true
    var flashOn = true
    
    let short: Double = 0.2
    let long: Double = 0.7
    
    var sequenceOfFlashes: [Double] = []
    var actionArray: [String] = []
    var vibrateShouldStop = false
    
    var morseString = ""
    
    var index: Int = 0
    
    weak var timer: Timer?
    
    var motherCount:Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Morse Code Flasher"
        targetText.backgroundColor = .secondarySystemBackground
        targetText.layer.masksToBounds = true
        targetText.layer.cornerRadius = 10
        
        vibrateOn = vibrateSwitch.isOn
        flashOn = flashSwitch.isOn
        stopButton.isEnabled = false
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        targetText.inputAccessoryView = toolBar
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gesture:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
    }
    
    @objc func doneClicked() {
        setMorseText()
        view.endEditing(true)
    }
    
    @objc func viewTapped(gesture: UIGestureRecognizer) {
        setMorseText()
        view.endEditing(true)
    }
    
    func setupMorseFlashesSequence() {
        var translatedArray = morseString.stringToMorse()
        
        translatedArray.append("   ")
        
        for i in translatedArray {
            switch i {
            case "·":
                sequenceOfFlashes.append(short)
                sequenceOfFlashes.append(short)
                actionArray.append("·")
                actionArray.append("/")
                motherCount += 1
            case "-":
                sequenceOfFlashes.append(long)
                sequenceOfFlashes.append(short)
                actionArray.append("-")
                actionArray.append("/")
                motherCount += 1
            case " ":
                sequenceOfFlashes.append(long)
                actionArray.append(" ")
            default:
                break
            }
        }
        
        if !chap6Timer {
            chap6Timer = true
            scheduleTimer()
        }
    }
    
    @objc func scheduleTimer() {
        if index == 1000 || !chap6Timer {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: sequenceOfFlashes[index], target: self, selector: #selector(timerTick), userInfo: nil, repeats: false)
    }
    
    @objc func timerTick() {
        if index == 1000 || !chap6Timer {
            return
        }
        if index == sequenceOfFlashes.count {
            chap6Timer = false
            manualStop()
            return
        }
        else {
            let act = actionArray[index]
            if act == " " {
                turnFlashlight(on: false)
            }
            else if act == "/" {
                turnFlashlight(on: false)
            }
            else if act == "-" {
                turnFlashlight(on: true)
                impactInside()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35, execute: {
                    self.vibrateShouldStop = true
                })
            }
            else if act == "·" {
                turnFlashlight(on: true)
                impactInside()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
                    self.vibrateShouldStop = true
                })
            }
            scheduleTimer()
        }
        index += 1
    }
    
    func impactInside() {
        if vibrateShouldStop {
            vibrateShouldStop = false
            return
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                if self.vibrateOn {
                    impact(style: .medium)
                }
                self.impactInside()
            })
        }
    }
    
    func checkArrayFilled() {
        if sequenceOfFlashes.count == 0 {
            sequenceOfFlashes.removeAll()
            actionArray.removeAll()
            setupMorseFlashesSequence()
        }
    }
    
    func turnFlashlight(on: Bool) {
        
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else {
            print("Torch isn't available")
            return
        }
        
        if !flashOn {
            do {
                try device.lockForConfiguration()
                device.torchMode = .off
                device.unlockForConfiguration()
            } catch {
                print("Oh No!")
            }
            return
        }
        
        do {
            try device.lockForConfiguration()
            
            if on {
                device.torchMode = .on
                try device.setTorchModeOn(level: 0.5)
            }
            else {
                device.torchMode = .off
            }
            
            device.unlockForConfiguration()
        } catch {
            print("Torch can't be used")
        }
        
    }
    
    
    func setMorseText() {
        morseString = targetText.text ?? ""
        convertedText.text = morseString.stringToMorse()
    }
    
    func manualStop() {
        timer?.invalidate()
        chap6Timer = false
        turnFlashlight(on: false)
        index = 1000
        startButton.isEnabled = true
        stopButton.isEnabled = false
    }
    
    @IBAction func start(_ sender: Any) {
        setMorseText()
        sequenceOfFlashes.removeAll()
        actionArray.removeAll()
        index = 0
        motherCount = 0
        vibrateShouldStop = false
        chap6Timer = false
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        self.setupMorseFlashesSequence()
    }
    
    @IBAction func stop(_ sender: Any) {
        manualStop()
    }
    
    @IBAction func vibrateSwitchActive(_ sender: Any) {
        vibrateOn = vibrateSwitch.isOn
    }
    
    @IBAction func flashSwitchActive(_ sender: Any) {
        flashOn = flashSwitch.isOn
    }
    
}
