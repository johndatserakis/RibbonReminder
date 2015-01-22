//
//  ViewController.swift
//  Ribbon Reminder
//
//  Created by John Datserakis on 11/7/14.
//  Copyright (c) 2014 John Datserakis. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var indexPathHolder = 0
    var overlayView: UIView!
    var alertView: UIView!
    var animator: UIDynamicAnimator!
    var attachmentBehavior : UIAttachmentBehavior!
    var snapBehavior : UISnapBehavior!
    
    @IBOutlet weak var tableMain: UITableView!
    @IBOutlet var textFieldAdd: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the animator
        animator = UIDynamicAnimator(referenceView: view)

        textFieldAdd?.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemChanged:", name: "reloadTableViewData", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableMain.reloadData()
    }
    
    func itemChanged(sender: AnyObject) {
        tableMain.reloadData()
        
    }
    
    //Delegate method
    func textFieldDidBeginEditing(textField: UITextField!) {
        println("began editing")
        
    }
    
    //Delegate method
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        textFieldAdd?.endEditing(true)
    }

    @IBAction func ribbon_button(sender: UIButton) {
        println("ribbon pressed")
    }

    @IBAction func question_button(sender: UIButton) {
        println("question pressed")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func detailTapped(sender: UIButton) {

        var cell = sender.superview as UITableViewCell
        var indexPath = tableMain.indexPathForCell(cell)
        
        if indexPath?.row == 0 {
            println("Row 1 was clicked")
            indexPathHolder = 0
            // Create the dark background view and the alert view
            createOverlay()
            createAlert()
            showAlert()
            textFieldAdd.becomeFirstResponder()
            
        }
        
        if indexPath?.row == 1 {
            println("Row 2 was clicked")
            indexPathHolder = 1
            createOverlay()
            createAlert()
            showAlert()
            textFieldAdd.becomeFirstResponder()

        }
        
        if indexPath?.row == 2 {
            println("Row 3 was clicked")
            indexPathHolder = 2
            createOverlay()
            createAlert()
            showAlert()
            textFieldAdd.becomeFirstResponder()

        }
        
        if indexPath?.row == 3 {
            println("Row 4 was clicked")
            indexPathHolder = 3
            createOverlay()
            createAlert()
            showAlert()
            textFieldAdd.becomeFirstResponder()
            
        }
        
        if indexPath?.row == 4 {
            println("Row 5 was clicked")
            indexPathHolder = 4
            createOverlay()
            createAlert()
            showAlert()
            textFieldAdd.becomeFirstResponder()
            
        }
        
    }
    
    func removeTapped(sender: UIButton) {
        
        var cell = sender.superview as UITableViewCell
        var indexPath = tableMain.indexPathForCell(cell)
        
        if indexPath?.row == 0 {
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.removeObjectForKey("textfield0")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.removeObjectForKey("ribbon0")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible0")
            sharedDefaults?.synchronize()
            
        }
        
        if indexPath?.row == 1 {
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.removeObjectForKey("textfield1")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible1")
            sharedDefaults?.removeObjectForKey("ribbon1")
            sharedDefaults?.synchronize()

        }
        
        if indexPath?.row == 2 {
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.removeObjectForKey("textfield2")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible2")
            sharedDefaults?.removeObjectForKey("ribbon2")
            sharedDefaults?.synchronize()
            
        }
        
        if indexPath?.row == 3 {
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.removeObjectForKey("textfield3")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible3")
            sharedDefaults?.removeObjectForKey("ribbon3")
            sharedDefaults?.synchronize()
            
        }
        
        if indexPath?.row == 4 {
            var userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.removeObjectForKey("textfield4")
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
            sharedDefaults?.setBool(false, forKey: "NCnotificationIsVisible4")
            sharedDefaults?.removeObjectForKey("ribbon4")
            sharedDefaults?.synchronize()
            
        }
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            //creating cell
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
 
        }

        //Label Work
        var label_title : UILabel? = self.view.viewWithTag(1) as? UILabel;
        var newFont = UIFont(name: "Wawati TC", size: 20)
        label_title?.font = newFont
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        if indexPath.row == 0 {
        
        if userDefaults.stringForKey("textfield0") != nil {

            label_title?.text = userDefaults.stringForKey("textfield0")
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "remove_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "removeTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
            
        } else {
            
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "add_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "detailTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
            label_title?.text = "Thumb"
        
            }
            
        }
        
        if indexPath.row == 1 {
        
        if userDefaults.stringForKey("textfield1") != nil {
            label_title?.text = userDefaults.stringForKey("textfield1")
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "remove_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "removeTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
        } else {
            
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "add_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "detailTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
            label_title?.text = "Index"
            
            }
            
        }

        if indexPath.row == 2 {
        
        if userDefaults.stringForKey("textfield2") != nil {
            label_title?.text = userDefaults.stringForKey("textfield2")
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "remove_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "removeTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
        } else {
            
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "add_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "detailTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
            label_title?.text = "Middle"
            
            }
            
        }
        
        if indexPath.row == 3 {
            
        if userDefaults.stringForKey("textfield3") != nil {
            label_title?.text = userDefaults.stringForKey("textfield3")
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "remove_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "removeTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
        } else {
            
            var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
            var accessoryImage = UIImage(named: "add_button 2_002")
            accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
            accessoryButton.addTarget(self, action: "detailTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.accessoryView = accessoryButton
            label_title?.text = "Ring"
            
            }
            
        }
        
        if indexPath.row == 4 {
            
            if userDefaults.stringForKey("textfield4") != nil {
                label_title?.text = userDefaults.stringForKey("textfield4")
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "remove_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "removeTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                
            } else {
                
                var accessoryButton = UIButton(frame: CGRectMake(0, 0, 40, 33))
                var accessoryImage = UIImage(named: "add_button 2_002")
                accessoryButton.setImage(accessoryImage, forState: UIControlState.Normal)
                accessoryButton.addTarget(self, action: "detailTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                cell?.accessoryView = accessoryButton
                label_title?.text = "Pinky"
                
            }
            
        }
        

        return cell!
        
    }

    func createOverlay() {
        overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = UIColor(red: 255/255, green: 239/255, blue: 229/255, alpha: 1.0)
        overlayView.alpha = 0.0
        view.addSubview(overlayView)
    }
    
    func createAlert() {

        var alertWidth: CGFloat = 250
        var alertHeight: CGFloat = 200
        
        if self.view.frame.width == 414.0 {
            println("iPhone 6")
            alertWidth = 350
        }
        
        if self.view.frame.width == 375.0 {
            println("iPhone 6")
            alertWidth = 300
        }
        
        if self.view.frame.width == 320.0 {
            println("iPhone 5/4s")
        }
        
        var alertViewFrame: CGRect = CGRectMake(0, 0, alertWidth, alertHeight)
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.whiteColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.shadowOffset = CGSizeMake(0, 5);
        alertView.layer.shadowOpacity = 0.3;
        alertView.layer.shadowRadius = 10.0;
        
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.setTitle("Dismiss", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.redColor()
        button.frame = CGRectMake(0, 0, alertWidth, 40.0)
        button.tintColor = UIColor.whiteColor()
        button.layer.cornerRadius = 10
        button.addTarget(self, action: Selector("dismissAlert"), forControlEvents: UIControlEvents.TouchUpInside)
        alertView.addSubview(button)
        view.addSubview(alertView)

        var label = UILabel(frame: CGRectMake(0, 0, alertWidth, 125))
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.font = UIFont(name: "Wawati TC", size: 15.0)
        
        if indexPathHolder == 0 {
            label.text = "Add a ribbon to your thumb"
        }
        
        if indexPathHolder == 1 {
            label.text = "Add a ribbon to your index finger"
        }
        
        if indexPathHolder == 2 {
           label.text = "Add a ribbon to your middle finger"
        }
        
        if indexPathHolder == 3 {
            label.text = "Add a ribbon to your ring finger"
        }
        
        if indexPathHolder == 4 {
            label.text = "Add a ribbon to your pinky"
        }
        
        alertView.addSubview(label)
        textFieldAdd = UITextField(frame: CGRectMake(10, 90, alertWidth - 20, 40))
        textFieldAdd.borderStyle = UITextBorderStyle.RoundedRect
        alertView.addSubview(textFieldAdd)
        
        var buttonGo = UIButton.buttonWithType(UIButtonType.System) as UIButton
        buttonGo.setTitle("Save", forState: UIControlState.Normal)
        buttonGo.titleLabel?.font = UIFont(name: "Wawati TC", size: 18.0)
        buttonGo.tintColor = UIColor.whiteColor()
        buttonGo.backgroundColor = UIColor.greenColor()
        buttonGo.frame = CGRectMake(100, 145, alertWidth - 200, 40)
        buttonGo.addTarget(self, action: Selector("saveGo"), forControlEvents: UIControlEvents.TouchUpInside)
        buttonGo.layer.cornerRadius = 10.0
        
        alertView.addSubview(buttonGo)

        if UIScreen.mainScreen().bounds.size.height ==  480 {
            
            println("iPhone 4/4s")
            alertView.frame = CGRectMake(0, 0, alertWidth, 140)
            textFieldAdd.frame = CGRectMake(10, 75, alertWidth - 20, 25)
            label.frame = CGRectMake(0, -5, alertWidth, 125)
            buttonGo.frame = CGRectMake(100, 110, alertWidth - 200, 25)
        }

    }
    
    func saveGo() {
        if textFieldAdd.text == "" {
            
        } else {
            var userDefaults = NSUserDefaults.standardUserDefaults()
            
            if indexPathHolder == 0 {
                userDefaults.setObject(textFieldAdd.text, forKey: "textfield0")
                userDefaults.setBool(true, forKey: "notificationIsVisible0")
                let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
                sharedDefaults?.setObject(userDefaults.objectForKey("textfield0"), forKey: "ribbon0")
                sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible0")
                sharedDefaults?.synchronize()
            }
            
            if indexPathHolder == 1 {
                userDefaults.setObject(textFieldAdd.text, forKey: "textfield1")
                userDefaults.setBool(true, forKey: "notificationIsVisible1")
                let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
                sharedDefaults?.setObject(userDefaults.objectForKey("textfield1"), forKey: "ribbon1")
                sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible1")
                sharedDefaults?.synchronize()

            }
            
            if indexPathHolder == 2 {
                userDefaults.setObject(textFieldAdd.text, forKey: "textfield2")
                userDefaults.setBool(true, forKey: "notificationIsVisible2")
                let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
                sharedDefaults?.setObject(userDefaults.objectForKey("textfield2"), forKey: "ribbon2")
                sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible2")
                sharedDefaults?.synchronize()

            }
            
            if indexPathHolder == 3 {
                userDefaults.setObject(textFieldAdd.text, forKey: "textfield3")
                userDefaults.setBool(true, forKey: "notificationIsVisible3")
                let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
                sharedDefaults?.setObject(userDefaults.objectForKey("textfield3"), forKey: "ribbon3")
                sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible3")
                sharedDefaults?.synchronize()

            }
            
            if indexPathHolder == 4 {
                userDefaults.setObject(textFieldAdd.text, forKey: "textfield4")
                userDefaults.setBool(true, forKey: "notificationIsVisible4")
                let sharedDefaults = NSUserDefaults(suiteName: "group.RibbonSharingDefaults")
                sharedDefaults?.setObject(userDefaults.objectForKey("textfield4"), forKey: "ribbon4")
                sharedDefaults?.setBool(true, forKey: "NCnotificationIsVisible4")
                sharedDefaults?.synchronize()

            }
            
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTableViewData", object: nil)
            textFieldAdd.endEditing(true)
            dismissAlert()
        }
        
    }
    
    func showAlert() {
        if (alertView == nil) {
            createAlert()
        }
        
        createGestureRecognizer()
        animator.removeAllBehaviors()
        UIView.animateWithDuration(0.4) {
            self.overlayView.alpha = 1.0
        }
        
        alertView.alpha = 1.0
        var snapBehaviour: UISnapBehavior = UISnapBehavior(item: alertView, snapToPoint: CGPointMake(view.center.x, view.center.y - 200))
        animator.addBehavior(snapBehaviour)
    }
    
    func dismissAlert() {
        
        animator.removeAllBehaviors()
        
        var gravityBehaviour: UIGravityBehavior = UIGravityBehavior(items: [alertView])
        gravityBehaviour.gravityDirection = CGVectorMake(0.0, 10.0);
        animator.addBehavior(gravityBehaviour)
        
        var itemBehaviour: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [alertView])
        itemBehaviour.addAngularVelocity(CGFloat(-M_PI_2), forItem: alertView)
        animator.addBehavior(itemBehaviour)

        UIView.animateWithDuration(0.4, animations: {
            self.overlayView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
        })
        
    }
    
    @IBAction func showAlertView(sender: UIButton) {
        showAlert()
    }
    
    func createGestureRecognizer() {
        let panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePan:"))
        view.addGestureRecognizer(panGestureRecognizer)
    }

    func handlePan(sender: UIPanGestureRecognizer) {
        
        if (alertView != nil) {
            let panLocationInView = sender.locationInView(view)
            let panLocationInAlertView = sender.locationInView(alertView)
            
            if sender.state == UIGestureRecognizerState.Began {
                animator.removeAllBehaviors()
                
                let offset = UIOffsetMake(panLocationInAlertView.x - CGRectGetMidX(alertView.bounds), panLocationInAlertView.y - CGRectGetMidY(alertView.bounds));
                attachmentBehavior = UIAttachmentBehavior(item: alertView, offsetFromCenter: offset, attachedToAnchor: panLocationInView)
                
                animator.addBehavior(attachmentBehavior)
            }
            else if sender.state == UIGestureRecognizerState.Changed {
                attachmentBehavior.anchorPoint = panLocationInView
            }
            else if sender.state == UIGestureRecognizerState.Ended {
                animator.removeAllBehaviors()
                
                snapBehavior = UISnapBehavior(item: alertView, snapToPoint: CGPointMake(view.center.x, view.center.y - 200))
                animator.addBehavior(snapBehavior)
                
                if sender.translationInView(view).y > 100 {
                    dismissAlert()
                }
            }
        }
        
    }
    
    
}

