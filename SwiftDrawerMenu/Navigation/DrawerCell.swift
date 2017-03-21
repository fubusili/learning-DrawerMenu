//
//  DrawerCell.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit


class DrawerCell: UITableViewCell {

    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    fileprivate let selectionView = UIView()
    
    
    //MARK: Init
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: nil)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.setupSubviews()
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.centerY.equalTo(self.contentView.snp.centerY).offset(-12)
        }
        
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.centerY.equalTo(self.contentView.snp.centerY).offset(12)
        }
        
        super.updateConstraints()
    }
    
    //MARK: Methods
    func setupSubviews() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.descriptionLabel)
        
        self.backgroundColor = UIColor.drawerColor()
        self.selectedBackgroundView = self.selectionView
        
        self.titleLabel.textColor = UIColor.swiftLightGray()
        self.titleLabel.font = UIFont.swiftFontOfSize(18)
        
        self.descriptionLabel.textColor = UIColor.swiftLightGray()
        self.descriptionLabel.font = UIFont.swiftFontOfSize(13)
        
        self.selectionView.backgroundColor = UIColor(white: 1, alpha: 0.4)
    }

}
