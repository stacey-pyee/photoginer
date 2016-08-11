//
//  Package.swift
//  Photograph
//
//  Created by Pyee on 20/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation

class PhotoPackage: NSObject {
    var name: String
    var price: Double
    var photographer: Photographer
    var photoServiceType: PhotoServiceType
    //var description: String?
    var objectId: String?
    
    init(name: String, price: Double, photographer: Photographer, photoServiceType: PhotoServiceType) {
        self.name = name
        self.price = price
        self.photographer = photographer
        self.photoServiceType = photoServiceType
    }
}

extension PhotoPackage {
    convenience init?(jsonDictionary: [String: AnyObject]) {
        let daniel = Photographer(name: "Daniel", contact: "012-9876543", yearOfExperience: 2)
        let name = jsonDictionary["name"] as? String
        let price = jsonDictionary["price"] as? Double
        let objectId: String = (jsonDictionary["objectId"] as? String)!
        
        self.init(name: name!, price: price!, photographer: daniel, photoServiceType: PhotoServiceType.Wedding)
    }
}