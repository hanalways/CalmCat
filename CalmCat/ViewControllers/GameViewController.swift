//  GameViewController.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import Foundation

class GameViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let scene = GameScene(size: view.bounds.size)
    let skView = view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.ignoresSiblingOrder = true
    scene.scaleMode = .resizeFill
    skView.presentScene(scene)
  }
  
  @IBAction func tapButton() {
    print("You tapped this!")
  }
  
  @IBAction func knockKnock() {
    let alert = UIAlertController(title: "The title of the alert!", message: "The body of an alert!", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Button Text", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
}
