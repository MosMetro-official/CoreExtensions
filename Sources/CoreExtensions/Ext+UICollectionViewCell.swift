//
//  Ext+UICollectionViewCell.swift
//
//
//  Created by polykuzin on 29/06/2022.
//

import UIKit

public extension UICollectionViewCell {
    
    static func nib(_ bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: identifire, bundle: bundle)
    }
    
    static var identifire : String{
        return String(describing: self)
    }
}
