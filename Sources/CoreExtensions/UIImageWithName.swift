//
//  UIImageWithName.swift
//  MosmetroNew
//
//  Created by polykuzin on 21/02/2022.
//  Copyright © 2022 Гусейн Римиханов. All rights reserved.
//
// swiftlint:disable custom_literal

import UIKit

public class UIImageWithName : UIImage {

	public convenience init(_ name: String, in bundle: Bundle? = nil, with configuration: UIImage.Configuration? = nil) {
        if
            let image = UIImage(named: name,in: bundle, with: configuration),
            let cgImage = image.cgImage
        {
            self.init(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
        } else {
            let image = UIImage(named: "placeholder_image", in: CoreExtensions.bundle, compatibleWith: nil)!
            let cgImage = image.cgImage
            self.init(cgImage: cgImage!)
        }
    }
}
