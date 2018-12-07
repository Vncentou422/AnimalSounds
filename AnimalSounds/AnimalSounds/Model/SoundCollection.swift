//
//  SoundCollection.swift
//  AnimalSounds
//
//  Created by Vincent Ou on 12/5/18.
//  Copyright © 2018 Vincent Ou. All rights reserved.
//

import Foundation

import UIKit

class SoundCollection: NSObject, NSCoding {
    
    var sounds = [Sounds]()
    
    override init() {
        super.init()
        addItem(Sounds())
    }
    
    func addItem(_ item: Sounds) {
        sounds.append(item)
    }
    
    func removeItem(at index: Int) {
        sounds.remove(at: index)
    }
    
    func moveItem(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let item = sounds[fromIndex]
            sounds.remove(at: fromIndex)
            sounds.insert(item, at: toIndex)
        }
    }
    
    // MARK: - NSCoder
    
    required init(coder aDecoder: NSCoder) {
        sounds = aDecoder.decodeObject(forKey: "sounds") as! [Sounds]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(sounds, forKey: "sounds")
    }
    
}
