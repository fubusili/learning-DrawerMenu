//
//  DrawerNavigationViewController.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit
import SnapKit

class DrawerNavigationViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let drawerWidth = UIScreen.main.bounds.width * 0.6
    let navBar = NavigationBar()
    var drawerViewController: DrawerViewController!
    var viewControllers = [UIViewController]()
    
    fileprivate var views = [UIView]()
    fileprivate var currentView: UIView!
    
    fileprivate static var globalDrwerNavController: DrawerNavigationViewController!

    //MARK: Init
    convenience init(viewControllers: [UIViewController]) {
        self.init()
        self.viewControllers = viewControllers
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.drawerColor()
        
        self.drawerViewController = DrawerViewController()
        self.drawerViewController.viewControllers = self.viewControllers
        self.view.addSubview(self.drawerViewController.view)
        
        drawerViewController.view.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.width.equalTo(drawerWidth)
            make.top.equalTo(self.view).offset(64)
            make.bottom.equalTo(self.view)
        }
        self.views = self.viewControllers.map({ (viewController) -> UIView in
            return viewController.view
        })
        
        self.view.addSubview(self.views[0])
        views[0].snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(64)
            make.bottom.equalTo(self.view)
        }
        self.currentView = self.views[0]
        self.addShadowToCurrentView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    

    //MARK: Public methods
    class func globalDrawerController() -> DrawerNavigationViewController {
        return self.globalDrawerController()
    }
    
    class func setGlobalDrawerController(_ controller: DrawerNavigationViewController) {
        self.globalDrwerNavController = controller
    }
    
    //MARK: Private methods
    fileprivate func addShadowToCurrentView() {
        self.currentView.layer.shadowColor = UIColor.darkGray.cgColor
        self.currentView.layer.shadowOpacity = 0.7
        self.currentView.layer.shadowRadius = 5
        self.currentView.layer.shadowOffset = CGSize(width: -3, height: 5)
    }

}
