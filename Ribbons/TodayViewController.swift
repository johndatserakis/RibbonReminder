//
//  TodayViewController.swift
//  Ribbons
//
//  Created by John Datserakis on 11/14/14.
//  Copyright (c) 2014 John Datserakis. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableNC: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("got here nc viewdidload")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    @IBAction func ncButtonPress(sender: UIButton) {
//
//        var ncURL = NSURL(string: "ribbonreminder://")
//        self.extensionContext?.openURL(ncURL!, completionHandler: nil)
//        
//    }
//
//    func widgetMarginInsetsForProposedMarginInsets
//        (defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
//            return UIEdgeInsetsZero
//    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.
        
        self.preferredContentSize = self.tableNC.contentSize;

        completionHandler(NCUpdateResult.NewData)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var notificationURL = NSURL(string: "ribbonreminder://")
        self.extensionContext?.openURL(notificationURL!, completionHandler: nil)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableNC.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell_NC", forIndexPath: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            
            //creating cell
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell_NC")
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            
        }

        //Label Work
        var label_title : UILabel? = self.view.viewWithTag(16) as? UILabel;
        var userDefaults = NSUserDefaults.standardUserDefaults()
        let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
        
        
        if indexPath.row == 0 {
            
            if sharedDefaults?.boolForKey("NCnotificationIsVisible0") == true {
                
                if sharedDefaults?.objectForKey("ribbon0") as? String != nil {
                
                label_title?.text = sharedDefaults?.objectForKey("ribbon0") as? String
                    
                } else {
                    
                    label_title?.text = "Thumb"
                    
                }
                
            } else {
                
                label_title?.text = "Thumb"
                
            }
            
        }
        
        if indexPath.row == 1 {
            
            if sharedDefaults?.boolForKey("NCnotificationIsVisible1") == true {
                
                if sharedDefaults?.objectForKey("ribbon1") as? String != nil {
                    
                    label_title?.text = sharedDefaults?.objectForKey("ribbon1") as? String
                    
                } else {
                    
                    label_title?.text = "Index"
                    
                }
                
            } else {
                
                label_title?.text = "Index"
                
            }

        }
        
        if indexPath.row == 2 {
            
            if sharedDefaults?.boolForKey("NCnotificationIsVisible2") == true {
                
                if sharedDefaults?.objectForKey("ribbon2") as? String != nil {
                    
                    label_title?.text = sharedDefaults?.objectForKey("ribbon2") as? String
                    
                } else {
                    
                    label_title?.text = "Middle"
                    
                }
                
            } else {
                
                label_title?.text = "Middle"
                
            }

            
        }
        
        if indexPath.row == 3 {
            
            if sharedDefaults?.boolForKey("NCnotificationIsVisible3") == true {
                
                if sharedDefaults?.objectForKey("ribbon3") as? String != nil {
                    
                    label_title?.text = sharedDefaults?.objectForKey("ribbon3") as? String
                    
                } else {
                    
                    label_title?.text = "Ring"
                    
                }
                
            } else {
                
                label_title?.text = "Ring"
                
            }

        }
        
        if indexPath.row == 4 {
            
            if sharedDefaults?.boolForKey("NCnotificationIsVisible4") == true {
                
                if sharedDefaults?.objectForKey("ribbon4") as? String != nil {
                    
                    label_title?.text = sharedDefaults?.objectForKey("ribbon4") as? String
                    
                } else {
                    
                    label_title?.text = "Pinky"
                    
                }
                
            } else {
                
                label_title?.text = "Pinky"
                
            }
            
        }
        
        cell?.selectionStyle = UITableViewCellSelectionStyle.None

        
        return cell!
        
    }
    
}
