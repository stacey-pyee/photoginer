//
//  ViewController.swift
//  Photograph
//
//  Created by Grace Low on 7/16/16.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import UIKit

/* DELEGATE PASSING
 
 protocol AddPhotographerDelegate {
    func viewController(vc: PhotographersViewController, didAddPhotographer photographer: Photographer!)
    // func viewControllerDidCancelAddingPhotographer(vc: PhotographersViewController, didAddPhotographer photographer: Photographer!)
}

*/
 
class PhotographersViewController: UIViewController {
    
    @IBOutlet weak var photographerTableView: UITableView!
    @IBOutlet weak var photographerSearchBar: UISearchBar!
    
    
    
    var photographerList: [Photographer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.photographer = ["Adam","Bob","Catherine","Jane"]
        self.photographerTableView.dataSource = self
        self.photographerTableView.delegate = self
        self.photographerSearchBar.delegate = self
        self.createDummyData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDummyData() {
        let photographer1: Photographer = Photographer(name: "Adam", contact: "0109999991", yearOfExperience: 3)
        photographer1.photo = UIImage(named: "Adam")
        let photographer2: Photographer = Photographer(name: "Bob", contact: "0109999992", yearOfExperience: 5)
        photographer2.photo = UIImage(named: "Bob")
        let photographer3: Photographer = Photographer(name: "Catherine", contact: "0109999993", yearOfExperience: 1)
        photographer3.photo = UIImage(named: "Catherine")
        let photographer4: Photographer = Photographer(name: "Jane", contact: "0109999994", yearOfExperience: 10)
        photographer4.photo = UIImage(named: "Jane")
        photographerList = [photographer1, photographer2, photographer3, photographer4]
    }
    

    func searchName (search: String) -> [Photographer]{
        var searchPhotographer: [Photographer] = []
        let searchName: String = search
        for i in 0..<photographerList.count{
            if (photographerList[i].name == searchName){
                searchPhotographer.append(photographerList[i])
            }
        }
        return searchPhotographer
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPhotographerDetailsViewController"{
            let destVC: PhotographerProfileViewController = segue.destinationViewController as! PhotographerProfileViewController
            if let selectedIndexPath = self.photographerTableView.indexPathForSelectedRow{
                let photographer: Photographer = self.photographerList[selectedIndexPath.row]
                destVC.photographer = photographer
            }
        }
    }
    
    @IBAction func unwindToPhotographersViewController(segue: UIStoryboardSegue){
        if let addPhotographerVC: AddPhotographerViewController = segue.sourceViewController as? AddPhotographerViewController{
            if let photographer = addPhotographerVC.photographer{
                self.photographerList.append(photographer)
                self.photographerTableView.reloadData()
            }
        }
    }

}

extension PhotographersViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photographerList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.photographerTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:  indexPath)
        let photographer: Photographer = self.photographerList[indexPath.row]
        cell.textLabel?.text = photographer.name
        cell.imageView?.image = photographer.photo
        return cell
    }
}

extension PhotographersViewController: UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let photographerProfileViewVC: PhotographerProfileViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PhotographerProfileViewController") as! PhotographerProfileViewController
        self.navigationController?.pushViewController(photographerProfileViewVC, animated: true)
    }
}

extension PhotographersViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        self.photographerList = searchName(photographerSearchBar.text!)
        self.photographerTableView.reloadData()
        
    }
}




