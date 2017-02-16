//
//  ApiConfigProvider.swift
//  TechTest
//
//  Created by Vahid  on 11.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import Foundation

public class ApiConfigProvider {
    
    /*
    public static let endpoint = "http://api.fixer.io/latest"
    public static let base = "base"
    public static let symbols = "symbols"
    
    
    class func getEndpoint() -> String {
        return ApiConfigProvider.endpoint
    }
    
    class func getCompleteUrlWith(base:String, target:String) -> String {
        let url = getEndpoint() + "?" + ApiConfigProvider.base + "=" + base
        return url + "&" + ApiConfigProvider.symbols + "=" + target
    }
    
    /*
     GET http://api.fixer.io/latest?base=USD&symbols=CHF,EUR
     */
    
    class func getCoversionParameterWith(base:String, target:String) -> [String : String] {
        return [
            ApiConfigProvider.base : base,
            ApiConfigProvider.symbols : target
        ]
    }*/
    
    // MARK: CurrencyLayer API
    public static let liveEndpoint = "http://apilayer.net/api/live"
    public static let accessKey = "44ea01083f61693d4f8a3fed7755f44e"
    public static let currencies = "EUR,CHF"

    // the easy way
    class func getCompelteLiveUrl() -> String {
        return liveEndpoint + "?" + "access_key=" + accessKey + "&currencies=" + currencies + "&format=1"
    }
    
    // the much prefered way
    class func getLiveEndpoint() -> String {
        return ApiConfigProvider.liveEndpoint;
    }
    
    // params for the prefered way
    class func getLiveParameters() -> [String : String]
    {
        return ["access_key"    : accessKey,
                "currencies"    : currencies,
                "fromate"       : "1"]
    }
}
