//
//  Data Persistence Test.swift
//  Photograph
//
//  Created by Grace Low on 7/30/16.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import XCTest

class Data_Persistence_Test: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserDefault() {
        //designed to store users preference, small piece of user data
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let firstValue: String? = defaults.stringForKey("firstKey")
        XCTAssertNil(firstValue, "FirstValue should be nil since we haven't set before")
        
    }
    
}
