//
//  PhotoPackageTests.swift
//  Photograph
//
//  Created by Pyee on 21/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import XCTest
@testable import Photograph

class PhotoPackageTests: XCTestCase {
    var packagesAvailable: [PhotoPackage] = []

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSearchPackagesWithPrice() {
        // Create dummy data
        let daniel: Photographer = Photographer.init(name: "Daniel", contact: "012-3456789")
        let david: Photographer = Photographer.init(name: "David", contact: "013-23412332")
        
        let danielPackageA: PhotoPackage = PhotoPackage.init(name: "Model Feel",
                                                             price: 200.0,
                                                             photographer: daniel,
                                                             photoServiceType: PhotoServiceType.Candid)
        let danielPackageB: PhotoPackage = PhotoPackage.init(name:"Event Package",
                                                             price: 1500.0,
                                                             photographer: daniel,
                                                             photoServiceType: PhotoServiceType.Event)
        
        let davidPackageA: PhotoPackage = PhotoPackage.init(name:"Happily Ever After",
                                                            price: 2000.0,
                                                            photographer: david,
                                                            photoServiceType: PhotoServiceType.Wedding)
        let davidPackageB: PhotoPackage = PhotoPackage.init(name: "Fame",
                                                            price: 300.0,
                                                            photographer: david,
                                                            photoServiceType: PhotoServiceType.Commercial)
        
        packagesAvailable = [davidPackageA, davidPackageB, danielPackageA, danielPackageB]
        
        let results: [PhotoPackage] = searchForPackagesWithinPriceRange(1000.0)
        XCTAssert(results.count == 2, "Results count should be 2")
    }
    
    func searchForPackagesWithinPriceRange(price: Double) -> [PhotoPackage]{
        var packagesInRange: [PhotoPackage] = []
        for photoPackage in packagesAvailable {
            if (photoPackage.price <= price) {
                packagesInRange.append(photoPackage)
            }
        }
        return packagesInRange
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
