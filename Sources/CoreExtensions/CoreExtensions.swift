//
//  Ext+UITableViewCell.swift
//
//
//  Created by polykuzin on 29/06/2022.
//

import Foundation

public class CoreExtensions {
    
    public static func getVersion() -> String {
        return "0.0.1"
    }
    
    public static var bundle: Bundle {
        let podBundle = Bundle(for: self)
        guard let url = podBundle.url(forResource: "CoreExtensions", withExtension: "bundle") else {
            return podBundle
        }
        return Bundle(url: url) ?? podBundle
    }
}
