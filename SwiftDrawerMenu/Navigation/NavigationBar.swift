//
//  NavigationBar.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit

class NavigationBar: UIView {

    let titleLabel = UILabel()
    let hamburgerButton = UIButton()
    let gradient = CAGradientLayer()
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.setupSubviews()
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(7)
        }
        hamburgerButton.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.width.equalTo(80)
            make.centerY.equalTo(self.snp.centerY).offset(7)
            make.height.equalTo(50)
        }
        
        super.updateConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradient.frame = self.frame
    }
    
    //MARK: set up subviews
    func setupSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.hamburgerButton)
        self.layer.insertSublayer(self.gradient, at: 0)
        
        self.titleLabel.text = "Swift AI"
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.swiftFontOfSize(20)
        
        self.hamburgerButton.setImage(UIImage(named:"hamburger"), for: UIControlState())
        self.hamburgerButton.setImage(UIImage(named: "hamburger_highlighted"), for: .highlighted)
        self.hamburgerButton.imageEdgeInsets = UIEdgeInsets(top: 12.5, left: 10, bottom: 12.5, right: 10)
        
        self.gradient.colors = [UIColor.swiftDarkOrange().cgColor, UIColor.swiftLightOrange().cgColor]
        self.gradient.startPoint = CGPoint.zero
        self.gradient.endPoint = CGPoint(x: 1, y: 0)
    }
    
    

}
