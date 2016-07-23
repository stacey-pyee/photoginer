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

    var dummyPhotographerList: [Photographer] = []
    override func setUp() {
        super.setUp()
        self.createDummyData()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func createDummyData() {
        let photographer1: Photographer = Photographer(name: "Adam", contact: "0109999991", yearOfExperience: 3)
        let photographer2: Photographer = Photographer(name: "Bob", contact: "0109999992", yearOfExperience: 5)
        let photographer3: Photographer = Photographer(name: "Catherine", contact: "0109999993", yearOfExperience: 1)
        let photographer4: Photographer = Photographer(name: "Jane", contact: "0109999994", yearOfExperience: 10)
        dummyPhotographerList = [photographer1, photographer2, photographer3, photographer4]
    }
    
    

    func testSearchYrOfExp (search: Int){
        var searchPhotographer: [Photographer] = []
        let searchYrOfExp: Int = search
        let expectedPhotographer: Photographer = dummyPhotographerList[1]
        for i in 0..<dummyPhotographerList.count{
            if (dummyPhotographerList[i].yearOfExperience == searchYrOfExp){
                searchPhotographer.append(dummyPhotographerList[i])
            }
        }
        
        for i in 0..<searchPhotographer.count {
            XCTAssert(searchPhotographer[i] === expectedPhotographer, "Search photographer should be photographer 2")
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
