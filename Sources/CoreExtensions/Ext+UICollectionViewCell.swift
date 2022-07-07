//
//  Ext+UICollectionViewCell.swift
//
//
//  Created by polykuzin on 29/06/2022.
//

import UIKit

extension UICollectionViewCell {
    
    static var nib : UINib{
        return UINib(nibName: identifire, bundle: nil)
    }
    
    static var identifire : String{
        return String(describing: self)
    }
}
