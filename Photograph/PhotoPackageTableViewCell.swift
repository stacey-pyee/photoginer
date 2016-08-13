//
//  PhotoPackageTableViewCell.swift
//  Photograph
//
//  Created by Pyee on 28/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation
import UIKit

class PhotoPackageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var photoPackage: PhotoPackage! {
        didSet {
            updateCellDisplay()
        }
    }

    func updateCellDisplay() {
        self.nameLabel.text = photoPackage.name
        self.priceLabel.text = "RM \(photoPackage.price)"
    }
}
