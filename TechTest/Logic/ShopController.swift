//
//  ShopController.swift
//  TechTest
//
//  Created by Vahid  on 14.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import Foundation

class ShopController {
    
    static let sharedInstance : ShopController = {
        let instance = ShopController(array: [])
        return instance
    }()
    
    var items : [Item]
    
    // MARK: Init
    init( array : [Item]) {
        items = ShopController.buildItems()
    }

    // MARK: Private methods 
    // Build items (or fetch from db, plist, etc.)
    private class func buildItems() -> [Item] {
        return [
            Item(name: "tomatoes", unitPrice: 0.95, imagePath: "tomatoes"),
            Item(name: "eggs", unitPrice: 2.10, imagePath: "eggs"),
            Item(name: "milk", unitPrice: 1.30, imagePath: "milk"),
            Item(name: "beans", unitPrice: 0.73, imagePath: "beans")
        ]
    }
}
