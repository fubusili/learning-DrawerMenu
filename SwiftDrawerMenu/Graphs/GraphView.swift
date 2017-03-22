//
//  GraphView.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/22.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit
class GraphView:UIView {
    
    let buttonContainer = UIView()
    
    
    let infoButton = SpringButton()
    
    //MARK: - Init
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
        
        buttonContainer.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-15)
            make.height.equalTo(70)
        }
        
        infoButton.snp.makeConstraints { (make) in
            make.right.equalTo(buttonContainer).offset(-5)
            make.top.equalTo(buttonContainer).offset(5)
            make.bottom.equalTo(buttonContainer).offset(-5)
            make.width.equalTo(100)
        }
        super.updateConstraints()
    }
    
    //MARK: - Methods
    func setupSubviews() {
        self.addSubviews(self.buttonContainer)
        self.buttonContainer.addSubviews(self.infoButton)
        
        
        self.buttonContainer.backgroundColor = .white
        self.buttonContainer.layer.cornerRadius = 4
        self.buttonContainer.layer.shadowColor = UIColor.swiftMediumGray().cgColor
        self.buttonContainer.layer.shadowOpacity = 0.3
        self.buttonContainer.layer.shadowOffset = CGSize(width: 1, height: 3)
        
        self.infoButton.setImage(UIImage(named: "info"), for: UIControlState())
        self.infoButton.setImage(UIImage(named: "info_highlighted"), for: .highlighted)
        self.infoButton.backgroundColor = UIColor.swiftDarkOrange()
        self.infoButton.layer.cornerRadius = 6
        self.infoButton.minimumScale = 0.92
    }
}
