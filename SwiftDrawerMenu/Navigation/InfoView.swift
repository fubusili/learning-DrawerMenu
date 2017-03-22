//
//  InfoView.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    let label1 = UILabel()
    let field1 = MultilineLabel()
    let label2 = UILabel()
    let field2 = MultilineLabel()
    let label3 = UILabel()
    let field3 = MultilineLabel()
    
    let dismissButton = SpringButton()
    let dismissArrow = UIImageView()
    
    override func updateConstraints() {
        self.setupSubviews()
        
        self.blurView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self)
        }
        
        label1.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(self).offset(64)
        }
        field1.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(label1.snp.bottom).offset(10)
        }
        
        label2.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(field1.snp.bottom).offset(25)
        }
        field2.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(label2.snp.bottom).offset(10)
        }
        
        label3.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(field2.snp.bottom).offset(25)
        }
        field3.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(label3.snp.bottom).offset(10)
        }
        
        dismissButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-20)
        }
        
        dismissArrow.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(dismissButton.snp.bottom).offset(-5)
        }
        
        super.updateConstraints()
    }
    
    func setupSubviews() {
        self.addSubviews(self.blurView, self.label1, self.field1, self.label2, self.field2, self.label3, self.field3, self.dismissArrow, self.dismissButton);
        
        self.label1.textColor = .white
        self.label1.font = UIFont.swiftFontOfSize(18)
        self.label1.backgroundColor = .clear
        
        self.label2.textColor = .white
        self.label2.font = UIFont.swiftFontOfSize(18)
        self.label2.backgroundColor = .clear
        
        self.label3.textColor = .white
        self.label3.font = UIFont.swiftFontOfSize(18)
        self.label3.backgroundColor = .clear
        
        self.field1.textColor = .white
        self.field1.font = UIFont.swiftFontOfSize(16)
        self.field1.backgroundColor = .clear
        self.field1.isUserInteractionEnabled = false
        
        self.field2.textColor = .white
        self.field2.font = UIFont.swiftFontOfSize(16)
        self.field2.backgroundColor = .clear
        self.field2.isUserInteractionEnabled = false
        
        self.field3.textColor = .white
        self.field3.font = UIFont.swiftFontOfSize(16)
        self.field3.backgroundColor = .clear
        self.field3.isUserInteractionEnabled = false
        
        self.dismissButton.setTitle("Dismiss", for: UIControlState())
        self.dismissButton.titleLabel?.textColor = .white
        self.dismissButton.titleLabel?.font = UIFont.swiftFontOfSize(14)
        self.dismissButton.backgroundColor = .clear
        
        self.dismissArrow.image = UIImage(named: "dismiss_arrow")
        
    }
}
