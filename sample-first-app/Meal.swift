//
//  Meal.swift
//  sample-first-app
//
//  Created by Mainzxq on 16/5/6.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class Meal: NSObject {
        var foodName: String?
        var foodPhoto: UIImage?
        var rate: Int?
        
        init(name: String, photo: UIImage, rate: Int){
            self.foodName = name
            self.foodPhoto = photo
            self.rate = rate
    }
}

