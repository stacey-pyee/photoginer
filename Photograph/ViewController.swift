//
//  ViewController.swift
//  Photograph
//
//  Created by Grace Low on 7/16/16.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photographer: [String] = []
    @IBOutlet weak var photographerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photographer = ["Adam","Bob","Catherine","Jane"]
        self.photographerTableView.dataSource = self
        self.photographerTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photographer.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let photographerName: String = self.photographer[indexPath.row]
        cell.textLabel?.text = photographerName
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("User tapped on \((indexPath.row))")
    }
}




