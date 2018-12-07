//
//  DetailViewController.swift
//  AnimalSounds
//
//  Created by Vincent Ou on 12/3/18.
//  Copyright © 2018 Vincent Ou. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate {

    var labelText: String?
    var labelImage: String?
//    var detailItem: Sounds?
    @IBOutlet weak var centerLabel: UILabel!
    
    @IBOutlet weak var ImageLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = detailItem {
//            detailLabel.text = detail.title
//        }
//        centerLabel.text = "Hello"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
//        print(labelImage)
        self.centerLabel.text = labelText
        self.ImageLabel.text = detailItem?.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Sounds? {
        didSet {
            // Update the view.
//            configureView()
        }
    }


}

