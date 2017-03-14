//
//  MultilineLabel.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit

class MultilineLabel: UILabel {

    public init() {
        super.init(frame: CGRect.zero)
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.preferredMaxLayoutWidth = self.bounds.size.width
    }

}
