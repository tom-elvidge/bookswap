//
//  UrlImageModel.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation
import SwiftUI

class UrlImageModel: ObservableObject {
    
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    
    init(urlString: String?) {
        self.urlString = urlString
        
        // Attempt to load the image from the cache.
        if loadImageFromCache() {
            print("ImageCache hit")
            return
        }
        
        // If the image is not in the cache then load from the urlString.
        print("ImageCache miss, load from url...")
        loadImageFromUrl()
    }
    
    func loadImageFromCache() -> Bool {
        // Return false if the urlString is nil.
        guard let urlString = urlString else {
            return false
        }
        
        // Return false if the image at urlString has already been cached.
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        // If the image has been cached then update the image and return true.
        image = cacheImage
        return true
    }
    
    func loadImageFromUrl() {
        // Display default image if urlString is nil.
        guard let urlString = urlString else {
            return
        }
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        
        guard let data = data else {
            print("No data found.")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            // Add image to the cache.
            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            
            // Update image
            self.image = loadedImage
        }
    }
}

class ImageCache {
    
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
    
}

// Singleton ImageCache. To do: dependency injection.
extension ImageCache {
    
    private static var imageCache = ImageCache()
    
    static func getImageCache() -> ImageCache {
        return imageCache
    }
    
}
