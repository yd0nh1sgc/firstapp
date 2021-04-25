//
//  FoodViewController.swift
//  sample-first-app
//
//  Created by 安爹的Mac on 16/5/5.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var inputBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var ratingControl: RatingView!
    
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodNameTextField.delegate = self
        if let meal = meal {
            navigationItem.title = meal.foodName
            foodNameTextField.text = meal.foodName
            imageView.image = meal.foodPhoto
            ratingControl.rating = meal.rate
        }
        inputBtn.layer.cornerRadius = 5
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        checkValidMealName()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        //Textfield控件方法
        print("begining")
        saveBtn.enabled = false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("ending")
        checkValidMealName()
        navigationItem.title = textField.text

    }
    
    func checkValidMealName(){
        let text = foodNameTextField.text ?? ""
        saveBtn.enabled = !text.isEmpty
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        foodNameTextField.resignFirstResponder()
        return true
    }
    
    
    //MARK: Navigation
    @IBAction func cancelEdit(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode{
        dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveBtn === sender {
            let name = foodNameTextField.text ?? ""
            let photo = imageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo!, rate: rating)
        }
    }
    
    
    
    // MARK: Action
    @IBAction func inputTextBtn(sender: AnyObject) {
        print("按钮被按下")

        
    }

    @IBAction func imgPicker(sender: AnyObject) {
        //手势响应
        print("被触摸")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true) { 
            
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
}

