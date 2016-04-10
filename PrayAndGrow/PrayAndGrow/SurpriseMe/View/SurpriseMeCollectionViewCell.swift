//
//  SurpriseMeContentView.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 10/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import UIKit

class SurpriseMeCollectionViewCell: TisprCardStackViewCell {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var contentTypeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12.0
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSizeMake(1, 1)
        
        
        
    }

}
