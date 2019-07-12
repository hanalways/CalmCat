//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit
import UIKit

class GameScene: SKScene {
  // cat sprites
//  var catPurr = SKSpriteNode()
//  var catPurrFrames: [SKTexture] = []  
  
  override func didMove(to view: SKView) {
    backgroundColor = SKColor.black
    
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
