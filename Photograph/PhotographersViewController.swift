//
//  ViewController.swift
//  Photograph
//
//  Created by Grace Low on 7/16/16.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import UIKit

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
        let photographer2: Photographer = Photographer(name: "Bob", contact: "0109999992", yearOfExperience: 5)
        let photographer3: Photographer = Photographer(name: "Catherine", contact: "0109999993", yearOfExperience: 1)
        let photographer4: Photographer = Photographer(name: "Jane", contact: "0109999994", yearOfExperience: 10)
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
}

extension PhotographersViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photographerList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let photographerName: String = self.photographerList[indexPath.row].name
        cell.textLabel?.text = photographerName
        return cell
    }
}

extension PhotographersViewController: UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("User tapped on \((indexPath.row))")
        
        let photographerProfileSummaryVC: PhotographerProfileSummaryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PhotographerProfileSummaryViewController") as! PhotographerProfileSummaryViewController
        self.navigationController?.pushViewController(photographerProfileSummaryVC, animated: true)
    }
}

extension PhotographersViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        self.photographerList = searchName(photographerSearchBar.text!)
        self.photographerTableView.reloadData()
        
    }
}




