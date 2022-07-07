//
//  Ext+String.swift
//  
//
//  Created by polykuzin on 01/07/2022.
//

import Foundation

public extension String {
    
    var htmlToString : String {
        return htmlToAttributedString?.string ?? ""
    }
    
    public var htmlToAttributedString : NSAttributedString? {
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
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
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
}
