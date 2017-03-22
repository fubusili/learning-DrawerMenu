//
//  GraphViewController.swift
//  SwiftDrawerMenu
//
//  Created by hc_cyril on 2017/3/14.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    let graphView = GraphView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = self.graphView
        self.graphView.infoButton.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - Methods
    func infoTapped() {
        let infoView = InfoView(frame: UIScreen.main.bounds)
        infoView.label1.text = "What does it do?"
        infoView.field1.text = "This is an Artificial Neural Network. Here we train it to learn the Sine function."
        infoView.label2.text = "How do I use it?"
        infoView.field2.text = "The green wave is the function we'd like to model, the red wave is the neural network's output. Here we watch the network's learning process - live - on the graph.\n\n - Tap 'Start' to begin the training \n - Tap 'Pause' to pause the training\n - Tap 'Reset' to create a new network\n - Adjust the sliders to change the target"
        infoView.label3.text = "How does it work?"
        infoView.field3.text = "For each X coordinate on the graph, the neural network 'guesses' the Y value. The error is then propagated through the network, and over time our model converges closer to the target function."
        DrawerNavigationViewController.globalDrawerController().presentInfoView(infoView)
    }

}
