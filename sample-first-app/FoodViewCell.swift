//
//  FoodViewCell.swift
//  sample-first-app
//
//  Created by Mainzxq on 16/5/6.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class FoodViewCell: UITableViewCell {

    @IBOutlet weak var foodPhoto: UIImageView!
    @IBOutlet weak var foodNameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        foodPhoto.clipsToBounds = true
        
        // 解决图片超出边界的问题
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}