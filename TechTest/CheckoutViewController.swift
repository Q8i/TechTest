//
//  CheckoutViewController.swift
//  TechTest
//
//  Created by Vahid  on 15.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var checkoutImage: UIImageView!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var totalAmount:Float = 0.0
    var currentCurrency:Currency = .DOLLAR
    private var currentAmount:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrency(currency: currentCurrency)
        
        // handle notification to change currency
        weak var wSelf = self
        NotificationCenter.default.addObserver(
            forName: ConvertButtonsViewController.convertButtonTapped,
            object: nil,
            queue: OperationQueue.main) { (convertCurrencyNotification : Notification) in
                if let currency = convertCurrencyNotification.userInfo?[ConvertButtonsViewController.convertToCurrencyKey] as! Currency? {
                    print("-------------------------------------------------")
                    print("Currency to convert: " + currency.toString())
                    print("-------------------------------------------------")
                    wSelf?.updateCurrency(currency: currency)
                }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(Any.self)
    }

    private func updateCurrency(currency: Currency) {
        currentCurrency = currency
        currentAmount = Converter.convert(value: totalAmount, target: currentCurrency)
        updateUI()
    }
    
    private func updateUI() {
        updateUI(total: currentAmount, currency: currentCurrency)
    }
    
    private func updateUI(total:Float, currency:Currency) {
        setCheckoutImageWith(text: Util.moneyToSymbol(value: total, currency: currency))
        totalLabel.text = "Total: " + Util.moneyToSymbol(value: total, currency: currency)
    }
    
    private func setCheckoutImageWith(text:String) {
        let midpoint = CGPoint(x: checkoutImage.bounds.midX-10, y: checkoutImage.bounds.midY-20)
        checkoutImage.image = Util.textToImage(drawText: text, inImage: #imageLiteral(resourceName: "checkout-cart"), atPoint: midpoint)
    }
}
