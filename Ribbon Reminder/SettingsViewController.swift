//
//  SettingsViewController.swift
//  Ribbon Reminder
//
//  Created by John Datserakis on 11/8/14.
//  Copyright (c) 2014 John Datserakis. All rights reserved.
//

import UIKit
import Foundation


class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableSettings: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        var userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.integerForKey("backgroundChoice") == 1 {
            
            var backgroundImage : UIImageView? = self.view.viewWithTag(100) as? UIImageView;
            backgroundImage?.image = UIImage(named: "MainScreenLeatherSettings_006")
            
        }
        
        if userDefaults.integerForKey("backgroundChoice") == 2 {
            
            var backgroundImage : UIImageView? = self.view.viewWithTag(100) as? UIImageView;
            backgroundImage?.image = UIImage(named: "MainScreenCorkSettings_006")
            
        }
        
        if userDefaults.integerForKey("backgroundChoice") == 3 {
            
            var backgroundImage : UIImageView? = self.view.viewWithTag(100) as? UIImageView;
            backgroundImage?.image = UIImage(named: "MainScreenFabricSettings_006")
            
        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemChangedSettings:", name: "reloadTableViewDataSettings", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "backgroundAdjustSettings:", name: "backgroundAdjustSettingsCalling", object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        println("viewDidAppear")
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.integerForKey("backgroundChoice") == 1 {
            
            var backgroundImage : UIImageView? = self.view.viewWithTag(100) as? UIImageView;
            backgroundImage?.image = UIImage(named: "MainScreenLeatherSettings_006")
 
        }
        
        if userDefaults.integerForKey("backgroundChoice") == 2 {
            
            var backgroundImage : UIImageView? = self.view.viewWithTag(100) as? UIImageView;
            backgroundImage?.image = UIImage(named: "MainScreenCorkSettings_006")

        }
        
        if userDefaults.integerForKey("backgroundChoice") == 3 {
            
            var backgroundImage : UIImageView? = self.view.viewWithTag(100) as? UIImageView;
            backgroundImage?.image = UIImage(named: "MainScreenFabricSettings_006")
            
        }

    }
    
    @IBAction func backPressedSettings(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 3 {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "http://appstore.com/johndatserakis")!)
        }
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell_Settings", forIndexPath: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell_Settings")
 
        }

        if indexPath.row == 0 {
            
            //Label Work
            var label_title : UILabel? = self.view.viewWithTag(15) as? UILabel;
            var newFont = UIFont(name: "Wawati TC", size: 20)
            label_title?.font = newFont
            label_title?.text = "Have a task or errand you can't afford to forget? Ribbon Reminder stores up to five of your most important reminders and conveniently shows them in your Notification Center. Never forget that important task again!"
            
        }
        
        if indexPath.row == 1 {
            
            //Label Work
            var label_title : UILabel? = self.view.viewWithTag(15) as? UILabel;
            var newFont = UIFont(name: "Wawati TC", size: 20)
            label_title?.font = newFont
            label_title?.text = "Add a new ribbon for each finger using the buttons on the Ribbon Reminder main screen. When you enter a reminder it will automatically be shown in the Notification Center as a widget. Use the Tied Ribbons screen to show and hide certain reminders."

        }
        
        if indexPath.row == 2 {
            
            //Label Work
            var label_title : UILabel? = self.view.viewWithTag(15) as? UILabel;
            var newFont = UIFont(name: "Wawati TC", size: 20)
            label_title?.font = newFont
            label_title?.text = "Hint: If Ribbon Reminder is not being shown in your Notification Center, make sure you've added it as a widget and allowed it to be shown."
        }
        
        if indexPath.row == 3 {
            
            //Label Work
            var label_title : UILabel? = self.view.viewWithTag(15) as? UILabel;
            var newFont = UIFont(name: "Wawati TC", size: 20)
            label_title?.font = newFont
            label_title?.text = "More apps by John Datserakis ->"
            
        }
        
        return cell!
        
    }


}
