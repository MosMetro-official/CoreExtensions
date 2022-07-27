//
//  Shadow.swift
//  MosmetroNew
//
//  Created by Павел Кузин on 07.12.2020.
//  Copyright © 2020 Гусейн Римиханов. All rights reserved.
//

import UIKit

public struct Shadow {
    public let offset : CGSize
    public let blur : CGFloat
    public let color : UIColor
    
    public init(offset: CGSize, blur: CGFloat, color: UIColor) {
        self.offset = offset
        self.blur = blur
        self.color = color
    }
}
