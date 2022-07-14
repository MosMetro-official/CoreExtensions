//
//  Ext+Numbers.swift
//
//
//  Created by polykuzin on 29/06/2022.
//

import UIKit

extension Int {
    
    /**
     Func converted int to string with specific style
     */
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second, .nanosecond]
        formatter.unitsStyle = style
        guard let formattedString = formatter.string(from: TimeInterval(self)) else { return "" }
        return formattedString
    }
    
}

extension TimeInterval  {
    
    struct DateComponents {
        
        static let formatterPositional: DateComponentsFormatter = {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute,.second]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            return formatter
        }()
    }
    
    var positionalTime: String {
        return DateComponents.formatterPositional.string(from: self) ?? ""
    }
    
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        
        return String(format: "%0.2d:%0.2d",minutes,seconds)
    }
}

extension Double {
    
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
