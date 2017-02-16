//
//  ShopTableViewController.swift
//  TechTest
//
//  Created by Vahid  on 14.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import UIKit

class ShopTableViewController: UITableViewController, ShopCellProtocol {
    
    private var currentCurrency:Currency = .DOLLAR
    private var currentRate:Float = 1.0
    
    private var totalAmount:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weak var wSelf = self
        NotificationCenter.default.addObserver(
            forName: ConvertButtonsViewController.convertButtonTapped,
            object: nil,
            queue: OperationQueue.main) { (convertCurrencyNotification : Notification) in
                if let currency = convertCurrencyNotification.userInfo?[ConvertButtonsViewController.convertToCurrencyKey] as! Currency? {
                    print("-------------------------------------------------")
                    print("Currency to convert: " + currency.toString())
                    print("-------------------------------------------------")
                    wSelf?.updateUI(selectedCurrency: currency)
                }
        }
        
    }
        
    deinit {
        NotificationCenter.default.removeObserver(Any.self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShopController.sharedInstance.items.count
    }
    
    // using controllers or view models?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = ShopController.sharedInstance.items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopCell.identifier, for: indexPath) as! ShopCell
        
        //I still prefer the view models
        cell.item = item
        cell.unitPriceLabel?.text = getPriceUnitFor(item: item)
        cell.delegate = self
        
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let width = tableView.frame.width
        let height = tableView.sectionHeaderHeight
        let header = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        let midRect = header.frame.insetBy(dx: width/4, dy: height/4)
        let label = UILabel(frame:midRect)
        label.text = getTotalAmountString()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "Marker Felt", size: label.font.pointSize)!
        header.backgroundColor = UIColor.black
        header.addSubview(label)
        return header
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let checkoutVC = segue.destination as? CheckoutViewController {
            checkoutVC.totalAmount = self.getTotalAmountForCheckout()
            checkoutVC.currentCurrency = self.currentCurrency
        }
    }
    
    func didChange(quantity: UInt, forItem: Item) {
        totalAmount = getTotalAmountForCheckout()
        tableView.reloadData()
    }
    
    // MARK: Private methods
    private func updateUI(selectedCurrency:Currency) {
        print(" Notified to Convert to " + selectedCurrency.toString())
        self.currentCurrency = selectedCurrency
        self.currentRate = Converter.getLatestRate(target: self.currentCurrency)
        
        self.tableView.reloadData()
    }
    
    // MARK: Conroller logic that can go into ViewModel :|
    private func getPriceUnitFor(item: Item) -> String {
        return Util.moneyToSymbol(value: item.unitPrice! * self.currentRate, currency: self.currentCurrency)
    }
    
    private func getTotalAmountForCheckout() -> Float {
        var total:Float = 0.0
        
        for row in 0..<ShopController.sharedInstance.items.count {
            let indexPath = IndexPath(row: row, section: 0)
            let item = ShopController.sharedInstance.items[row]
            if let cell = self.tableView.cellForRow(at: indexPath) as? ShopCell, let price = item.unitPrice {
                total += Float(cell.getQuantity()) * price
            }
        }
        return total
    }
    
    
    private func getTotalAmountString() -> String {
        let total = Converter.convert(value: totalAmount, target: currentCurrency)
        return "Total: " + Util.moneyToString(value: total, currency: currentCurrency)
    }
}
