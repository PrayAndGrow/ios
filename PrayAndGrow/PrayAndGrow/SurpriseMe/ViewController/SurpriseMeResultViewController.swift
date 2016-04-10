//
//  SurpriseMeResultViewController.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 09/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol SurpriseMeResultDelegate {
    func resultSelected(brainBit: BrainBit)
}

class SurpriseMeResultViewController: SurpriseMeViewController, SurpriseMeResultDelegate {
    
    var cardStackCollectionViewController : SurpriseMeResultCollectionViewController!
    var result = [BrainBit]() {
        didSet {
            self.cardStackCollectionViewController.brainBits = result
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Results", comment: "")
        let layout = TisprCardStackViewLayout()
        layout.topStackMaximumSize = 4
        layout.bottomStackMaximumSize = 30
        layout.bottomStackCardHeight = 45
        
//        self.cardStackCollectionViewController = SurpriseMeResultCollectionViewController(collectionViewLayout: layout)
//        self.addChildViewController(self.cardStackCollectionViewController)
//        self.cardStackCollectionViewController.didMoveToParentViewController(self)
//        self.view.addSubview(self.cardStackCollectionViewController.view)
        
        let excludeBits = NSUserDefaults.standardUserDefaults().arrayForKey("seen_bits") as? [Int] ?? []
        PrayAndGrowAPI.sharedAPI.surpriseMe(self.surpriseMe).responseArray (keyPath: "response", completionHandler: { (r: Response<[BrainBit], NSError>) in
            if let bits = r.result.value {
                self.result = bits.filter {
                    !excludeBits.contains($0.internalIdentifier!)
                }
            }
        })
    }
    
    func resultSelected(brainBit: BrainBit) {
        UIApplication.sharedApplication().openURL(NSURL(string:brainBit.url!)!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.cardStackCollectionViewController = segue.destinationViewController as? SurpriseMeResultCollectionViewController
    }
    
}
