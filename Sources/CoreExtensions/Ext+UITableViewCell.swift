//
//  Ext+UITableViewCell.swift
//
//
//  Created by polykuzin on 29/06/2022.
//

import UIKit

public extension UITableViewCell {
    
    static var nib  : UINib{
        return UINib(nibName: reusedId, bundle: nil)
    }
    
    static var reusedId : String{
        return String(describing: self)
    }
}
