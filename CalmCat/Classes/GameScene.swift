//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit
import UIKit

class GameScene: SKScene {
  
  override func didMove(to view: SKView) {
    setUpScenery()
    
  }
  
  func setUpScenery() {
    let bed = SKSpriteNode(imageNamed: ImageName.Bed)
    bed.anchorPoint = CGPoint(x: 0, y: 0)
    bed.position = CGPoint(x: size.width * 0.0, y: size.height * -0.1)
    bed.zPosition = Layer.Bed
    bed.size = CGSize(width: size.width * 1.11, height: size.height * 0.6)
    addChild(bed)
    
    let table = SKSpriteNode(imageNamed: ImageName.Table)
    table.anchorPoint = CGPoint(x: 0, y: 0)
    table.position = CGPoint(x: size.width * 0.35, y: size.height * 0.6)
    table.zPosition = Layer.Table
    table.size = CGSize(width: size.width * 0.65, height: size.height * 0.3)
    addChild(table)
    
    let window = SKSpriteNode(imageNamed: ImageName.Window)
    window.anchorPoint = CGPoint(x: 0, y: 0)
    window.position = CGPoint(x: size.width * 0.1, y: size.height * 0.8)
    window.zPosition = Layer.Window
    window.size = CGSize(width: size.width * 0.23, height: size.height * 0.14)
    addChild(window)
  }
}
