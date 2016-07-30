//
//  PhotographTests.swift
//  PhotographTests
//
//  Created by Grace Low on 7/16/16.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import XCTest
@testable import Photograph

class PhotographTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    
    func testEnum() {
        let serviceType = PhotoServiceType(rawValue: 2)
        
        XCTAssert(serviceType == PhotoServiceType.Commercial)
        XCTAssert(serviceType != PhotoServiceType.Wedding)

    }
    
    func testSearchServiceType (){
        let type: String = "anything"
        let searchServiceType: String = type
        
        let service1: PhotoServiceType = PhotoServiceType.Wedding
        let service2: PhotoServiceType = PhotoServiceType.Candid
        let service3: PhotoServiceType = PhotoServiceType.Commercial
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
