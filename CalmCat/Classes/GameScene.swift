//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit
import UIKit

class GameScene: SKScene {
  private var catPurr = SKSpriteNode()
  private var catPurrFrames: [SKTexture] = []
  
  
  override func didMove(to view: SKView) {
    setUpScenery()
//    setUpCat()
    buildCatPurr()
    userIndicatorCircle()
  }
  
  func setUpCat() {
    let cat = SKSpriteNode(imageNamed: ImageName.catSleep)
    cat.position = CGPoint(x: 150, y: 100)
    cat.zPosition = Layer.catSleep
    cat.physicsBody?.categoryBitMask = PhysicsCategory.Cat
    cat.physicsBody?.collisionBitMask = 0
    cat.physicsBody?.isDynamic = false
    cat.size = CGSize(width: size.width/2, height: size.height/5)
    addChild(cat)
//    animateCat()
  }
  
  func userIndicatorCircle() {
    let circle = SKShapeNode(circleOfRadius: 100)
    circle.position = CGPoint(x: catPurr.position.x, y: catPurr.position.y)
    circle.zPosition = 1
    circle.strokeColor = .white
    circle.glowWidth = 1.0
    circle.fillColor = .orange
    addChild(circle)
  }
  
  func animateUserIndicatorCircle() {
    
  }
  
  func buildCatPurr() {
    let catPurrAnimatedAtlas = SKTextureAtlas(named: "catPurr")
    var purrFrames: [SKTexture] = []
    
    let numImages = catPurrAnimatedAtlas.textureNames.count
    print("catPurrAnimatedAtlas:", catPurrAnimatedAtlas)
    print(numImages)
    for i in 1...numImages {
      let catPurrTextureName = "catPurr\(i)"
      print("CatPurrTextureName:", catPurrTextureName)
      let frame = catPurrAnimatedAtlas.textureNamed(catPurrTextureName)
      purrFrames.append(frame)
      print(frame)
      print(purrFrames)
    }
    catPurrFrames = purrFrames
    
    let firstFrameTexture = catPurrFrames[0]
    print(catPurrFrames)
    catPurr = SKSpriteNode(texture: firstFrameTexture)
    catPurr.position = CGPoint(x: frame.midX, y: frame.midY)
    catPurr.size = CGSize(width: 150, height: 150)
    addChild(catPurr)
    animateCatPurr()
  }
  
  func animateCatPurr() {
    catPurr.run(SKAction.repeatForever(SKAction.animate(with: catPurrFrames, timePerFrame: 0.2, resize: false, restore: true)),
                withKey:"catPurrInPlace")
  }
  
  func setUpScenery() {
    backgroundColor = .black
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
