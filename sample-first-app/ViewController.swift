//
//  ViewController.swift
//  sample-first-app
//
//  Created by 安爹的Mac on 16/5/5.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var inputBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodNameTextField.delegate = self
        inputBtn.layer.cornerRadius = 5
        
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
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("ending")
        foodNameLbl.text = foodNameTextField.text
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        foodNameTextField.resignFirstResponder()
        return true
    }

    @IBAction func inputTextBtn(sender: AnyObject) {
        print("按钮被按下")
        foodNameLbl.text = "100斤大米"
        
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

