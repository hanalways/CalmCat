//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit

class GameScene: SKScene {
  let label = SKLabelNode(text: "o")
  
  // adding in the cat
  let catSprite = SKSpriteNode(imageNamed: "catSprite")
  
  override func didMove(to view: SKView) {
    // cattt
    catSprite.position = CGPoint(x: size.width * 0.4, y: size.height * 0.4)
    addChild(catSprite)
    
    label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height * 0.8)
    label.fontSize = 55
    label.fontColor = SKColor.purple
    label.fontName = "Avenir"
    
    addChild(label)
  }
}
