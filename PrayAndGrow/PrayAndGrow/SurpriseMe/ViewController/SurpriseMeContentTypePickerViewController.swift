//
//  SurpriseMeContentTypePickerViewController.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 09/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import UIKit

class SurpriseMeContentTypePickerViewController: SurpriseMeViewController {

    @IBOutlet weak var videoSwitch: AIFlatSwitch!
    @IBOutlet weak var podcastSwitch: AIFlatSwitch!
    @IBOutlet weak var articleSwitch: AIFlatSwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Pick Content Types", comment: "")
        self.videoSwitch.selected = true
        self.podcastSwitch.selected = true
        self.articleSwitch.selected = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var types = [String]()
        if videoSwitch.selected {
            types.append(ContentType.Video.api())
        }
        if podcastSwitch.selected {
            types.append(ContentType.Podcast.api())
        }
        if articleSwitch.selected {
            types.append(ContentType.Article.api())
        }
        self.surpriseMe.types = types
        super.prepareForSegue(segue, sender: sender)
    }

}
