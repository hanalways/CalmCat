//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit
import UIKit

class GameScene: SKScene {
  var gameViewController:GameViewController!
  
  private var catPurr = SKSpriteNode()
  private var catPurrFrames: [SKTexture] = []
  private var catWalk = SKSpriteNode()
  private var catWalkFrames: [SKTexture] = []
  private var fingerPointer = SKSpriteNode()
  private var fingerPointFrames: [SKTexture] = []
  private let circle = SKShapeNode(circleOfRadius: 20)
  private let scorer = Score()
  private var timer = SKLabelNode()
  
  
  override func didMove(to view: SKView) {
    setUpScenery()
//    buildCatPurr()
    buildFingerPointer()
    userIndicatorCircle()
    buildCatWalk()
    

    
//    let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
//    view.addGestureRecognizer(recognizer)

  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let realTouch = touches.first else {
      return
    }
    let position = realTouch.location(in: self)
    
    let touchNodes = self.nodes(at: position)
    touchNodes.forEach { (node) in
      if node.name == "fingerPointer" {
        self.scorer.userButtonTapped()
      }
    }
    print(touchNodes)
  }
  
  func buildTimer() {
    timer.fontName = "Arial"
    timer.text = "2:00"
    timer.fontSize = 65
    timer.fontColor = .white
    timer.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
    timer.zPosition = 1
    addChild(timer)
  }
  
  func userIndicatorCircle() {
    
    circle.position = CGPoint(x: fingerPointer.position.x - 25, y: fingerPointer.position.y + 50)
    circle.zPosition = 1
    circle.strokeColor = SKColor.white.withAlphaComponent(0.5)
    circle.glowWidth = 1.0
    circle.fillColor = .clear
    
    addChild(circle)
    animateUserIndicatorCircle()
    
  }
    
  func animateUserIndicatorCircle() {
    let pulseUp = SKAction.scale(to: 1.0, duration: 0.7)
    let pulseDown = SKAction.scale(to: 0.0, duration: 0.7)
    let pulse = SKAction.sequence([pulseUp, pulseDown])
    let repeatPulse = SKAction.repeatForever(pulse)
    self.circle.run(repeatPulse)
  }
  
  
  func buildFingerPointer() {
    let fingerPointerAnimatedAtlas = SKTextureAtlas(named: "fingerPoint")
    var fingerFrames: [SKTexture] = []
    
    let numImages = fingerPointerAnimatedAtlas.textureNames.count
    for i in 1...numImages {
      let fingerPointTextureName = "fingerPoint\(i)"
      let frame = fingerPointerAnimatedAtlas.textureNamed(fingerPointTextureName)
      fingerFrames.append(frame)
    }
    fingerPointFrames = fingerFrames
    
    let firstFrameTexture = fingerFrames[0]
    print(firstFrameTexture)
    fingerPointer = SKSpriteNode(texture: firstFrameTexture)
    fingerPointer.position = CGPoint(x: frame.midX + 100, y: frame.minY + 120)
    fingerPointer.size = CGSize(width: size.width/6, height: size.height/7)
    fingerPointer.zPosition = 2
    fingerPointer.name = "fingerPointer"
    
    addChild(fingerPointer)
    animateFingerPointer()
  }
  
  func animateFingerPointer() {
    fingerPointer.run(SKAction.repeatForever(SKAction.animate(with: fingerPointFrames, timePerFrame: 0.7, resize: false, restore: true)),
                withKey:"fingerPointInPlace")
  }
  
  //MARK:ALL CAT RELATED THING
  func buildCatWalk() {
    let catWalkAnimatedAtlas = SKTextureAtlas(named: "catWalk")
    var walkFrames: [SKTexture] = []
    
    let numImages = catWalkAnimatedAtlas.textureNames.count
    
    for i in 1...numImages {
      let catWalkTextureName = "catWalk\(i)"
      let frame = catWalkAnimatedAtlas.textureNamed(catWalkTextureName)
      walkFrames.append(frame)
    }
    catWalkFrames = walkFrames
    
    let firstFrameTexture = catWalkFrames[0]
    catWalk = SKSpriteNode(texture: firstFrameTexture)
    catWalk.position = CGPoint(x: frame.minX + 200, y: frame.maxY - 375)
    catWalk.zPosition = 1
    catWalk.anchorPoint = CGPoint(x: 0, y: 0)
    addChild(catWalk)
    animateCatWalk()
  }
  
  func animateCatWalk() {
    let walkRight = SKAction.moveTo(x: catWalk.position.x + 180, duration: 2.0)
    let walkLeft = SKAction.moveTo(x: catWalk.position.x - 180, duration: 2.0)
    let faceRight = SKAction.scaleX(to: -1.0, duration: 0.1)
    let faceLeft = SKAction.scaleX(to: 1.0, duration: 0.1)
    let catWalkSequence = SKAction.sequence([faceRight, walkRight, faceLeft, walkLeft])
    let catWalkAnimation = SKAction.animate(with: catWalkFrames, timePerFrame: 0.2, resize: false, restore: true)

    
    catWalk.run(SKAction.repeatForever(catWalkAnimation),
                withKey:"catWalkInPlace")
    catWalk.run(SKAction.repeatForever(catWalkSequence),
                withKey:"catWalkBackAndForth")
  }
  
  
  func buildCatPurr() {
    let catPurrAnimatedAtlas = SKTextureAtlas(named: "catPurr")
    var purrFrames: [SKTexture] = []
    
    let numImages = catPurrAnimatedAtlas.textureNames.count
    
    for i in 1...numImages {
      let catPurrTextureName = "catPurr\(i)"
      let frame = catPurrAnimatedAtlas.textureNamed(catPurrTextureName)
      purrFrames.append(frame)
    }
    catPurrFrames = purrFrames
    
    let firstFrameTexture = catPurrFrames[0]
    catPurr = SKSpriteNode(texture: firstFrameTexture)
    catPurr.position = CGPoint(x: frame.midX, y: frame.midY)
    catPurr.zPosition = 2
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
