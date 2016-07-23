//
//  Package.swift
//  Photograph
//
//  Created by Pyee on 20/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation

class PhotoPackage {
    var name: String
    var price: Double
    var photographer: Photographer
    var photoServiceType: PhotoServiceType
    var description: String?
    
    init(name: String, price: Double, photographer: Photographer, photoServiceType: PhotoServiceType) {
        self.name = name
        self.price = price
        self.photographer = photographer
        self.photoServiceType = photoServiceType
    }
}