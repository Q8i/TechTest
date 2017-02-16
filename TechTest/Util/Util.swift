//
//  Util.swift
//  TechTest
//
//  Created by Vahid  on 15.02.17.
//  Copyright © 2017 Vahid. All rights reserved.
//

import UIKit

class Util {
    
    // Inspired by :http://stackoverflow.com/a/28907826
    public class func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Marker Felt", size: 28)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,
            ] as [String : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    public class func moneyToString(value: Float, currency: Currency) -> String {
        return currency.toString() + " " +  String(format: "%.2f", value)
    }

    public class func moneyToSymbol(value: Float, currency: Currency) -> String {
        return currency.toSymbol() + " " +  String(format: "%.2f", value)
    }
}
