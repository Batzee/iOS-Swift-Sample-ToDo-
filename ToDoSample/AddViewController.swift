//
//  AddViewController.swift
//  ToDoSample
//
//  Created by Amalan Dhananjayan on 10/20/14.
//  Copyright (c) 2014 Batzee. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var tastTitle: UITextField! = UITextField()
    @IBOutlet weak var taskDetails: UITextView! = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonClick(sender: AnyObject) {
        //println("Save Clicked")
        
        var userdefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        
        var itemList:NSMutableArray? = userdefaults.objectForKey("itemList") as?NSMutableArray
        
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(tastTitle.text, forKey: "title")
        dataSet.setObject(taskDetails.text, forKey: "details")
        
        println("title value \(tastTitle.text) and description is \(taskDetails.text)")
        
        
        if((itemList) != nil){
            
            var newMutableList: NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemList!{
                newMutableList.addObject(dict as NSDictionary)
            }
            
            userdefaults.removeObjectForKey("itemList")
            newMutableList.addObject(dataSet)
            userdefaults.setObject(newMutableList, forKey: "itemList")
            
        }else{
            //userdefaults.removeObjectForKey("itemList")
            itemList=NSMutableArray()
            itemList!.addObject(dataSet)
            userdefaults.setObject(itemList, forKey: "itemList")
           
        }
        
        userdefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
