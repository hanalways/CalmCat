//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit

class GameScene: SKScene {
  // adding in the cat
//  let catSprite = SKSpriteNode(imageNamed: "catSprite")
  
  // adding in circle sprite
  let circle = SKShapeNode(circleOfRadius: 100.0)
  
  override func didMove(to view: SKView) {
    // cattt
//    catSprite.position = CGPoint(x: size.width * 0.4, y: size.height * 0.4)
    
    circle.position = CGPoint(x: view.frame.width * 0.7, y: view.frame.height * 0.5)
    circle.fillColor = UIColor.cyan
    addChild(circle)
//    addChild(catSprite)
  }
}
