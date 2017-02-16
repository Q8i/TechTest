//
//  Quotes.swift
//  TechTest
//
//  Created by Vahid  on 12.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import Foundation
import ObjectMapper

class RatesResponse: Mappable {
    
    public static let successKey = "success"
    public static let keyPath = "quotes"
    public static let usdEURKey = "USDEUR"
    public static let usdCHFKey = "USDCHF"
    
//    private var currencyBaseSymbole:Currency = .DOLLAR
//    private var currencyRate:Float = 1.0
//    private var currencySymbole:String = ""
    
    var success   : Bool?
    var terms     : String?
    var privacy   : String?
    var timestamp : Double?
    var source    : String?
    
    var quotes    : [Quote]?
    
    ////// TO BE REMOVED LATER WHEN FAKING IS OVER
    convenience init() { self.init() }
    ///////////////////////////////////////////////
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        
        success    <- map[RatesResponse.successKey] // my prefered way
        terms      <- map["terms"]
        privacy    <- map["privacy"]
        timestamp  <- map["timestamp"]
        source     <- map["source"]
        
        var quotes: [String: Float]?
        quotes <- map["quotes"]
        self.quotes = quotes?.map {
            return Quote(key: $0.key, rate: $0.value)
        }
    }
}
