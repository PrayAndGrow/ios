//
//  SurpriseMeTagPickerViewController.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 09/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class SurpriseMeTagPickerViewController: SurpriseMeViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var tags = [Tag]() {
        didSet {
            self.chosenTags = Set(tags.map {
                $0.internalIdentifier!
            })
            self.tableView.reloadData()
        }
    }
    
    var chosenTags = Set<Int>() {
        didSet {
            self.surpriseMe.tags = Array(chosenTags)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Pick Tags", comment: "")
        self.tableView.allowsMultipleSelection = true
        PrayAndGrowAPI.sharedAPI.brainTags().responseArray(keyPath: "results") { (r: Response<[Tag], NSError>) in
            if let tags = r.result.value {
                self.tags = tags
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tag = self.tags[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("TagCell")
        cell?.textLabel?.text = tag.tag
        if self.chosenTags.contains(tag.internalIdentifier!) {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let idk = self.tags[indexPath.row].internalIdentifier!
        if chosenTags.contains(idk) {
            chosenTags.remove(idk)
        }
        else {
            chosenTags.insert(idk)
        }
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        chosenTags.remove(self.tags[indexPath.row].internalIdentifier!)
        self.tableView.reloadData()
    }

}
