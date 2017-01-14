//
//  InspectableView.swift
//  ViewHelper: Version 4.2.4
//  Created by Melvin Rivera on 7/24/14.
//  https://github.com/melvitax/ViewHelper
//


import Foundation
import UIKit
import QuartzCore

@IBDesignable open class InspectableView :UIView {
    
    
    // MARK: Border
    
    /**
     The layer border color
     */
    @IBInspectable override public var borderColor: UIColor {
        get {
            return layer.borderColor == nil ? UIColor.clear : UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    /**
     The layer border width
     */
    @IBInspectable override public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    // MARK: Corner Radius
    
    /**
     The layer corner radius
     */
    @IBInspectable override public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            setupView()
        }
    }
    
    
    // MARK: Shadow
    
    /**
     The shadow color of the layer
     */
    @IBInspectable override public var shadowColor: UIColor {
        get {
            return layer.shadowColor == nil ? UIColor.clear : UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    
    /**
     The shadow offset of the layer
     */
    @IBInspectable override public var shadowOffset:CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /**
     The shadow opacity of the layer
     
     - Returns: Float
     */
    @IBInspectable override public var shadowOpacity:Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /**
     The shadow radius of the layer
     
     - Returns: CGFloat
     */
    @IBInspectable override public var shadowRadius:CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    // MARK: Inspectable properties
    
    @IBInspectable var startColor: UIColor = UIColor.white {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.black {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    
    // MARK: Internal functions
    
    fileprivate func setupView(){
        let colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = cornerRadius
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        self.setNeedsDisplay()
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    
    // MARK: Overrides ******************************************
    
    override open class var layerClass:AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    open override func prepareForInterfaceBuilder() {
        setupView()
    }
    
}
