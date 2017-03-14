//
//  BorderView.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit

public enum BorderPosition {
    case top
    case bottom
    case topBottom
}

class BorderView: UIView {

    var position: BorderPosition!
    var borderColor: UIColor!
    var borderHeight: CGFloat!
    
    let topBorder = UIView()
    let bottomBorder = UIView()
    
    //MARK: Init
    
    convenience public init(borderPosition: BorderPosition, color: UIColor, height: CGFloat) {
        self.init(frame: CGRect.zero)
        self.position =  borderPosition
        self.borderColor = color
        self.borderHeight = height
        
        self.topBorder.backgroundColor = self.borderColor
        self.bottomBorder.backgroundColor = self.borderColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsUpdateConstraints()
    }
    
    
    
    override func updateConstraints() {
        self.setupSubviews()
        switch self.position! {
        case .top:
            self.topBorder.snp.makeConstraints({ (make) in
                make.left.right.equalTo(self)
                make.top.equalTo(self)
                make.height.equalTo(self.borderHeight)
            })
        case .bottom:
            self.bottomBorder.snp.makeConstraints({ (make) in
                make.left.right.equalTo(self)
                make.bottom.equalTo(self)
                make.height.equalTo(self.borderHeight)
            })
        case .topBottom:
            self.topBorder.snp.makeConstraints({ (make) in
                make.left.right.equalTo(self)
                make.top.equalTo(self)
                make.height.equalTo(self.borderHeight)
            })
            self.bottomBorder.snp.makeConstraints({ (make) in
                make.left.right.equalTo(self)
                make.bottom.equalTo(self)
                make.height.equalTo(self.borderHeight)
            })
        }
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    open func hideBorders() {
        self.topBorder.alpha = 0
        self.bottomBorder.alpha = 0
    }
    
    open func showBorders() {
        self.topBorder.alpha = 0
        self.bottomBorder.alpha = 0
    }
    
    open func hideBorder(_ border: BorderPosition) {
        switch border {
        case .top:
            self.topBorder.alpha = 0
        case .bottom:
            self.bottomBorder.alpha = 0
        case .topBottom:
            self.bottomBorder.alpha = 0
            self.topBorder.alpha = 0
        }
    }
    
    open func showBorder(_ border: BorderPosition) {
        switch border {
        case .top:
            self.topBorder.alpha = 1
        case .bottom:
            self.bottomBorder.alpha = 1
        case .topBottom:
            self.bottomBorder.alpha = 1
            self.topBorder.alpha = 1
        }
    }
    
    
    //MARK: Private Methods
    func setupSubviews() {
        switch self.position! {
        case .top:
            self.addSubview(self.topBorder)
        case .bottom:
            self.addSubview(self.bottomBorder)
        case .topBottom:
            self.addSubview(self.topBorder)
            self.addSubview(self.bottomBorder)
        }
    }
    

}
