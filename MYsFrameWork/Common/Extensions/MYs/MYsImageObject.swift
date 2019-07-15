//
//  MYsImageObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsImageObject: NSObject {
    
}

public enum ImageFormat {
    case PNG
    case JPEG(CGFloat)
}


public extension UIImage{
    
    func base64(format: ImageFormat) -> String {
        var imageData: Data
        switch format {
        case .PNG: imageData = self.pngData()!
        case .JPEG(let compression): imageData = self.jpegData(compressionQuality: compression)!
        }
        return imageData.base64EncodedString(options: .init(rawValue: 0))
    }
    
    func clipImageToCustomSize(size:CGSize)->UIImageView{
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        //        UIApplication.shared.isStatusBarHidden = false
        return imageView
    }
    
    func blur() -> UIImage {
        let radius: CGFloat = 20;
        let context = CIContext(options: nil);
        let inputImage = UIImage(cgImage: self.cgImage!)
        let filter = CIFilter(name: "CIGaussianBlur");
        filter?.setValue(inputImage, forKey: kCIInputImageKey);
        filter?.setValue("\(radius)", forKey:kCIInputRadiusKey);
        let result = filter?.value(forKey: kCIOutputImageKey) as! CIImage;
        let rect = CGRect(x: radius * 2, y: radius * 2, width: self.size.width - radius * 4, height: self.size.height - radius * 4)
        
        let cgImage = context.createCGImage(result, from: rect);
        let returnImage = UIImage(cgImage: cgImage!)
        
        return returnImage;
    }
    
    var pngRepresentationData: Data? {
        return self.pngData()
    }
    
    var jpegRepresentationData: Data? {
        return self.jpegData(compressionQuality: 1)
    }
    
    var toData :Data? {
        if let data = self.pngRepresentationData {
            return data
        } else if let data = self.jpegRepresentationData {
            return data
        }
        return nil
    }
    
    var toString64 : String{
        let imageData:NSData? = self.pngData() as NSData?
        return "data:image/png;base64," + (imageData?.base64EncodedString(options: .lineLength64Characters))!
    }
    
    
      func imageResize (sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }
    
    
    
    
}

//
//class ImageLoad {
//    static func loadImageFromUrl(url: String, nout imgdata: inout String){
//        // Create Url from string
//        let url = NSURL(string: url)!
//
//        // Download task:
//        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
//            // if responseData is not null...
//            if let data = responseData{
//
//                // execute in UI thread
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    imgdata = String(data: data, encoding: NSUTF8StringEncoding)!
//                })
//            }
//        }
//
//        // Run task
//        task.resume()
//    }
//
//    static func loadImageFromUrl(url: String, view: UIImageView){
//
//        // Create Url from string
//        let url = NSURL(string: url)!
//
//        // Download task:
//        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
//            // if responseData is not null...
//            if let data = responseData{
//
//                // execute in UI thread
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    view.image = UIImage(data: data)
//                })
//            }
//        }
//
//        // Run task
//        task.resume()
//    }
//
//    static func loadImageFromUrl(url: String) -> UIImageView{
//
//        // Create Url from string
//        let url = NSURL(string: url)!
//        let img = UIImageView()
//        // Download task:
//        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
//            // if responseData is not null...
//            if let data = responseData{
//
//                // execute in UI thread
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    img.image = UIImage(data: data)
//                })
//            }
//        }
//        // Run task
//        task.resume()
//        return img
//    }
//}



//class ImageLoader {
//
//    var cache = NSCache()
//
//    class var sharedLoader : ImageLoader {
//        struct Static {
//            static let instance : ImageLoader = ImageLoader()
//        }
//        return Static.instance
//    }
//
//    func imageForUrl(urlString: String, completionHandler:(image: UIImage?, url: String) -> ()) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {()in
//            var data: NSData? = self.cache.objectForKey(urlString) as? NSData
//
//            if let goodData = data {
//                let image = UIImage(data: goodData)
//                dispatch_async(dispatch_get_main_queue(), {() in
//                    completionHandler(image: image, url: urlString)
//                })
//                return
//            }
//
////            var downloadTask: NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!, completionHandler:
////
////                {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
////                if (error != nil) {
////                    completionHandler(image: nil, url: urlString)
////                    return
////                }
////
////                if data != nil {
////                    let image = UIImage(data: data)
////                    self.cache.setObject(data, forKey: urlString)
////                    dispatch_async(dispatch_get_main_queue(), {() in
////                        completionHandler(image: image, url: urlString)
////                    })
////                    return
////                }
////
////            }
////            )
////            downloadTask.resume()
//        })
//
//    }
//}

//extension UIImageView {
//
//    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
//
//        guard let url = URL(string: link) else { return }
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse where httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType where mimeType.hasPrefix("image"),
//                let data = data where error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { () -> Void in
//                self.image = image
//            }
//            }.resume()
//    }
//}
