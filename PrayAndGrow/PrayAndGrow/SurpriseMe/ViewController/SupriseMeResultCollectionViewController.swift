//
//  SupriseMeResultCollectionViewController.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 10/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import Foundation
import AlamofireImage

class SurpriseMeResultCollectionViewController: TisprCardStackViewController {
    let durationFormatter = NSDateFormatter()
    var brainBits : [BrainBit] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.durationFormatter.dateFormat = "mm:ss"
        self.durationFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        self.setCardSize(CGSizeMake(300, 300))
        self.collectionView?.registerNib(UINib(nibName: "SurpriseMeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
    override func numberOfCards() -> Int {
        return self.brainBits.count
    }
    
    
    override func card(collectionView: UICollectionView, cardForItemAtIndexPath indexPath: NSIndexPath) -> TisprCardStackViewCell {
        let brainBit = self.brainBits[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! SurpriseMeCollectionViewCell
        cell.titleLabel.text = brainBit.title
        cell.descLabel.text = brainBit.descriptionValue
        cell.durationLabel.text = NSLocalizedString("Duration: ", comment: "") + brainBit.duration!
        cell.imageView.af_setImageWithURL(brainBit.imageURL(), placeholderImage: UIImage(named: "placeholder"))
        cell.contentTypeImageView.image = UIImage(imageLiteral: brainBit.type!.api())
        switch brainBit.type! {
        case .Article:
            cell.backgroundColor = UIColor(hex6: 0xE8EAF6)
        case .Video:
            cell.backgroundColor = UIColor(hex6: 0xFFEBEE)
        case .Podcast:
            cell.backgroundColor = UIColor(hex6: 0xE8F5E9)
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let brainBit = self.brainBits[indexPath.row]
        
        var seenBits = NSUserDefaults.standardUserDefaults().arrayForKey("seen_bits") as? [Int]
        if seenBits == nil {
            seenBits = [Int]()
        }
        seenBits?.append(brainBit.internalIdentifier!)
        NSUserDefaults.standardUserDefaults().setObject(seenBits, forKey: "seen_bits")
        
        UIApplication.sharedApplication().openURL(NSURL(string: brainBit.url!)!)
    }
}
