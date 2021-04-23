//
//  FoodOrderVC.swift
//  sample-first-app
//
//  Created by Mainzxq on 16/5/6.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class FoodOrderVC: UITableViewController {


    
    var foodsArray = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadFood()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    func loadFood() {
        let photo1 = UIImage(named: "meal1")
        let food1 = Meal(name: "", photo: photo1!, rate: 4)
        
        let photo2 = UIImage(named: "meal2")
        let food2 = Meal(name: "", photo: photo2!, rate: 5)
        
        let photo3 = UIImage(named: "meal3")
        let food3 = Meal(name: "", photo: photo3!, rate: 3)
        
        
        self.foodsArray += [food1, food2, food3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.foodsArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("foodCell", forIndexPath: indexPath) as! FoodViewCell
        
        let meal = self.foodsArray[indexPath.row]
        // Configure the cell...
        cell.foodNameLbl.text = meal.foodName
        cell.foodDescriptLbl.text = "waiting for add"
        cell.foodPhoto.image = meal.foodPhoto

        return cell
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
