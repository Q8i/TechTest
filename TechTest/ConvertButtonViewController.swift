//
//  ConvertButtonViewController.swift
//  TechTest
//
//  Created by Vahid  on 12.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import UIKit

class ConvertButtonsViewController: ViewController {
    
    @IBOutlet weak var dollarButton: UIButton!
    @IBOutlet weak var frankButton: UIButton!
    @IBOutlet weak var euroButton: UIButton!
 
    public static let convertButtonTapped = Notification.Name(rawValue: "ConvertButtonTappedNotificationName")
    
    public static let convertToCurrencyKey = "ConvertToCurrency"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func tapped(_ sender: UIButton) {
        var currency = Currency.DOLLAR
        
        switch sender.tag {
        case 10:
            currency = .EURO
        case 20:
            currency = .CHF
        default:
            currency = .DOLLAR
        }
                
        let notification = Notification(
            name: ConvertButtonsViewController.convertButtonTapped as Notification.Name,
            object: sender,
            userInfo: [ConvertButtonsViewController.convertToCurrencyKey : currency])
        
        // post notification
        NotificationCenter.default.post(notification)
    }
    
}
