//
//  MenuViewController.swift
//  CalmCat
//
//  Created by Hana Clements on 7/28/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit
import AVFoundation

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = view as? SKView {
            // Create the scene programmatically
            let scene = MenuScene(size: view.bounds.size)
            scene.scaleMode = .resizeFill
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.presentScene(scene)
        }
        
    }
}
