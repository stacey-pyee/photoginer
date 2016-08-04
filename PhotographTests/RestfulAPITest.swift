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
    
    func testLoadHomepage() {
        let expectation = self.expectationWithDescription("Load Task")
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "https://pokeapi.co/api/v2/pokemon")
        let loadTask: NSURLSessionDataTask = session.dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            let htmlString: String? = String(data: data!, encoding: NSUTF8StringEncoding)
            XCTAssert(htmlString != nil, "Should not be nil")
            
            print("Data \(data)")
            print("Response \(response)")
            
            // Convert to JSON
            
            expectation.fulfill()
        }
        loadTask.resume()
        
        self.waitForExpectationsWithTimeout(10, handler: nil)
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
