//
//  Sounds.swift
//  AnimalSounds
//
//  Created by Vincent Ou on 12/5/18.
//  Copyright © 2018 Vincent Ou. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class Sounds: NSObject, NSCoding {
    var image: String
    var title: String
    
    
    enum CodingKeys: String, CodingKey {
        case title, image
    }
    
    override init() {
        image = NSLocalizedString("str_pic", comment: "")
        title = NSLocalizedString("str_title", comment: "")
        
    }
    
    init(imagee: String,titlee: String){
        self.image = imagee
        self.title = titlee
        
    }
    // MARK: - NSCoder
    
    required init(coder aDecoder: NSCoder) {
        image = aDecoder.decodeObject(forKey: CodingKeys.image.rawValue) as! String
        title = aDecoder.decodeObject(forKey: CodingKeys.title.rawValue) as! String
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: CodingKeys.image.rawValue)
        aCoder.encode(title, forKey: CodingKeys.title.rawValue)
        

    }
}
