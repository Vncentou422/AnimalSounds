//
//  SoundCell.swift
//  AnimalSounds
//
//  Created by Vincent Ou on 12/3/18.
//  Copyright © 2018 Vincent Ou. All rights reserved.
//

import Foundation
import UIKit
private var shadowLayer: CAShapeLayer!
private var cornerRadius: CGFloat = 25.0
private var fillColor: UIColor = .white

class SoundCell : UITableViewCell {
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var centerLabeo: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonView.layer.cornerRadius = 25;
        buttonView.layer.masksToBounds = true;
//        //set the values for top,left,bottom,right margins
//        let margins = UIEdgeInsetsMake(10, 10, 10, 10)
//        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, margins)
//
//        shadowLayer = CAShapeLayer()
//
//        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//        shadowLayer.fillColor = fillColor.cgColor
//
//        shadowLayer.shadowColor = UIColor.black.cgColor
//        shadowLayer.shadowPath = shadowLayer.path
//        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        shadowLayer.shadowOpacity = 0.2
//        shadowLayer.shadowRadius = 3
//
//        layer.insertSublayer(shadowLayer, at: 0)
        
        
        
        
    }
    
    
    
    
}
