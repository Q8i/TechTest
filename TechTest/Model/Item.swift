//
//  Item.swift
//  TechTest
//
//  Created by Vahid  on 14.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import Foundation
import Money

class Item {
    
    var name:String?
    var unitPrice:Float?
    var imagePath:String?
    
    convenience init(name:String, unitPrice:Float, imagePath:String) {
        self.init()
        
        self.name = name
        self.unitPrice = unitPrice
        self.imagePath = imagePath
    }
}
