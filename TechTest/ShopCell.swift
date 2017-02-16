//
//  ShopCell.swift
//  TechTest
//
//  Created by Vahid  on 14.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import UIKit

class ShopCell: UITableViewCell {
    
    static let identifier = "ShopCell"
    
    var delegate:ShopCellProtocol?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        item = Item()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        item = Item()
        super.init(coder: aDecoder)
    }
    
    var item:Item {
        didSet {
            self.itemImageView?.image = UIImage(named: item.imagePath!)
        }
    }
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var unitPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBAction func piuMeno(_ sender: UIStepper) {
        quantityLabel?.text = String(format: "%.0f", sender.value)
        delegate?.didChange(quantity: UInt(sender.value), forItem: self.item)
    }
    
    public func getQuantity() -> UInt {
        return UInt(quantityLabel?.text ?? "0" ) ?? 0
    }
}
