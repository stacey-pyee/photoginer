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
    
    @IBOutlet weak var packageDetailsView: UIImageView!
    @IBOutlet weak var cancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
