//
//  speechModule.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 11/13/21.
//

import Foundation
import UIKit
import Speech

class SpeechModule:NSObject {
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    var stop = false
    var targetWord:[String]?
    var cache:String = ""
    var senderVC:UIViewController?
    
    var cooldown = false
    
    override init() {
        super.init()
    }
    
    func startRecording(target: [String], sender: UIViewController) {
        print("Speech Recognition Started")
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        targetWord = target
        senderVC = sender
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { [self] (result, error) in
            
            var isFinal = false
            
            //HANDLE SPEECH RESULT HERE
            if result != nil {
                let spokenContent = result?.bestTranscription.formattedString.lowercased()
                let spokenArray = spokenContent?.split(separator: " ")
                var cacheArray = cache.split(separator: " ")
                cacheArray = cacheArray.isEmpty ? [""] : cacheArray
                
                var relevantSpeech = ""
                if cacheArray.count > spokenArray?.count ?? 0 {
                    cache = spokenContent ?? ""
                } else {
                    relevantSpeech = spokenArray?[(cacheArray.count-1)...].joined(separator: " ") ?? ""
                }
                
                for words in target {
                    let volumeControlArray = ["up", "app", "down", "town"]
                    var lastWord = ""
                    if let split = relevantSpeech.split(separator: " ").last {
                        lastWord = String(split)
                    }
                    if volumeControlArray.contains(lastWord) {
                        if let vc = sender as? SpeechViewController {
                            if !cooldown {
                                cache = spokenContent ?? ""
                                cooldown = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                                    cooldown = false
                                })
                                switch lastWord {
                                case "up", "app":
                                    vc.volumeUp()
                                    break
                                case "down", "town":
                                    vc.volumeDown()
                                    break
                                default:
                                    break
                                }
                            }
                        }
                    } else if relevantSpeech.contains(words) == true {
                        
                        if let vc = sender as? SpeechViewController {
                            if !cooldown {
                                cache = spokenContent ?? ""
                                cooldown = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                    cooldown = false
                                })
                                vc.bleep()
                            }
                        }
                    }
                    isFinal = (result?.isFinal)!
                }
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 1)
                self.recognitionRequest = nil
                self.recognitionTask = nil
                cache = ""
                print("Speech Recognition Stopped")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: { [self] in
                    if !self.isActive() && !stop {
                        print("Speech Recognition Activated again")
                        startRecording(target: targetWord!, sender: senderVC!)
                    }
                })
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 1)
        
        inputNode.installTap(onBus: 1, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
    }
    
    func stopRecording() {
        pause()
        print("audioEngine stopped")
    }
    
    func pause() {
        print("talk pause")
        audioEngine.inputNode.removeTap(onBus: 1)
        recognitionRequest?.endAudio()
        self.recognitionRequest = nil
        recognitionTask?.cancel()
        recognitionTask = nil
        audioEngine.stop()
    }
    
    func play() {
        print("talk play")
        startRecording(target: targetWord!, sender: senderVC!)
    }
    
    func isActive() -> Bool {
        return audioEngine.isRunning
    }
    
    
    deinit {
        stopRecording()
    }
    
    
    
}
