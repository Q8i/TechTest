//
//  Converter.swift
//  TechTest
//
//  Created by Vahid  on 15.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import Foundation

class Converter {
    
    // TODO:
    // translates Quotes model to Money model.
    public class func convert(value:Float, source:Currency = .DOLLAR, target:Currency) -> Float {
        return value * getLatestRate(source: source, target: target)
    }
    
    public class func getLatestRate(source:Currency = .DOLLAR, target:Currency) -> Float {
        var rate: Float = 1.0
        // :+1: Swift 3
        if let quote = RatesConsumer.getRates().first(where: { $0.key == keyFor(currency: target) }) {
            rate = quote.rate ?? 1.0
        }
        return rate
    }
    
    // MARK: - Private Methods
    private class func keyFor(currency:Currency) -> String {
        var key = ""
        switch currency {
        case .CHF:
            key = RatesResponse.usdCHFKey
        case .EURO:
            key = RatesResponse.usdEURKey
        default:
            // TODO: not safe.. I'm risking here.
            key = ""
        }
        return key
    }
    
}
