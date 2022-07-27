//
//  UIView+Extentions.swift
//
//
//  Created by polykuzin on 29/06/2022.
//

import UIKit

public typealias EdgeClosure = (_ view: UIView, _ superview: UIView) -> ([NSLayoutConstraint])

public enum Corners {
    case all
    case top
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case allButTopLeft
    case allButTopRight
    case allButBottomLeft
    case allButBottomRight
    case left
    case right
    case topLeftBottomRight
    case topRightBottomLeft
}

public extension UIView {
    
    /**
     Load the view from a nib file called with the name of the class;
      - note: The first object of the nib file **must** be of the matching class
      - parameters:
        - Bundle - name of _YOUR_MODULE_BUNDLE_
     */
    public static func loadFromNib(_ bundle: Bundle? = nil) -> Self {
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
		//  swiftlint:disable force_cast
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
		//  swiftlint:disable force_cast
    }
    
    /**
     Method **adds** a view to the superView, seted translatesAutoresizingMaskIntoConstraints to **false** and activates constrates
     - parameters:
        - on: View on which view schould be fixed
     */
    public func pin(on superview: UIView, _ callback: EdgeClosure) {
        superview.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        callback(self, superview).forEach {
            $0.isActive = true
        }
    }
    
    /**
     Sets the cornerRadius for selected corners from **Corners** enum
     - parameters:
        - corners:
            * all
            * top
            * bottom
            * topLeft
            * topRight
            * bottomLeft
            * bottomRight
            * allButTopLeft
            * allButTopRight
            * allButBottomLeft
            * allButBottomRight
            * left
            * right
            * topLeftBottomRight
            * topRightBottomLeft
        - radius: The **CGFloat** value to be set
     */
    public func roundCorners(_ corners: Corners, radius: CGFloat) {
        var cornerMasks = [CACornerMask]()
        
        // Top left corner
        switch corners {
        case .all, .top, .topLeft, .allButTopRight, .allButBottomLeft, .allButBottomRight, .topLeftBottomRight, .left:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.topLeft.rawValue))
        default:
            break
        }
        
        // Top right corner
        switch corners {
        case .all, .top, .topRight, .allButTopLeft, .allButBottomLeft, .allButBottomRight, .topRightBottomLeft:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.topRight.rawValue))
        default:
            break
        }
        
        // Bottom left corner
        switch corners {
        case .all, .bottom, .bottomLeft, .allButTopRight, .allButTopLeft, .allButBottomRight, .topRightBottomLeft, .left:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.bottomLeft.rawValue))
        default:
            break
        }
        
        // Bottom right corner
        switch corners {
        case .all, .bottom, .bottomRight, .allButTopRight, .allButTopLeft, .allButBottomLeft, .topLeftBottomRight:
            cornerMasks.append(CACornerMask(rawValue: UIRectCorner.bottomRight.rawValue))
        default:
            break
        }
        
        clipsToBounds = true
        layer.cornerRadius = radius
        
        layer.maskedCorners = CACornerMask(cornerMasks)
        layer.cornerCurve = .continuous
    }
    
    /**
    Converts the view into an image
     */
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    /**
     Adds a gradient layer **at 0** to the view with a color from **top** to **botom**
     */
    func setGradientBackground(topColor : UIColor, botomColor: UIColor) {
        let gradientLayer               = CAGradientLayer()
        gradientLayer.frame             = bounds
        gradientLayer.locations         = [0.0, 1.0]
        gradientLayer.startPoint        = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint          = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors            = [topColor.cgColor, botomColor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /**
     Adds a gradient layer **at 0** to the view with a color from **left** to **right**
     */
    func setGradientBackground(leftColor : UIColor, rightColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /**
     Adds a gradient layer **at 0** to the view with a color from **top - left** to **botom - right**
     */
    func setGradientBackground(topLeftColor : UIColor, botomRightColor: UIColor) {
        let gradientLayer               = CAGradientLayer()
        gradientLayer.frame             = bounds
        gradientLayer.locations         = [0.0, 1.0]
        gradientLayer.startPoint        = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint          = CGPoint(x: 1, y: 1)
        gradientLayer.colors            = [topLeftColor.cgColor, botomRightColor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

public extension UIView {
    
    public func setShadow() {
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset  = CGSize(width: 0, height: 20)
        self.layer.shadowRadius  = 46
        self.layer.shadowPath    = UIBezierPath(rect: self.bounds).cgPath
    }
}
