//
//  IntroSceneViewController.swft.swift
//  CalmCat
//
//  Created by Hana Clements on 7/15/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import UIKit
import SpriteKit

class IntroViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = view as? SKView {
            // Create the scene programmatically
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .resizeFill
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.presentScene(scene)
        }
        
    }
}
