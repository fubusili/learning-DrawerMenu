//
//  DrawerView.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit

class DrawerView: UIView {

    var headerView: BorderView!
    let headerLabel = UILabel()
    
    let tableView = UITableView()
    
    var footerView: BorderView!
    let footerLabel = MultilineLabel()
    
    
    //MARK: Init
    
    convenience init() {
        self.init(frame: CGRect.zero)
        self.headerView = BorderView(borderPosition: .bottom, color: .white, height: 1)
        self.footerView = BorderView(borderPosition: .top, color: .white, height: 1)
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
        super.updateConstraints()
        headerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(60)
        }
        headerLabel.snp.makeConstraints { (make) in
            make.center.equalTo(headerView)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(headerView.snp.bottom)
            make.height.equalTo(tableView.numberOfRows(inSection: 0) * 70)
        }
        
        footerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(60)
        }
        
        footerLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(footerView).offset(15)
            make.centerY.equalTo(footerView.snp.centerY)
        }
        
    }
    
    //MARK: Private methods
    func setupSubviews() {
        self.addSubview(self.headerView)
        self.addSubview(self.tableView)
        self.addSubview(self.footerView)
        
        self.backgroundColor = .clear
        
        self.headerLabel.text = "Example Projects"
        self.headerLabel.font = UIFont.swiftFontOfSize(18)
        self.headerLabel.textColor = UIColor.swiftLightGray()
        
        self.tableView.backgroundColor = UIColor.drawerColor()
        self.tableView.isScrollEnabled = false
        
        self.footerView.backgroundColor = UIColor.clear
        
        let text = NSMutableAttributedString(string: "Feebaack or ideas?\nLet me know on Github")
        text.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle, range: NSMakeRange(text.length - 6, 6))
        self.footerLabel.attributedText = text
        self.footerLabel.font = UIFont.swiftFontOfSize(13)
        self.footerLabel.textColor = UIColor.swiftLightGray()
        self.footerLabel.textAlignment = .center
        
    }

}
