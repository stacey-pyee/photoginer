//
//  AddPackageViewController.swift
//  Photograph
//
//  Created by Pyee on 28/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import Foundation
import UIKit

protocol AddPackageDelegate {
    func viewController(vc: AddPackageViewController, didAddPark: PhotoPackage!)
}

class AddPackageViewController: UIViewController {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var serviceTextField: UITextField!
    
    var package: PhotoPackage?
    var delegeate: AddPackageDelegate?
    let david: Photographer = Photographer.init(name: "David", contact: "0123456789", yearOfExperience: 3)
    
    @IBAction func cancelServiceCreation(sender: UIButton) {
        //self.presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveService(sender: UIButton) {
        self.package = PhotoPackage.init(name: self.serviceTextField.text!, price: 100.0, photographer: david, photoServiceType: PhotoServiceType.Event)
        
        self.delegeate?.viewController(self, didAddPark: self.package)
        
        PhotoPackageLoader.sharedLoader.creatingPackageOnServer()
    }
}
