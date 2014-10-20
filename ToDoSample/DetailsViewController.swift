//
//  DetailsViewController.swift
//  ToDoSample
//
//  Created by Amalan Dhananjayan on 10/20/14.
//  Copyright (c) 2014 Batzee. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    var todoData:NSDictionary = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.userInteractionEnabled=false
        descriptionTextField.userInteractionEnabled=false
        
        titleTextField.text=todoData.objectForKey("title") as String
        descriptionTextField.text=todoData.objectForKey("details") as String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonClicked(sender: AnyObject) {
        
        var userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var itemListArray:NSMutableArray = userDefault.objectForKey("itemList") as NSMutableArray
        
        var mutableItemList: NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as NSDictionary)
        }
        
        mutableItemList.removeObject(todoData)
        userDefault.removeObjectForKey("itemList")
        userDefault.setObject(mutableItemList, forKey: "itemList")
        userDefault.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
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
