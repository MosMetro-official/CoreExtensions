//
//  Ext+String.swift
//  
//
//  Created by polykuzin on 01/07/2022.
//

import UIKit

public extension String {
    
    var htmlToString : String {
        return htmlToAttributedString?.string ?? ""
    }
    
    var htmlToAttributedString : NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(
                data: data,
                options: [
                    .characterEncoding:String.Encoding.utf8.rawValue,
                    .documentType: NSAttributedString.DocumentType.html
                ],
                documentAttributes: nil
            )
        } catch {
            return NSAttributedString()
        }
    }
    
    /**
     Method capitalized first letter in a string
     */
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
    func toBase64String() -> String? {
        let utf8str = self.data(using: .utf8)
        let encodedStr = utf8str?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        return encodedStr
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func toAttributed(color: UIColor, font: UIFont) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: color,  NSAttributedString.Key.font: font], range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
    
    /**
     Method to format phone number to specific mask
     */
    func format(with mask: String) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    /**
     Method to validate phone number
     */
    func validatePhoneNumber() -> Bool {
        let formattedPhone = self.format(with: "+X (XXX) XXX-XXXX")
        let PHONE_REGEX = #"^(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$"#
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: formattedPhone)
        return result
    }
}
