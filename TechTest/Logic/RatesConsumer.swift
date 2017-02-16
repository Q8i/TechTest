//
//  CurrencyConverterConsumer.swift
//  TechTest
//
//  Created by Vahid  on 11.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class RatesConsumer {
    
    // MARK: - Alamofire request
    public class func getRates() -> [Quote] {
        let rates = getResponse()?.quotes ?? [
            // But for now, we're faking data
            // TODO: Remove faking when mapping is done
            Quote(key: RatesResponse.usdCHFKey, rate: 1.02),
            Quote(key: RatesResponse.usdEURKey, rate: 0.89)
        ]
        
        return rates
    }
    
    private class func getResponse() -> RatesResponse? {
        var rates:RatesResponse?
        Alamofire.request(
            ApiConfigProvider.getCompelteLiveUrl(),
            method: .get,
            encoding: JSONEncoding.default,
            headers: nil)
            .validate()
            .responseJSON { response in 
                
                switch(response.result) {
                case .success(_):
                    if let value = response.result.value {
                        print("==== SUCCESS =====")
                        print(value)
                        print("==== ======= =====")
                    }
                    if let json = response.result.value as? [String : Any] {
//                        mapping to happen later
//                        let rate = RatesResponse(map: data as! Map)
//                        if (rate?.quotes) != nil {
//                            print("Quotes: \(rate?.quotes)")
//                        }
                        rates = RatesResponse(map: Map(mappingType: .fromJSON, JSON: json)) ?? nil
                        print("==== RATES SET =====")
                        print(rates?.toJSONString(prettyPrint: true) ?? " !!!!!! ")
                        print("==== ======= =====")
                    }
                    break
                    
                case .failure(_):
                    print("==== FAILURE =====")
                    print("Request: \(response.request as Any)")
                    print("Response: \(response as Any)")
                    print(response.result.error as Any)
                    // we can alert the user if needed
                    break
                }
        }
        return rates
    }

    /*
    private class func requestLiveRate() {
        Alamofire.request(
            ApiConfigProvider.getLiveEndpoint(),
            method: .get,
            parameters: ApiConfigProvider.getQuotesParameters(),
            encoding: JSONEncoding.default,
            headers: nil)
            .responseObject(keyPath: QuotesResponse.keyPath) { (response: DataResponse<QuotesResponse>) in

                expectation.fulfill()

                let quoteReponse = response.result.value
                
        }
    }
    
    public func responseObject<QuotesResponse: Mappable>(queue: dispatch_queue_t? = nil, keyPath: String? = nil, mapToObject object: QuotesResponse? = nil, completionHandler: DataResponse<QuotesResponse> -> Void) -> Self

    
    /*
     GET http://api.fixer.io/latest?base=USD&symbols=CHF,EUR
     */
    private class func getCurrentcy(completionHandler: @escaping (NSDictionary?, NSError?) -> ()) {
        
        Alamofire.request("http://api.fixer.io/latest?base=USD",encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value as? NSDictionary, nil)
                case .failure(let error):
                    completionHandler(nil, error as NSError?)
                }
        }
    }*/
}
