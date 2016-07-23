//
//  Photographer Profile Summary.swift
//  Photograph
//
//  Created by Grace Low on 7/23/16.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import UIKit

class PhotographerProfileSummaryViewController: UIViewController {
    @IBOutlet weak var photographerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var searchPhotographerName: UISearchBar!
    @IBOutlet weak var cell: UITableViewCell!
    @IBOutlet weak var PhotographerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}