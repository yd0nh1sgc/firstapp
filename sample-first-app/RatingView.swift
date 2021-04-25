//
//  RatingView.swift
//  sample-first-app
//
//  Created by 安爹的Mac on 16/5/7.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class RatingView: UIView {
    //MARK: 初始化属性
    var rating = 0 {
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let startCount = 5
    let stars = 5 // Apple原教程中此处有点问题
    
    //MARK: 初始化类
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for _ in 0..<startCount {
            let filledStarImage = UIImage(named: "heart-full")
            let emptyStarImage = UIImage(named: "heart-empty")
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted,.Selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingView.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for(index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * stars) + (spacing * (stars-1))
        return CGSize(width: width, height: buttonSize)
    }
    
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
}
