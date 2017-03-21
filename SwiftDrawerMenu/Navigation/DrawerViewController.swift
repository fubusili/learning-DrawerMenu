//
//  DrawerViewController.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    let drawerView = DrawerView()
    var viewControllers = [UIViewController]()
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    //MARK: Life cycle
    override func loadView() {
        self.view = self.drawerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.drawerView.tableView.dataSource = self
        self.drawerView.tableView.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedFeedback))
        self.drawerView.footerView.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: UITableViewDelegate and dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DrawerCell()
        cell.titleLabel.text = self.viewControllers[indexPath.row].title!
        switch indexPath.row {
        case 0,1,2:
            cell.descriptionLabel.text = "Artificial Neural Network"
        default:
            cell.descriptionLabel.text = "Generic Algorithm"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK: Methods
    func tappedFeedback() {
        let url = URL(string: "https://github.com/fubusili")//https://github.com/collinhundley/Swift-AI/issues/new
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
        
    }
}
