//
//  UIViewExtensions.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 21/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func insertBackgroundGradient(colors colors:[CGColor], startPoint:CGPoint, endPoint:CGPoint) {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = colors
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }
}