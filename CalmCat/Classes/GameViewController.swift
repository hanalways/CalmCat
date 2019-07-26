//  GameViewController.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit

class GameViewController: UIViewController, GameSceneDelegate {
  var gameScene:GameScene?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setUpGame()
  }
  
  func setUpGame() {
    if let view = view as? SKView {
      // Create the scene programmatically
      let scene = GameScene(size: view.bounds.size)
      scene.dismissDelegate = self
      scene.scaleMode = .resizeFill
      view.ignoresSiblingOrder = true
      view.showsFPS = true
      view.showsNodeCount = true
      view.presentScene(scene)
      
      self.gameScene = scene
    }
  }
  
  func dismiss() {
    if let view = view as? SKView {
      view.presentScene(nil)
    }
    self.setUpGame()
  }
}

protocol GameSceneDelegate {
  func dismiss()
}
