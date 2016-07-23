//
//  PhotographerSearchTests.swift
//  Photograph
//
//  Created by Grace Low on 7/23/16.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import XCTest
@testable import Photograph

class PhotographerSearchTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSearchYrOfExp (search: Int){
        
        let searchYrOfExp: Int = search
        
        let photographer1: Photographer = Photographer(name: "Adam", contact: "000000000", yearOfExperience: 2)
        let photographer2: Photographer = Photographer(name: "Bob", contact: "000000000", yearOfExperience: 3)
        let photographer3: Photographer = Photographer(name: "Jane", contact: "000000000", yearOfExperience: 6)
        
        let dummyPhotographer: [Photographer] = [photographer1,photographer2,photographer3]
        
        var searchPhotographer: [Photographer] = []
        var expectedPhotographer: [Photographer] = [photographer2]
        
        for i in 0..<dummyPhotographer.count{
            if (dummyPhotographer[i].yearOfExperience == searchYrOfExp){
                searchPhotographer.append(dummyPhotographer[i])
            }
        }
        
        for i in 0..<searchPhotographer.count {
            XCTAssert(searchPhotographer[i] === expectedPhotographer[i], "Search photographer should be photographer 2")
        }
        
        
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
