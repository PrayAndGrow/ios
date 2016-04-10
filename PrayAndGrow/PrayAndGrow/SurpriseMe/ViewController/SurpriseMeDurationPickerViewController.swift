//
//  SurpriseMeDurationPickerViewController.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 09/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

class SurpriseMeDurationPickerViewController: SurpriseMeViewController, BEMAnalogClockDelegate {
    
    @IBOutlet weak var analogClockView: BEMAnalogClockView!
    let durationFormatter = NSDateFormatter()
    @IBOutlet weak var durationLabel: UILabel!
    static let step = 300
    var durationInSeconds : Double = 300.0 {
        didSet {
            self.durationLabel.text = self.durationFormatter.stringFromDate(NSDate(timeIntervalSince1970: durationInSeconds))
            self.surpriseMe.durationLt = Int(durationInSeconds)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        durationFormatter.dateFormat = "HH:mm"
        durationFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Pick Duration", comment: "")
        self.analogClockView.timeChanged = { (hours, minutes, seconds) in
            self.durationInSeconds = Double(minutes.intValue * 60)
        }
        durationInSeconds = 300 * 10
        self.analogClockView.delegate = self
        self.analogClockView.hourHandAlpha = 0
        self.analogClockView.secondHandAlpha = 0
        self.analogClockView.setTimeViaTouch = true
        self.analogClockView.enableDigit = true
        self.analogClockView.hours = 0
        self.analogClockView.minutes = 5
        self.analogClockView.seconds = 0
    }
    
    
    @IBAction func step(sender: UIStepper) {
        durationInSeconds = sender.value * Double(SurpriseMeDurationPickerViewController.step)
    }

    @IBAction func next(sender: AnyObject) {
        
    }
}
