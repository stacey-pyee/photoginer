//
//  UIViewController+Alert.swift
//  Photograph
//
//  Created by Pyee on 13/08/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, okTitle: String)  {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: okTitle, style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
