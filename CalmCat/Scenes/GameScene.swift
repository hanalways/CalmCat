//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit
import UIKit

class GameScene: SKScene {
  // adding in the cat
  let catSprite = SKSpriteNode(imageNamed: "catSprite")
  
  // adding in circle sprite
  let circle = SKShapeNode(circleOfRadius: 100.0)
  
  // background assets
  let bed = SKSpriteNode(imageNamed: "bed")
  let table = SKSpriteNode(imageNamed: "table")
  let window = SKSpriteNode(imageNamed: "window")
  
  override func didMove(to view: SKView) {
    backgroundColor = SKColor.black
    // cattt
    catSprite.position = CGPoint(x: size.width * 0.4, y: size.height * 0.4)
    
    circle.position = CGPoint(x: view.frame.width * 0.7, y: view.frame.height * 0.5)
//    circle.fillColor = UIColor.cyan
    addChild(circle)
//    addChild(catSprite)
    
    bed.zPosition = -1
    bed.position = CGPoint(x: size.width * 0.55, y: size.height * 0.2)
    bed.size = CGSize(width: size.width, height: size.height * 0.7)
    addChild(bed)
    
    table.zPosition = -1
    table.size = CGSize(width: size.width * 0.5, height: size.height * 0.25)
    table.position = CGPoint(x: size.width * 0.7, y: size.height * 0.8)
    addChild(table)
    
    window.zPosition = -1
    window.size = CGSize(width: size.width * 0.2, height: size.height * 0.17)
    window.position = CGPoint(x: size.width * 0.2, y: size.height * 0.9)
    addChild(window)
  }
}
