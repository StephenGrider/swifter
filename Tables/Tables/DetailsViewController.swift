//
//  DetailsViewController.swift
//  Tables
//
//  Created by stephen g on 12/17/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    var album: Album?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.album?.title
        self.albumCover.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.album!.largeImageUrl)!)!)
    }
}