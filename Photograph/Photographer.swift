//
//  Photographer.swift
//  Photograph
//
//  Created by Pyee on 20/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation
import UIKit

class Photographer {
    var name: String
    var contact: String
    var email: String?
    var yearOfExperience: Int?
    var artWorks: [UIImage] = []
    var reviews: [Review] = []
    var photo: UIImage?

    
    init(name: String, contact: String, yearOfExperience: Int) {
        self.name = name
        self.contact = contact
        self.yearOfExperience = yearOfExperience

    }
    
}