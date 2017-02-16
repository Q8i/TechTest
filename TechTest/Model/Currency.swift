//
//  Currency.swift
//  TechTest
//
//  Created by Vahid  on 11.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import Foundation

enum Currency {
    
    case CHF, DOLLAR, EURO
    
    func toString() -> String {
        switch self {
        case .CHF:
            return "CHF"
        case .EURO:
            return "EUR"
        default:
            return "USD"
        }
    }
    
    func toSymbol() -> String {
        switch self {
        case .CHF:
            return "CHF"
        case .EURO:
            return "€"
        default:
            return "$"
        }
    }

}

