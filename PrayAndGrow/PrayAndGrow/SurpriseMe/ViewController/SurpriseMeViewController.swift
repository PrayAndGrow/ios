//
//  SurpriseMeViewController.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 09/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import UIKit

class SurpriseMeViewController: UIViewController {
    var surpriseMe : SurpriseMeInput = SurpriseMeInput()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let next = segue.destinationViewController as? SurpriseMeViewController {
            next.surpriseMe = self.surpriseMe
        }
    }
}
