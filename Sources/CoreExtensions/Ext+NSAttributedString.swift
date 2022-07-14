//
//  Ext+NSAttributedString.swift
//  MosmetroNew
//
//  Created by Сеня Римиханов on 23.07.2021.
//  Copyright © 2021 Гусейн Римиханов. All rights reserved.
//

import UIKit

extension NSAttributedString {

    func height(containerWidth: CGFloat) -> CGFloat {

        let rect = self.boundingRect(with: CGSize.init(width: containerWidth, height: CGFloat.greatestFiniteMagnitude),
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     context: nil)
        return ceil(rect.size.height)
    }

    func width(containerHeight: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: containerHeight),
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     context: nil)
        return ceil(rect.size.width)
    }
}

extension NSMutableAttributedString {
    
    func setFontFace(font: UIFont, color: UIColor? = nil) {
        beginEditing()
        self.enumerateAttribute(
            .font,
            in: NSRange(
                location: 0,
                length: self.length
            )
        ) { (value, range, stop) in
            if
                let f = value as? UIFont,
                let newFontDescriptor = f.fontDescriptor.withFamily(font.familyName).withSymbolicTraits(f.fontDescriptor.symbolicTraits) {
                let newFont = UIFont(descriptor: newFontDescriptor, size: font.pointSize)
                removeAttribute(.font, range: range)
                addAttribute(.font, value: newFont, range: range)
                if let color = color {
                    removeAttribute(.foregroundColor, range: range)
                    addAttribute(.foregroundColor, value: color, range: range)
                }
            }
        }
        endEditing()
    }
    
    static func textWithLeftIcon(_ icon: UIImage, _ text: String) -> NSMutableAttributedString {
        // Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = icon
        // Set bound to reposition
        let imageOffsetY: CGFloat = -3
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 16, height: 16)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: text)
        completeText.append(textAfterIcon)
        
        return completeText
    }
    
    static func textWithRightIcon(_ icon: UIImage, _ text: String) -> NSMutableAttributedString {
        // Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = icon
        // Set bound to reposition
        let imageOffsetY: CGFloat = -3
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 16, height: 16)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        // Add your text to mutable string
        let textBeforeIcon = NSAttributedString(string: text)
        completeText.append(textBeforeIcon)
        completeText.append(attachmentString)
        
        return completeText
    }
}
