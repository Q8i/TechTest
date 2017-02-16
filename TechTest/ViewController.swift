//
//  ViewController.swift
//  TechTest
//
//  Created by Vahid  on 09.02.17.
//  Copyright © 2017 Vahid . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(Any.self)
    }
    
}

