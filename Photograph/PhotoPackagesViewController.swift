//
//  PhotoPackagesViewController.swift
//  Photograph
//
//  Created by Pyee on 26/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import UIKit

class PhotoPackagesViewController: UIViewController {

    @IBOutlet weak var photoServicesUITableView: UITableView!
    var refreshControl: UIRefreshControl!
    var packagesAvailable: [PhotoPackage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoServicesUITableView.dataSource = self
        self.photoServicesUITableView.delegate = self
        //createDummyData()
        
        // Add in a refreshControl
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(PhotoPackagesViewController.refreshPackages), forControlEvents: UIControlEvents.ValueChanged)
        self.photoServicesUITableView.addSubview(self.refreshControl)
        
        // load data
        self.refreshPackages()
    }
    
    func createDummyData() {
        let daniel: Photographer = Photographer.init(name: "Daniel", contact: "012-3456789", yearOfExperience: 5)
        let david: Photographer = Photographer.init(name: "David", contact: "013-23412332", yearOfExperience: 2)
        
        let danielPackageA: PhotoPackage = PhotoPackage.init(name: "Model Feel",
                                                             price: 200.0,
                                                             photographer: daniel,
                                                             photoServiceType: PhotoServiceType.Candid)
        let danielPackageB: PhotoPackage = PhotoPackage.init(name:"Event Package",
                                                             price: 1500.0,
                                                             photographer: daniel,
                                                             photoServiceType: PhotoServiceType.Event)
        
        let davidPackageA: PhotoPackage = PhotoPackage.init(name:"Happily Ever After",
                                                            price: 2000.0,
                                                            photographer: david,
                                                            photoServiceType: PhotoServiceType.Wedding)
        let davidPackageB: PhotoPackage = PhotoPackage.init(name: "Fame",
                                                            price: 300.0,
                                                            photographer: david,
                                                            photoServiceType: PhotoServiceType.Commercial)
        
        packagesAvailable = [davidPackageA, davidPackageB, danielPackageA, danielPackageB]

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showPhotoPackageDetailsViewController") {
            let destVC: PhotoPackageDetailsViewController = segue.destinationViewController as! PhotoPackageDetailsViewController
            if let selectedIndex = self.photoServicesUITableView.indexPathForSelectedRow {
                let photoPackage:PhotoPackage = self.packagesAvailable[selectedIndex.row]
                destVC.photoPackage = photoPackage
            }
        }
        
        if (segue.identifier == "presentAddPackageViewController") {
            let destinationVC: AddPackageViewController = segue.destinationViewController as! AddPackageViewController;
            destinationVC.delegeate = self
        }
    }
    
    func refreshPackages() {
        if let refreshControl = self.refreshControl {
            refreshControl.beginRefreshing()
        }

        PhotoPackageLoader.sharedLoader.readPackagesFromServer { (packages, error) in
            // end refreshing when comes back from completion block
            self.refreshControl.endRefreshing()
            if let error = error {
                self.showAlert("Error", message: error.localizedDescription, okTitle: "OK")
            } else {
                self.packagesAvailable = packages
                self.photoServicesUITableView.reloadData()
            }
        }
    }
        
}

extension PhotoPackagesViewController: AddPackageDelegate {
    func viewController(vc: AddPackageViewController, didAddPark: PhotoPackage!) {
        self.packagesAvailable.append(didAddPark)
        self.dismissViewControllerAnimated(true, completion: nil)
        self.photoServicesUITableView.reloadData()

        // Save to server
        PhotoPackageLoader.sharedLoader.creatingPackageOnServer(didAddPark) { (success, error) in
            // Thing to do when response comes back
            if (error != nil) {
                self.showAlert("Upload Error", message: error!.localizedDescription, okTitle: "OK")
            } else if (!success) {
                self.showAlert("Upload Error", message: "Failed to create as new object", okTitle: "OK")
            }
        }
    }
}

extension PhotoPackagesViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let photoPackageViewController: PhotoPackageDetailsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PhotoPackageDetailsViewController") as! PhotoPackageDetailsViewController
//        self.navigationController?.pushViewController(photoPackageViewController, animated: true)
    }
}

extension PhotoPackagesViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packagesAvailable.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PhotoPackageTableViewCell = self.photoServicesUITableView.dequeueReusableCellWithIdentifier("PhotoPackageCell", forIndexPath: indexPath) as! PhotoPackageTableViewCell
        
        let servicePackage: PhotoPackage = self.packagesAvailable[indexPath.row]
        cell.photoPackage = servicePackage
        return cell

    }
}
