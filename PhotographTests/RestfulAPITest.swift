//
//  RestfulAPITest.swift
//  Photograph
//
//  Created by Pyee on 02/08/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import XCTest
@testable import Photograph

class RestfulAPITest: XCTestCase {
    var session: NSURLSession!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let sessionConfig: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["application-id" : "CCEB2CD0-B42C-5FDC-FF45-CE0743545C00",
                                               "secret-key" : "BF07B667-B159-BBFE-FF31-524775452900"]
        session = NSURLSession(configuration: sessionConfig)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadPhotographersFromBackendLess() {
        let expectation = self.expectationWithDescription("Load Task")
//        let session = NSURLSession.sharedSession()
        //let url = NSURL(string: "https://pokeapi.co/api/v2/pokemon")
        let url = NSURL(string: "https://api.backendless.com/v1/data/Photographer")!
        let loadTask: NSURLSessionDataTask = self.session.dataTaskWithURL(url) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            let htmlString: String? = String(data: data!, encoding: NSUTF8StringEncoding)
            XCTAssert(htmlString != nil, "Should not be nil")
            
            print("Data \(data)")
            print("Response \(response)")
            
            // Check for response status code
            if let httpResponse: NSHTTPURLResponse = response as? NSHTTPURLResponse {
                XCTAssert(httpResponse.statusCode == 200, "We should get 200 but \(httpResponse.statusCode)")
            } else {
                XCTAssert(false, "It should be HTTP Response")
            }
            
            let responseInString: String? = String(data: data!, encoding: NSUTF8StringEncoding)
            print(responseInString)
            
            // Convert to JSON
            let json: [String : AnyObject] = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! [String : AnyObject]
            
            let dataArray: [[String : AnyObject]] = (json["data"] as? [[String : AnyObject]])!
            print("Response \(dataArray)")
            
            for photographerJSON in dataArray {
                let name: String = photographerJSON["name"] as! String
                print(name)
            }
            
            expectation.fulfill()
        }
        loadTask.resume()
        
        self.waitForExpectationsWithTimeout(100, handler: nil)
    }
    
    func testCreatingObjectToAPI() {
        let expectation = self.expectationWithDescription("Create Photographer")
        
        let url: NSURL = NSURL(string: "https://api.backendless.com/v1/data/Photographer")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        urlRequest.HTTPMethod = "POST"
        
        // Create Photographer object
        let photographer: Photographer = Photographer(name: "Magdalene", contact: "018-98765432", yearOfExperience: 2)
        // Change it as a JSONObject
        let jsonDictionary: [String : AnyObject] = [
            "name" : photographer.name,
            "contact" : photographer.contact
        ]
        
        let jsonData: NSData = try! NSJSONSerialization.dataWithJSONObject(jsonDictionary, options: NSJSONWritingOptions(rawValue: 0))
        urlRequest.HTTPBody = jsonData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("REST", forHTTPHeaderField: "application-type")
        
        let postTask: NSURLSessionDataTask = self.session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error:NSError?) in
            
            let responseInString: String? = String(data: data!, encoding: NSUTF8StringEncoding)
            NSLog("\(responseInString)")
            
            
            expectation.fulfill()
        }
        
        postTask.resume()
        self.waitForExpectationsWithTimeout(100, handler: nil)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
