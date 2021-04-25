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
        // 调整初始化状态，如果NSobject长度为0，则调用模板
        if loadMeals()?.count > 0 {
            let savedMeals = loadMeals()!
            print("Ns数量\(savedMeals.count)")
            foodsArray += savedMeals
        } else {
            self.loadFood()
        }
        
    }
    
    
    // 调用模板函数
    func loadFood() {
        let photo1 = UIImage(named: "meal7")
        let content1 = "口味不同，日式沙拉酱有点甜（一般吃生的海鲜用），法式沙拉酱奶味重（水果沙拉适合用，沙拉酱分类：1.做肉类沙拉的2.做蔬菜类沙拉的3.做水果沙拉的"
        let food1 = Meal(name: "日式经典沙拉",content: content1, photo: photo1!, rate: 4)
        
        let photo2 = UIImage(named: "meal8")
        let content2 = "吃到令客人满足的好吃寿司,粉丝数量~UP UP。然后就会发现新的设备的食材。不要只满足于经典菜单哟、组合材料可以做出独创的寿司！把「乌贼」和「紫苏」，「鳗鱼」和「黄瓜」组合起来吧！"
        let food2 = Meal(name: "海鲜寿司拼盘",content: content2, photo: photo2!, rate: 5)
        
        let photo3 = UIImage(named: "meal9")
        let content3 = "1 胡萝卜，火腿切丝（要切细一点），胡萝卜用水煮一下至微软,否则不怎么好吃 2 把熟了的饭拌上寿司醋，薄薄的铺在海苔上，（盖过饭即可，否则太粗） 3 把熟了的饭拌上寿司醋，薄薄的铺在海苔上，摆上胡萝卜什么的，挤上沙拉酱，裹起来，最后切好装盘，做装饰。 OK，大功告成~"
        let food3 = Meal(name: "海鲜胡萝卜寿司",content: content3, photo: photo3!, rate: 3)

        let photo4 = UIImage(named: "meal10")
        let content4 = "主料：鲜三文鱼500克,橄榄油适量。调料：（1）葱姜水,盐,玫瑰露酒石酸各适量。（2）哈密瓜汁,葡萄汁,白醋,吉士粉,香菜,盐,白糖各适量。"
        let food4 = Meal(name: "生煎三文鱼",content: content4, photo: photo4!, rate: 5)
        
        let photo5 = UIImage(named: "meal11")
        let content5 = "看上去是颗颗透明的“鱼子酱”，咬下去却是蜜瓜汁的味道。"
        let food5 = Meal(name: "鲜果鱼子酱",content: content5, photo: photo5!, rate: 4)
        
        // self.foodsArray += [food1!, food2!, food3!, food4!, food5!]
        // 变换一种增加数组元素的方式
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodsArray.count
    }
    
    /*
    // 该方法实现调整TableView上边距
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }*/

    // 定义单个cell
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
            // 此处与原程序有区别，查询stackoverflow，有答案
            // http://stackoverflow.com/questions/28573635/destinationviewcontroller-segue-and-uinavigationcontroller-swift
            let nav = segue.destinationViewController as! UINavigationController
            let foodDetailViewController = nav.topViewController as! DetailViewController

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
    // 定义数据保存和加载方法
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
