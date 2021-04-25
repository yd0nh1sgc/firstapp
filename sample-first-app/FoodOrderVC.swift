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
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // if let savedMeals = loadMeals() {
        if loadMeals()?.count > 0 {
            let savedMeals = loadMeals()!
            print("Ns数量\(savedMeals.count)")
            foodsArray += savedMeals
        } else {
            self.loadFood()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    func loadFood() {
        let photo1 = UIImage(named: "meal7")
        let food1 = Meal(name: "日式经典沙拉", photo: photo1!, rate: 4)
        
        let photo2 = UIImage(named: "meal8")
        let food2 = Meal(name: "海鲜寿司拼盘", photo: photo2!, rate: 5)
        
        let photo3 = UIImage(named: "meal9")
        let food3 = Meal(name: "海鲜胡萝卜寿司", photo: photo3!, rate: 3)

        let photo4 = UIImage(named: "meal10")
        let food4 = Meal(name: "生煎三文鱼", photo: photo4!, rate: 5)
        
        let photo5 = UIImage(named: "meal11")
        let food5 = Meal(name: "鲜果鱼子酱", photo: photo5!, rate: 4)
        
        // self.foodsArray += [food1, food2, food3]
        self.foodsArray.append(food1!)
        self.foodsArray.append(food2!)
        self.foodsArray.append(food3!)
        self.foodsArray.append(food4!)
        self.foodsArray.append(food5!)
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
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("foodCell", forIndexPath: indexPath) as! FoodViewCell
        
        let meal = self.foodsArray[indexPath.row]
        // Configure the cell...
        cell.foodNameLbl.text = meal.foodName
        cell.foodPhoto.image = meal.foodPhoto
        cell.ratingView.rating = meal.rate

        return cell
    }

    

    /* leftItem */
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    /* leftItem */
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            foodsArray.removeAtIndex(indexPath.row)
            saveMeals()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


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

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
            print("try display detail")
            let foodDetailViewController = segue.destinationViewController as! FoodViewController

            if let selectedFoodCell = sender as? FoodViewCell {
                let indexPath = tableView.indexPathForCell(selectedFoodCell)!
                let selectedFood = foodsArray[indexPath.row]
                foodDetailViewController.meal = selectedFood
            }
        } else if segue.identifier == "AddItem" {
            print("adding new one")
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? FoodViewController, meal = sourceViewController.meal{
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                foodsArray[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                
                let newIndexPath = NSIndexPath(forRow: foodsArray.count, inSection: 0)
                foodsArray.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                saveMeals()
            }
        }
    }
    
    // MARK: NScoding
    
    func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(foodsArray, toFile: Meal.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
        
    }
    
    func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
    }
    

}
