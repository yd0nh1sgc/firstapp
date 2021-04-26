//
//  DetailViewController.swift
//  sample-first-app
//
//  Created by Mainzxq on 16/5/9.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    var meal: Meal!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let meal = meal {
            navigationItem.title = meal.foodName
            titleLbl.text = meal.foodName
            imageView.image = meal.foodPhoto
            ratingView.rating = meal.rate
            contentLbl.text = meal.foodContent
        }
        
        imageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if editBtn === sender {
            let foodDetailViewController = segue.destinationViewController as! FoodViewController
            let name = titleLbl.text!
            let content = contentLbl.text!
            let photo = imageView.image!
            let rating = ratingView.rating
            print(name)
            meal = Meal(name: name, content: content, photo: photo, rate: rating)
            foodDetailViewController.meal = meal
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelBtn(sender: AnyObject) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode{
            print("dismiss")
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            print("no dismiss")
            navigationController!.popViewControllerAnimated(true)
        }
    }

}
