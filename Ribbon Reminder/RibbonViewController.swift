//
//  RibbonViewController.swift
//  Ribbon Reminder
//
//  Created by John Datserakis on 11/13/14.
//  Copyright (c) 2014 John Datserakis. All rights reserved.
//

import UIKit

class RibbonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableRibbon: UITableView!
    var verticalContentOffset = CGFloat()


    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemChanged:", name: "reloadTableViewData", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemChanged(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            UIView.transitionWithView(self.view, duration: 0.500, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                
                self.tableRibbon.reloadData()

                }, completion: { (fininshed: Bool) -> () in

            })
        }

    }
    
    @IBAction func backpressedRibbon(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func showTapped(sender: UIButton) {
        
        var cell = sender.superview as UITableViewCell
        var indexPath = tableRibbon.indexPathForCell(cell)
        
        if indexPath?.row == 0 {
            println("Row 1 was clicked - Show")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(false, forKey: "notificationIsVisible0")
            
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible0")
            
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
        }
        
        if indexPath?.row == 1 {
            println("Row 2 was clicked - Show")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(false, forKey: "notificationIsVisible1")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible1")

            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
        }
        
        if indexPath?.row == 2 {
            println("Row 3 was clicked - Show")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(false, forKey: "notificationIsVisible2")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible2")

            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            
        }
        
        if indexPath?.row == 3 {
            println("Row 4 was clicked - Show")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(false, forKey: "notificationIsVisible3")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible3")

            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            
        }
        
        if indexPath?.row == 4 {
            println("Row 5 was clicked - Show")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(false, forKey: "notificationIsVisible4")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible4")

            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)

        }
        
    }
    
    func hideTapped(sender: UIButton) {
        
        var cell = sender.superview as UITableViewCell
        var indexPath = tableRibbon.indexPathForCell(cell)
        
        if indexPath?.row == 0 {
            
            println("Row 1 was clicked - Hide")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(true, forKey: "notificationIsVisible0")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible0")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            
        }
        
        if indexPath?.row == 1 {
            
            println("Row 2 was clicked - Hide")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(true, forKey: "notificationIsVisible1")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible1")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            
        }
        
        if indexPath?.row == 2 {
            
            println("Row 3 was clicked - Hide")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(true, forKey: "notificationIsVisible2")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible2")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)

        }
        
        if indexPath?.row == 3 {
            
            println("Row 4 was clicked - Hide")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(true, forKey: "notificationIsVisible3")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible3")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            
        }
        
        if indexPath?.row == 4 {
            
            println("Row 5 was clicked - Hide")
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(true, forKey: "notificationIsVisible4")
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible4")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell_Ribbon", forIndexPath: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell_Ribbon")
        }
        
        //Label Work
        var label_title : UILabel? = self.view.viewWithTag(2) as? UILabel;
        var newFont = UIFont(name: "Wawati TC", size: 20)
        label_title?.font = newFont
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        
        if indexPath.row == 0 {
            
            if userDefaults.stringForKey("textfield0") != nil {
                
                label_title?.text = userDefaults.stringForKey("textfield0")
                
            } else {

                label_title?.text = "Thumb"
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible0") == false {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible0") == true {
                
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_open_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "showTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
                
            }
            
            if label_title?.text == "Thumb" {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
 
            
        }
        
        if indexPath.row == 1 {
            
            if userDefaults.stringForKey("textfield1") != nil {
                
                label_title?.text = userDefaults.stringForKey("textfield1")
                
            } else {
                
                label_title?.text = "Index"
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible1") == false {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible1") == true {
                
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_open_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "showTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
                
            }
            
            if label_title?.text == "Index" {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }

        }
        
        if indexPath.row == 2 {
            
            if userDefaults.stringForKey("textfield2") != nil {
                
                label_title?.text = userDefaults.stringForKey("textfield2")
                
                
            } else {
                
                label_title?.text = "Middle"
                
            }
            
            
            if userDefaults.boolForKey("notificationIsVisible2") == false {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible2") == true {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_open_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "showTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
                
            }
            
            if label_title?.text == "Middle" {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }

            
        }
        
        if indexPath.row == 3 {
            
            if userDefaults.stringForKey("textfield3") != nil {
                
                label_title?.text = userDefaults.stringForKey("textfield3")
                
                
            } else {
                
                label_title?.text = "Ring"
                
            }
            
            
            if userDefaults.boolForKey("notificationIsVisible3") == false {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible3") == true {
                
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_open_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "showTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
                
            }
            
            if label_title?.text == "Ring" {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
            
            
        }
        
        if indexPath.row == 4 {
            
            if userDefaults.stringForKey("textfield4") != nil {
                
                label_title?.text = userDefaults.stringForKey("textfield4")
                
                
            } else {
                
                label_title?.text = "Pinky"
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible4") == false {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
            
            if userDefaults.boolForKey("notificationIsVisible4") == true {
                
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_open_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "showTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
                
            }
            
            if label_title?.text == "Pinky" {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "eye_closed_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "hideTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            }
            
        }
        
        return cell!
        
    }


}
