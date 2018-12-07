//
//  AppInfoController.swift
//  AnimalSounds
//
//  Created by Vincent Ou on 12/3/18.
//  Copyright © 2018 Vincent Ou. All rights reserved.
//

import Foundation
import UIKit

class AppInfoController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var onDoneBtn: UIButton!
    
   
    @IBAction func onDownloadPress(_ sender: Any) {
        let vc = MasterViewController(nibName: "MasterViewController", bundle: nil)
        vc.download = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.destination is MasterViewController
//        {
//            let vc = segue.destination as? MasterViewController
//            vc?.download = true
//        }
//    }
    @IBAction func onDonePress(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
