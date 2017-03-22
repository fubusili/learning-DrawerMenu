//
//  View.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/22.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit
public extension UIView {
    public func addSubviews(_ subviews: UIView...) {
        for view in subviews {
            self.addSubview(view)
        }
    }
}
