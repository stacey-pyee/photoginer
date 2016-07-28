//
//  PhotographerProfileVC.swift
//  Photograph
//
//  Created by Pyee on 16/07/2016.
//  Copyright © 2016 Kingsley Tan. All rights reserved.
//

import UIKit

class PhotographerProfileViewController: UIViewController {
    var photographer: Photographer!
    @IBOutlet weak var photographerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artworkCollectionView: UICollectionViewCell!
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
