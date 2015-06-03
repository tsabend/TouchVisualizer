//
//  Configuration.swift
//  TouchVisualizer
//
//  Created by MORITA NAOKI on 2015/04/11.
//  Copyright (c) 2015年 molabo. All rights reserved.
//

import UIKit

public struct Configuration {
    private struct Constants {
        static let defaultColor = UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 0.8)
    }
    
    // Color of touch points
    public var color: UIColor? = Constants.defaultColor
    
    // Image of touch points
    public var image: UIImage? = {
        let rect = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0)
        let contextRef = UIGraphicsGetCurrentContext()
        var image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        CGContextSetFillColorWithColor(contextRef, Constants.defaultColor.CGColor)
        CGContextFillEllipseInRect(contextRef, rect)
        UIGraphicsEndImageContext()
        image = image.imageWithRenderingMode(.AlwaysTemplate)
        
        return image
        }()
    
    // Default touch point size. If `showsTouchRadius` is enabled, this value is ignored
    public var defaultSize = CGSize(width: 60.0, height: 60.0)
    
    // Shows touch duration.
    public var showsTimer = false
    
    // Shows touch radius. It doesn't work on simulator because it is not 
    // possible to read touch radius on it. Please test it on device
    public var showsTouchRadius = false
    
    // Shows log. This will affect performance. Make sure showing logs only in development environment
    public var showsLog = false
    
    init(){}
}