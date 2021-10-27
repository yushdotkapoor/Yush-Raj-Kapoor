//
//  global.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit
import AVKit

//for haptic feedback
func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
}

func impact(style: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(style)
}

//opens url
func goToLink(ur:String) {
    guard let url = URL(string: ur) else { return }
    UIApplication.shared.open(url)
}

//calls a phone number
func callPhoneNumber(number: String) {
    guard let url = URL(string: "telprompt://\(number)"),
          UIApplication.shared.canOpenURL(url) else {
              return
          }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
}

//formats a string array to a singular string as a bulleted list
func formatBullets(arr:[String]) -> String {
    var bulletArray = arr
    bulletArray.sort()
    var str = ""
    for (i, a) in bulletArray.enumerated() {
        var formatted = " • \(a)"
        if (i+1) != bulletArray.count {
            formatted += "\n"
        }
        str.append(formatted)
    }
    return str
}

//initializes label with many properties to save space
func initLabel(textLbl:String="", size:CGFloat=17, color:UIColor=UIColor.label, textAlignment:NSTextAlignment=NSTextAlignment.left) -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = textAlignment
    label.font = label.font.withSize(size)
    label.textColor = color
    label.text = textLbl
    return label
}

//initializes label with an array to form bullet point style text
func initLabel(textLbls:[String], size:CGFloat=17, color:UIColor=UIColor.label, textAlignment:NSTextAlignment=NSTextAlignment.left) -> UILabel {
    let text = formatBullets(arr: textLbls)
    return initLabel(textLbl: text, size: size, color: color, textAlignment: textAlignment)
}

//creates a Local URL for a file
func createLocalUrl(for filename: String, ofType: String) -> URL? {
    let fileManager = FileManager.default
    let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let url = cacheDirectory.appendingPathComponent("\(filename).\(ofType)")
    
    guard fileManager.fileExists(atPath: url.path) else {
        guard let video = NSDataAsset(name: filename)  else { return nil }
        fileManager.createFile(atPath: url.path, contents: video.data, attributes: nil)
        return url
    }
    
    return url
}

//gets thumbnail from a video
func getThumbnailFrom(path: URL) -> UIImage? {
    
    do {
        let asset = AVURLAsset(url: path , options: nil)
        let length = Float(CMTimeGetSeconds(asset.duration))
        let imgGenerator = AVAssetImageGenerator(asset: asset)
        imgGenerator.appliesPreferredTrackTransform = true
        let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: Int64(length)/2, timescale: 1), actualTime: nil)
        let thumbnail = UIImage(cgImage: cgImage)
        
        return thumbnail
        
    } catch let error {
        print("*** Error generating thumbnail: \(error.localizedDescription)")
        return nil
    }
    
}

//corrects spaces in URL path
func correctSpaces(str: String) -> String {
    return str.replacingOccurrences(of: " ", with: "_")
}


