//
//  speechViewController.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 11/13/21.
//

import UIKit
import Speech
import AVFoundation
import MediaPlayer

class SpeechViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    var talk:SpeechModule?
    
    /*
     Requires info.plist permission!!!
     Privacy - Microphone Usage Description
     Privacy - Speech Recognition Usage Description
     */
    
    private var audioLevel : Float = 0.0
    var volumeView = UIView()
    
    var textStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "WTF Bleeper"
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        talk = SpeechModule()
        startSpeech(targetWord: ["what the", "what de", "water", "wonder"])
        
        do {
            try AVAudioSession.sharedInstance().setAllowHapticsAndSystemSoundsDuringRecording(true)
        } catch let error {
            print("error \(error)")
        }
        
        listenVolumeButton()
        
        textStack = UIStackView()
        textStack.spacing = 10
        textStack.axis = .vertical
        textStack.distribution = .fillProportionally
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Say \"What the\" and you will automatically be bleeped out.\n\nIf you say the words \"Up\" or \"Down\", it will change the volume accordingly."
        label.font = label.font.withSize(25)
        
        
        let volLbl = UILabel()
        volLbl.numberOfLines = 0
        volLbl.tag = 1
        volLbl.text = "It seems that your volume level is a bit low, and you won't be able to hear the module's functionality. You can say \"Up\" to turn up the volume."
        
        
        textStack.addArrangedSubview(label)
        if audioLevel < 0.1 {
            textStack.addArrangedSubview(volLbl)
        }
        
        let verticalPadding: CGFloat = 50
        let horizontalPadding: CGFloat = 20
        textStack.frame = CGRect(x: view.frame.origin.x + horizontalPadding, y: view.frame.origin.y + verticalPadding, width: view.frame.width - (2 * horizontalPadding), height: view.frame.height - (2 * verticalPadding))
        
        
        volumeView.backgroundColor = .gray
        volumeView.alpha = 0.5
        view.addSubview(volumeView)
        volumeView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - (view.frame.size.height * CGFloat(audioLevel)), width: view.frame.width, height: UIScreen.main.bounds.height)
        
        view.addSubview(textStack)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        talk?.stop = true
        talk?.stopRecording()
        
        AVAudioSession.sharedInstance().removeObserver(self, forKeyPath: "outputVolume")
    }
    
    func bleep() {
        playSound(name: "Bleep", type: "mp3")
    }
    
    func volumeUp() {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: { [self] in
            if audioLevel < 1.0 {
                slider?.value = audioLevel + 0.0625
            }
        })
    }
    
    func volumeDown() {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: { [self] in
            if audioLevel > 0 {
                slider?.value = audioLevel - 0.0625
            }
        })
    }
    
    @objc func startSpeech(targetWord: [String]) {
        if !(talk?.isActive())! {
            talk?.stop = false
            talk?.startRecording(target: targetWord, sender: self)
        }
    }
    
    func listenVolumeButton() {
        let audioSession = AVAudioSession.sharedInstance()
        audioSession.addObserver(self, forKeyPath: "outputVolume", options: NSKeyValueObservingOptions.new, context: nil)
        audioLevel = audioSession.outputVolume
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume"{
            let audioSession = AVAudioSession.sharedInstance()
            
            audioLevel = audioSession.outputVolume
            if audioLevel < 0.20 {
                impact(style: .soft)
            } else if audioLevel < 0.4 {
                impact(style: .light)
            } else if audioLevel < 0.6 {
                impact(style: .medium)
            } else if audioLevel < 0.8 {
                impact(style: .heavy)
            } else {
                impact(style: .rigid)
            }
            
            let volLbl = UILabel()
            volLbl.numberOfLines = 0
            volLbl.tag = 1
            volLbl.text = "It seems that your volume level is a bit low, and you won't be able to hear the module's functionality. You can say \"Up\" to turn up the volume."
            let labels = textStack.labelSniffer()
            
            if audioLevel < 0.1 {
                if labels.count == 1 {
                    textStack.addArrangedSubview(volLbl)
                }
            } else {
                for i in labels {
                    if i.tag == 1 {
                        i.removeFromSuperview()
                    }
                }
            }
            
            volumeView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - (view.frame.size.height * CGFloat(audioLevel)), width: view.frame.width, height: UIScreen.main.bounds.height)
        }
    }
}

