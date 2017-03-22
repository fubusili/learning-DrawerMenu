//
//  SpringButton.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/22.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit
open class SpringButton: UIButton {
    open var minimumScale: CGFloat = 0.95
    open var pressSpringDamping: CGFloat = 0.4
    open var releaseSpringDamping: CGFloat = 0.35
    open var pressSpringDuration = 0.4
    open var releaseSpringDuration = 0.5
    
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: self.pressSpringDuration, delay: 0, usingSpringWithDamping: self.pressSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: { 
            self.transform =  CGAffineTransform(scaleX: self.minimumScale, y: self.minimumScale)
        }, completion: nil)
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        if !self.bounds.contains(location) {
            UIView.animate(withDuration: self.releaseSpringDuration, delay: 0, usingSpringWithDamping: self.releaseSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: { 
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: self.releaseSpringDuration, delay: 0, usingSpringWithDamping: self.releaseSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: { 
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: self.releaseSpringDuration, delay: 0, usingSpringWithDamping: self.releaseSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
}
