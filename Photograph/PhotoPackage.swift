//
//  Package.swift
//  Photograph
//
//  Created by Pyee on 20/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation

class PhotoPackage {
    var price: Double
    var photographer: Photographer
    var photographService: PhotoService
    var description: String?
    
    init(price: Double, photographer: Photographer, photographService: PhotoService) {
        self.price = price
        self.photographer = photographer
        self.photographService = photographService
    }
}