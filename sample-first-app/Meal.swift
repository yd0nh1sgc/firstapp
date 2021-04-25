//
//  Meal.swift
//  sample-first-app
//
//  Created by Mainzxq on 16/5/6.
//  Copyright © 2016年 安爹的苹果机. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: Property

    var foodName: String
    var foodContent: String
    var foodPhoto: UIImage?
    var rate: Int
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let contentKey = "content"
        static let photoKey = "photo"
        static let rateKey = "rate"
    }
    
    
    init?(name: String,content: String, photo: UIImage?, rate: Int){
        self.foodName = name
        self.foodPhoto = photo
        self.rate = rate
        self.foodContent = content
            
        super.init()
            
        if name.isEmpty || rate < 0 {
            return nil
        }
    }
    

    // MARK: NScoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(foodName, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(foodPhoto, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(foodContent, forKey: PropertyKey.contentKey)
        aCoder.encodeInteger(rate, forKey: PropertyKey.rateKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let content = aDecoder.decodeObjectForKey(PropertyKey.contentKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rate = aDecoder.decodeIntegerForKey(PropertyKey.rateKey)
        self.init(name: name,content: content, photo: photo, rate: rate)
    }

}

