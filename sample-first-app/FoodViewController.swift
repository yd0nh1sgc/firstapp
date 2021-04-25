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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var ratingControl: RatingView!
    @IBOutlet weak var contentField: UITextView!
    
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("time to load")
        foodNameTextField.delegate = self
        if let meal = meal {
            print(meal.foodName)
            navigationItem.title = meal.foodName
            foodNameTextField.text = meal.foodName
            contentField.text = meal.foodContent
            imageView.image = meal.foodPhoto
            ratingControl.rating = meal.rate
        }
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        contentField.layer.borderWidth = 1
        contentField.layer.cornerRadius = 5
        contentField.layer.borderColor = UIColor.grayColor().CGColor
        checkValidMealName()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Define textField
    func textFieldDidBeginEditing(textField: UITextField) {
        //Textfield开始编辑
        print("begining")
        saveBtn.enabled = false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // textfield控件结束编辑
        print("ending")
        checkValidMealName()
        navigationItem.title = textField.text

    }
    
    // MARK: define examin function
    func checkValidMealName(){
        let text = foodNameTextField.text ?? ""
        saveBtn.enabled = !text.isEmpty
    }
    
    
    // 控制app软键盘return后自动收回
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        foodNameTextField.resignFirstResponder()
        // contentField.resignFirstResponder()
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
    
    
    // 在通过segue 跳转后，传递参数到新的ViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveBtn === sender {
            let name = foodNameTextField.text ?? ""
            let photo = imageView.image
            let rating = ratingControl.rating
            let content = contentField.text
            
            meal = Meal(name: name,content: content, photo: photo!, rate: rating)
        }
    }
    
    
    
    // MARK: Action

    @IBAction func imgPicker(sender: AnyObject) {
        //手势响应
        print("被触摸")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true) { 
            
        }
    }
    
    // 触摸响应必须实现的方法
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
}

