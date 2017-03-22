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
    var drawerLocked = false
    
    // Private state variables
    fileprivate var views = [UIView]()
    fileprivate var currentView: UIView!
    fileprivate var touchBeginLocation: CGPoint?
    fileprivate var open = false
    
    fileprivate var infoView: InfoView?
    fileprivate let infoViewThreshold: CGFloat = 80
    
    fileprivate static var globalDrwerNavController: DrawerNavigationViewController!

    //MARK: - Init
    convenience init(viewControllers: [UIViewController]) {
        self.init()
        self.viewControllers = viewControllers
        DrawerNavigationViewController.setGlobalDrawerController(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.drawerColor()
        
        self.navBar.hamburgerButton.addTarget(self, action: #selector(hamburgerTapped), for: .touchUpInside)
        self.view.addSubview(self.navBar)
        navBar.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view)
            make.height.equalTo(64)
        }
        
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
    

    //MARK: - Public methods
    class func globalDrawerController() -> DrawerNavigationViewController {
        return self.globalDrwerNavController
    }
    
    class func setGlobalDrawerController(_ controller: DrawerNavigationViewController) {
        self.globalDrwerNavController = controller
    }
    
    //MARK: - Methods
    
    func hamburgerTapped() {
        self.transformDrawer()
        if self.open {
            self.closeDrawer(completion: nil)
        } else {
            self.openDrawer(completion: nil)
        }
    }
    
    
    func openDrawer(completion: (() -> Void)?) {
        if self.drawerLocked || self.open{
            completion?()
            return
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
            self.currentView.transform = CGAffineTransform(translationX: self.drawerWidth, y: 0)
            self.transformDrawer()
        }) { (Bool) in
            self.open = true
        }
    }
    
    
    func closeDrawer(completion: (() -> Void)?) {
        if self.drawerLocked || !self.open{
            completion?()
            return
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
            self.currentView.transform = CGAffineTransform.identity
            self.transformDrawer()
        }) { (Bool) in
            self.open = false
            completion?()
        }
    }
    
    //MARK: - Private methods
    fileprivate func addShadowToCurrentView() {
        self.currentView.layer.shadowColor = UIColor.darkGray.cgColor
        self.currentView.layer.shadowOpacity = 0.7
        self.currentView.layer.shadowRadius = 5
        self.currentView.layer.shadowOffset = CGSize(width: -3, height: 5)
    }
    
    fileprivate func transformDrawer() {
        let x = self.currentView.transform.tx
        var scale = 0.00007 * x + 0.98
        scale = scale.clamp(min: 0.98, max: 1.0)
        self.drawerViewController.drawerView.transform = CGAffineTransform(scaleX: scale, y: scale)
        var translate = -0.033 * x + 10
        translate = translate.clamp(min: 0, max: 10)
        self.drawerViewController.drawerView.transform = self.drawerViewController.drawerView.transform.translatedBy(x: translate, y: 0)
        
    }
    
    //MARK: - Touch delegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.drawerLocked {
            return
        }
        switch self.infoView {
        case nil:
            let location = touches.first!.location(in: self.currentView)
            self.touchBeginLocation = location
            
        default:
            let location = touches.first!.location(in: infoView)
            self.touchBeginLocation = location
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.drawerLocked {
            return
        }
        switch self.infoView {
        case nil:
            let location = touches.first!.location(in: self.currentView)
            let x = location.x
            if let start = self.touchBeginLocation {
                let diff = x - start.x
                self.currentView.transform = self.currentView.transform.translatedBy(x: diff, y: 0)
                self.transformDrawer()
                if self.currentView.transform.tx < 0 {
                    self.currentView.transform = CGAffineTransform.identity
                } else if self.currentView.transform.tx > self.drawerWidth {
                    let distance = pow(self.currentView.transform.tx - self.drawerWidth, 0.8)
                    self.currentView.transform = CGAffineTransform(translationX: self.drawerWidth + distance, y: 0)
                }
                
            }
            
        default:
            let location = touches.first!.location(in: self.infoView)
            let y = location.y
            if let start = self.touchBeginLocation {
                let diff = y - start.y
                self.infoView!.transform = self.infoView!.transform.translatedBy(x: 0, y: diff)
                if self.infoView!.transform.ty < 0 {
                    self.infoView!.transform = CGAffineTransform.identity
                }
            }
            
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.drawerLocked {
            return
        }
        if self.infoView != nil {
            if self.infoView!.transform.ty > self.infoViewThreshold {
                if self.infoView!.transform.ty > self.infoViewThreshold {
                    self.dismissInfoView()
                }
            } else {
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { 
                    self.infoView!.transform = CGAffineTransform.identity
                }, completion: nil)
                
            }
            return
        }
        print(self.currentView.transform.tx)
        switch self.open {
        case true:
            if self.currentView.transform.tx < self.drawerWidth - 20 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 5, options: .allowUserInteraction, animations: { 
                    self.currentView.transform = CGAffineTransform.identity
                    self.transformDrawer()
                }, completion: { (Bool) in
                    self.open = false
                })
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .allowUserInteraction, animations: { 
                    self.currentView.transform = CGAffineTransform(translationX: self.drawerWidth, y: 0)
                }, completion: { (Bool) in
                    self.open = true
                })
            }
        default:
            if self.currentView.transform.tx < 20 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
                    self.currentView.transform = CGAffineTransform.identity
                }, completion: { (Bool) in
                    self.open = false
                })
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .allowUserInteraction, animations: { 
                    self.currentView.transform = CGAffineTransform(translationX: self.drawerWidth, y: 0)
                    self.transformDrawer()
                }, completion: { (Bool) in
                    self.open = true
                })
            }
        }
    }
    
    //MARK: - InfoView
    func presentInfoView(_ infoView: InfoView) {
        guard self.infoView == nil else {
            return
            
        }
        self.infoView = infoView
        self.view.addSubview(infoView)
        infoView.dismissButton.addTarget(self, action: #selector(dismissInfoView), for: .touchUpInside)
        infoView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { 
            infoView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func dismissInfoView() {
        guard let infoView = self.infoView else {
            return
        }
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { 
            infoView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        }) { (Bool) in
            infoView.removeFromSuperview()
            self.infoView = nil
        }
    }
    
}
