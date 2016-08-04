//
//  RestfulAPITest.swift
//  Photograph
//
//  Created by Pyee on 02/08/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import XCTest

class RestfulAPITest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadPhotographersFromBackendLess() {
        let expectation = self.expectationWithDescription("Load Task")
        
        
        let sessionConfig: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["application-id" : "CCEB2CD0-B42C-5FDC-FF45-CE0743545C00",
                                               "secret-key" : "BF07B667-B159-BBFE-FF31-524775452900"]
        
//        let session = NSURLSession.sharedSession()
        let session = NSURLSession(configuration: sessionConfig)
        //let url = NSURL(string: "https://pokeapi.co/api/v2/pokemon")
        let url = NSURL(string: "https://api.backendless.com/v1/data/Photographer")!
        let loadTask: NSURLSessionDataTask = session.dataTaskWithURL(url) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
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
