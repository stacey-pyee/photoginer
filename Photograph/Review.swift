//
//  Rating.swift
//  Photograph
//
//  Created by Pyee on 20/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation

class Review {
    var rating: Int
    var comment: String?
    var createdDate: NSDate
    
    init(rating: Int, date: NSDate = NSDate()) {
        self.rating = rating
        self.createdDate = date
    }
}