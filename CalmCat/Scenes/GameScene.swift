//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit
import UIKit

class GameScene: SKScene {
  // adding in circle sprite
  let circle = SKShapeNode(circleOfRadius: 100.0)
  
  // background assets
  let bed = SKSpriteNode(imageNamed: "bed")
  let table = SKSpriteNode(imageNamed: "table")
  let window = SKSpriteNode(imageNamed: "window")
  
  // cat sprites
//  var catPurr = SKSpriteNode()
//  var catPurrFrames: [SKTexture] = []  
  
  override func didMove(to view: SKView) {
    backgroundColor = SKColor.black
    
    circle.position = CGPoint(x: view.frame.width * 0.7, y: view.frame.height * 0.5)
//    circle.fillColor = UIColor.cyan
//    addChild(circle)
    
    // background assets
    bed.zPosition = -1
    bed.position = CGPoint(x: size.width * 0.55, y: size.height * 0.2)
    bed.size = CGSize(width: size.width, height: size.height * 0.7)
    addChild(bed)
    
    table.zPosition = -1
    table.size = CGSize(width: size.width * 0.7, height: size.height * 0.25)
    table.position = CGPoint(x: size.width * 0.7, y: size.height * 0.75)
    addChild(table)
    
    window.zPosition = -1
    window.size = CGSize(width: size.width * 0.2, height: size.height * 0.14)
    window.position = CGPoint(x: size.width * 0.2, y: size.height * 0.9)
    addChild(window)
    //

//    buildCatPurr()
  }
  
//  func buildCatPurr() {
//    let catPurrAnimatedAtlas = SKTextureAtlas(named: "catPurr")
//    var purrFrames: [SKTexture] = []
//    let numImages = catPurrAnimatedAtlas.textureNames.count
//    for i in 1...numImages {
//      let catPurrTextureName = "catPurr-\(i)"
//      purrFrames.append(catPurrAnimatedAtlas.textureNamed(catPurrTextureName))
//    }
//    catPurrFrames = purrFrames
//
//    let firstFrameTexture = catPurrFrames[0]
//    catPurr = SKSpriteNode(texture: firstFrameTexture)
//    catPurr.position = CGPoint(x: frame.midX, y: frame.midY)
//    addChild(catPurr)
//  }
}
