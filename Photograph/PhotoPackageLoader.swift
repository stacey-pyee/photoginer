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
    func creatingPackageOnServer(photoPackage: PhotoPackage, completionBlock: ((success: Bool , error: NSError?) -> Void)?) {
        
        let url: NSURL = NSURL(string: "https://api.backendless.com/v1/data/PhotoPackages")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        urlRequest.HTTPMethod = "POST"
        
        // Create PhotoPackage object
//        let photographer: Photographer = Photographer(name: "Magdalene", contact: "018-98765432", yearOfExperience: 2)
//        let package: PhotoPackage = PhotoPackage(name: "Holiday", price: 130.00, photographer: photographer, photoServiceType: PhotoServiceType.Candid)
        // Change it as a JSONObject
        let jsonDictionary: [String : AnyObject] = [
            "name" : photoPackage.name,
            "price" : photoPackage.price
        ]
        
        let jsonData: NSData = try! NSJSONSerialization.dataWithJSONObject(jsonDictionary, options: NSJSONWritingOptions(rawValue: 0))
        urlRequest.HTTPBody = jsonData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("REST", forHTTPHeaderField: "application-type")
        
        let postTask: NSURLSessionDataTask = self.session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error:NSError?) in
            
            if (error != nil) {
                completionBlock? (success: false, error: error)
                return;
            }
            
            // Convert to jsonObject
            var jsonObj: [String : AnyObject]
            do {
                jsonObj = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! [String : AnyObject]
                
                // check and see if objectId is returned
                if (jsonObj["objectId"] != nil) {
                    completionBlock? (success: true, error: nil)
                } else {
                    completionBlock? (success: true, error: nil)
                }
                
            } catch let error {
                // Error
                completionBlock? (success: false, error: error as NSError)
            }
            
        }
        
        postTask.resume()
    }
    
    func readPackagesFromServer(completionBlock: ((packages: [PhotoPackage], error: NSError?) -> Void)?) {
        let url = NSURL(string: "https://api.backendless.com/v1/data/PhotoPackages")!
        let loadTask: NSURLSessionDataTask = self.session.dataTaskWithURL(url) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            let responseInString: String? = String(data: data!, encoding: NSUTF8StringEncoding)
            print(responseInString)
            
            // Convert to JSONObject
            var jsonObj: [String : AnyObject]
            do {
                jsonObj = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! [String : AnyObject]
            } catch let jsonError {
                // Completion block with error
                completionBlock? (packages: [], error: jsonError as NSError)
                return
            }
            
            let dataArray: [[String : AnyObject]] = (jsonObj["data"] as? [[String : AnyObject]])!
            print("Response \(dataArray)")
            
            var packagesFromServer: [PhotoPackage] = []
            for packageJSON in dataArray {
                let package: PhotoPackage = PhotoPackage(jsonDictionary: packageJSON)!
                packagesFromServer.append(package)
            }
            
            dispatch_async(dispatch_get_main_queue(), {() -> Void in
               completionBlock? (packages: packagesFromServer, error: nil)
            })
        }
        loadTask.resume()
    }


    
}