//
//  UIColor+Extentions.swift
//  MosmetroNew
//
//  Created by Павел Кузин on 24.11.2020.
//  Copyright © 2020 Гусейн Римиханов. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     Boolean Parameter for determine whether a selected UIColor (for ex picked by the user) is dark or bright, so change the color of a line of text that sits on top of that color, for better readability.
     */
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.5
    }
    
    /**
     The function recycles the HEX string and returns a UIColor value
     - Parameters:
        - hex3: HEX3 NSNumber - a value of a color
        - alpha: CGFloat alpha value
     */
    public convenience init(hex3: NSNumber, alpha: CGFloat = 1) {
        let c = hex3.intValue
        self.init(red: CGFloat((Float((c & 0xff0000) >> 16)) / 255.0), green: CGFloat((Float((c & 0xff00) >> 8)) / 255.0), blue: CGFloat((Float(c & 0xff)) / 255.0), alpha: 1)
    }
    
    /**
     The function recycles the HEX string and returns a UIColor value
     - Parameters: hex : HEX string - a value of a color
     */
    public static func hexStringToUIColor(hex:String, alpha: CGFloat = 1.0) -> UIColor {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        return .init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                     green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                     blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                     alpha: alpha)
    }
}
