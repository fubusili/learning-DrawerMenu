//
//  Math.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/20.
//  Copyright © 2017年 Clark. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    public func clamp(min: Int, max: Int) -> Int {
        return self < min ? min : (self > max ? max : self)
    }
}

extension CGFloat {
    public func clamp(min: CGFloat, max: CGFloat) -> CGFloat {
        return self < min ? min : (self > max ? max : self)
    }
}

extension Float {
    public func clamp(min: Float, max: Float) -> Float {
        return self < min ? min : (self > max ? max : self)
    }
}

extension Double {
    public func clamp(min: Double, max: Double) -> Double {
        return self < min ? min : (self > max ? max : self)
    }
    
    public func toString(decimalPlaces: Int) -> String {
        let power = pow(10.0, Double(decimalPlaces))
        return "\(Darwin.round(power * self) /  power)"
    }
}
