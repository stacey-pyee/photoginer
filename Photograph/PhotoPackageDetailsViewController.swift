//
//  PhotoPackageDetailsViewController.swift
//  Photograph
//
//  Created by Pyee on 26/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation
import UIKit

class PhotoPackageDetailsViewController: UIViewController {
    var photoPackage: PhotoPackage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(photoPackage.name)
    }
}
