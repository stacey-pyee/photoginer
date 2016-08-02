//
//  AddPackageViewController.swift
//  Photograph
//
//  Created by Pyee on 28/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation
import UIKit

class AddPackageViewController: UIViewController {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var serviceTextField: UITextField!
    
    @IBAction func cancelServiceCreation(sender: UIButton) {
        //self.presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveService(sender: UIButton) {
    }
}
