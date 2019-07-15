//
//  MYsFilesReader.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 1/6/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import AVFoundation


open class MYsFilesManager : NSObject{
    var tempPlayer = AVAudioPlayer()
    
    static public func isExist(fileName:String)->Bool{
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(fileName) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
                return true
            } else {
                print("FILE NOT AVAILABLE")
                return false
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
            return false
        }
    }
    
    static public func getFileWith(name:String)->String?{
            //manager lets you examine contents of a files and folders in your app.
            let manager = FileManager.default
            
            //returns an array of urls from our documentDirectory and we take the first
            let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
            //print("this is the url path in the document directory \(String(describing: url))")
            
            //creates a new path component and creates a new file called "Data" where we store our data array
            return (url!.appendingPathComponent(name).path)
    }
    
    static public func getAllFiles()->[URL]{
            //manager lets you examine contents of a files and folders in your app.
            let manager = FileManager.default
            
            //returns an array of urls from our documentDirectory and we take the first
            let url = manager.urls(for: .documentDirectory, in: .userDomainMask)
            //print("this is the url path in the document directory \(String(describing: url))")
            
            //creates a new path component and creates a new file called "Data" where we store our data array
            return url
    }
    
    static public func getContentFile(fileName: String, extensionFile: String) -> [String:Any]?{
        if let fileUrl = Bundle.main.url(forResource: fileName, withExtension: extensionFile),
            let data = try? Data(contentsOf: fileUrl) {
            
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return [String:Any]()
    }
    
    static public func saveFile(data: Data,name:String,extensionFile:String) -> Bool {
        let fileName = "\(name).\(extensionFile)"
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent(fileName)!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    static public func saveImage(image: UIImage,fineName:String) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent(fineName)!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    static public func deleteAllFilesInDocument(){
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentPath = documentsURL.path
        
        do {
            let files = try fileManager.contentsOfDirectory(atPath: "\(documentPath)")
            for file in files {
//                file.getFileName()
                try fileManager.removeItem(atPath: "\(documentPath)/\(file)")
            }
        } catch {
            print("could not clear cache")
        }
    }
    
    static public func deleteFile(fileName:String){
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentPath = documentsURL.path
        
        do {
            let files = try fileManager.contentsOfDirectory(atPath: "\(documentPath)")
            for file in files {
                if file.getFileName() == fileName {
                    try fileManager.removeItem(atPath: "\(documentPath)/\(file)")
                }
            }
        } catch {
            print("could not clear cache")
        }
    }
    
    static public func getImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    static public func openFileInWebView(fileName : String,fileExtension:String){
        let webview = UIWebView(frame: UIScreen.main.bounds)
        let urlpath = Bundle.main.path(forResource: fileName, ofType: fileExtension);
        let requesturl = URL(string: urlpath!)
        let request = URLRequest(url: requesturl!)
        webview.loadRequest(request)
//            .mainFrame.load()
//        let url: URL! = URL(string: address)
//        webView.loadRequest(URLRequest(url: url))
    }
    
    public func playSound(player: AVAudioPlayer,fileName:String,isPlay:Bool,loopCount:Int) {
        tempPlayer = player
        //        print(sender.tag) // testing button pressed tag
        
        let path = Bundle.main.path(forResource: fileName, ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
        
        do {
            tempPlayer = try AVAudioPlayer(contentsOf: url)
            tempPlayer.numberOfLoops = loopCount
            if !isPlay {
                tempPlayer.stop()
            }else{
                tempPlayer.play()
            }
        } catch {
            print ("There is an issue with this code!")
        }
    }

 
    
    func makeFolder(folderName:String)->URL
    {
        var paths: [Any] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory: String = paths[0] as? String ?? ""
        let dataPath: String = URL(fileURLWithPath: documentsDirectory).appendingPathComponent(folderName).absoluteString
        if !FileManager.default.fileExists(atPath: dataPath) {
            try? FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: false, attributes: nil)
        }
        let fileURL = URL(string: dataPath)
        return fileURL!
    }
}
