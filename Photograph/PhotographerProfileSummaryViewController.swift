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
    
    var photographer1: Photographer = Photographer(name: "Adam", contact: "0109999991", yearOfExperience: 3)
    var photographer2: Photographer = Photographer(name: "Bob", contact: "0109999992", yearOfExperience: 5)
    var photographer3: Photographer = Photographer(name: "Catherine", contact: "0109999993", yearOfExperience: 1)
    var photographer4: Photographer = Photographer(name: "Jane", contact: "0109999994", yearOfExperience: 10)

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var photographerList: [Photographer] = [photographer1, photographer2, photographer3, photographer4]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PhotographerProfileSummaryViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension PhotographerProfileSummaryViewController: UITableViewDelegate{
    
}