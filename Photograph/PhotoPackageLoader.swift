//
//  PhotoPackageLoader.swift
//  Photograph
//
//  Created by Pyee on 09/08/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation

class PhotoPackageLoader {
    // Singleton pattern
    static let sharedLoader: PhotoPackageLoader = PhotoPackageLoader()
    private init() {
        let sessionConfig: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["application-id" : "CCEB2CD0-B42C-5FDC-FF45-CE0743545C00",
                                               "secret-key" : "BF07B667-B159-BBFE-FF31-524775452900"]
        session = NSURLSession(configuration: sessionConfig)

    }
    
    let session: NSURLSession
    
    // Network
    func creatingPackageOnServer() {
        
        let url: NSURL = NSURL(string: "https://api.backendless.com/v1/data/PhotoPackages")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        urlRequest.HTTPMethod = "POST"
        
        // Create PhotoPackage object
        let photographer: Photographer = Photographer(name: "Magdalene", contact: "018-98765432", yearOfExperience: 2)
        let package: PhotoPackage = PhotoPackage(name: "Holiday", price: 130.00, photographer: photographer, photoServiceType: PhotoServiceType.Candid)
        // Change it as a JSONObject
        let jsonDictionary: [String : AnyObject] = [
            "name" : package.name,
            "price" : package.price
        ]
        
        let jsonData: NSData = try! NSJSONSerialization.dataWithJSONObject(jsonDictionary, options: NSJSONWritingOptions(rawValue: 0))
        urlRequest.HTTPBody = jsonData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("REST", forHTTPHeaderField: "application-type")
        
        let postTask: NSURLSessionDataTask = self.session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error:NSError?) in
            
            let responseInString: String? = String(data: data!, encoding: NSUTF8StringEncoding)
            NSLog("\(responseInString)")
        }
        
        postTask.resume()
    }

    
}