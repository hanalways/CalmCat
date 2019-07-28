//  GameScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyrightå © 2019 Hana Clements. All rights reserved.


import SpriteKit
import UIKit

class GameScene: SKScene {
  var dismissDelegate:GameSceneDelegate?
  
  var gameViewController:GameViewController!
  
  // SPRITE CLASS VARIABLES
  private var catPurr = SKSpriteNode()
  private var catPurrFrames: [SKTexture] = []
  private var catFacePalm = SKSpriteNode()
  private var catFacePalmFrames: [SKTexture] = []
  private var catWalk = SKSpriteNode()
  private var catWalkFrames: [SKTexture] = []
  var fingerPointer = SKSpriteNode()
  private var fingerPointFrames: [SKTexture] = []
  private let circle = SKShapeNode(circleOfRadius: 20)
  var timerNode = SKLabelNode()
  
  // TIMER/SCORING VARIABLES
  var seconds = 20
  var gameTimer = Timer()
  var isTimerRunning = false
  var timeOfLastTap = -1.0
  var timeDifferences = [Double]()
  var medianTapTime = 1.0
  var timeDifference = 1.0
  
  var scoringPhase = false
  var score = 0
  var totalTaps = 0

  
  
  override func didMove(to view: SKView) {
    countDown()
  }
  
  func countDown() {
    let count = SKLabelNode(fontNamed: "RichelaKids")
    count.fontSize = 65
    count.position = CGPoint(x: frame.midX, y: frame.midY)
    addChild(count)
    
    for i in 1...3 {
      count.text = "\(i)..."
      
    }
    setUpScenery()
    buildCatWalk()
    
    buildFingerPointer()
    userIndicatorCircle()

  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let realTouch = touches.first else {
      return
    }
    let position = realTouch.location(in: self)
    
    let touchNodes = self.nodes(at: position)
    touchNodes.forEach { (node) in
      if node.name == "circle" {
        initializingExercise()
      } else if node.name == "replayButton" {
        self.dismissDelegate?.dismiss()
      }
    }
  }
  
  //MARK: Timer functions
  @objc func initializingExercise() {
    let timeOfCurrentTap = NSDate().timeIntervalSince1970
    
    if timeOfLastTap > 0 {
      timeDifference = timeOfCurrentTap - timeOfLastTap
    }
    
    if !scoringPhase {
      initializeMedianTapTime()
    } else {
      scoreTaps()
    }
    
    timeOfLastTap = timeOfCurrentTap
    print(timeDifference)
  }
  
  func initializeMedianTapTime() {
    if timeOfLastTap > 0 {
      timeDifferences.append(timeDifference)
    }
    
    if timeDifferences.count == 8 {
      medianTapTime = timeDifferences.sorted(by: <)[timeDifferences.count/2]
      scoringPhase = true
      buildBreathingExercise()
    }
  }

  func buildBreathingExercise() {
    fingerPointer.removeFromParent()
    updateCircle()
    runTimer()
  }
  
  func scoreTaps() {
    totalTaps += 1
    
    if (medianTapTime - 0.1) <= timeDifference && timeDifference <= (medianTapTime + 0.1) {
      score += 1
      print(score)
    }
    
    if !isTimerRunning {
      let totalScore = Double(score)/Double(totalTaps)
      if totalScore > 0.6 {
        print("Success!")
        print(totalScore)
        successScreen()
      } else {
        print("Failure")
        print(totalScore)
        failScreen()
      }
      
      buildReplayButton()
      timerNode.isHidden = true
      circle.isHidden = true
      timerNode.removeFromParent()
      catWalk.removeFromParent()
    }
    
  }

  
  func buildTimer() {
    timerNode.fontName = "Helvetica Neue-Light"
    timerNode.text = "2:00"
    timerNode.fontSize = 30
    timerNode.fontColor = .white
    timerNode.position = CGPoint(x: frame.midX, y: frame.maxY - 75)
    timerNode.zPosition = 1
    addChild(timerNode)
  }
  
  func runTimer() {
    buildTimer()
    gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    isTimerRunning = true
  }
  
  @objc func updateTimer() {
    if seconds < 1 {
      gameTimer.invalidate()
      isTimerRunning = false
    } else {
      seconds -= 1
      timerNode.text = timeString(time: TimeInterval(seconds))
    }
  }
  
  func timeString(time:TimeInterval) -> String {
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    let rString = String(format: "\(minutes):%02d", seconds)
    return rString
  }
  
  func startButtonTapped() {
    if isTimerRunning == false {
      runTimer()
    }
  }
  


  //MARK: Segue out screens
  func buildReplayButton() {
    let replayButton = SKLabelNode(text: ">> replay?")
    replayButton.name = "replayButton"
    replayButton.position = CGPoint(x: frame.midX, y: frame.minY + 200)
    replayButton.zPosition = 3
    addChild(replayButton)
  }
  
  func successScreen() {
    buildCatPurr()
    let successNode = SKLabelNode(text: "Success!")
    successNode.fontName = "AvenirNext-Bold"
    successNode.color = .green
    successNode.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
    successNode.fontSize = 80
    successNode.zPosition = 2
    addChild(successNode)
  }
  
  func failScreen() {
      buildCatFacePalm()
    
    let failNode = SKLabelNode(text: "Failure!")
    failNode.fontName = "AvenirNext-Bold"
    failNode.color = .green
    failNode.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
    failNode.fontSize = 80
    failNode.zPosition = 2
    addChild(failNode)
    
  }



  
  
  //MARK: Circle functions
  func userIndicatorCircle() {
    circle.name = "circle"
    circle.zPosition = 2
    circle.strokeColor = SKColor.white.withAlphaComponent(0.7)
    circle.fillColor = .clear
    circle.position = CGPoint(x: fingerPointer.position.x - 25, y: fingerPointer.position.y + 45)
      circle.glowWidth = 1.0
    
    addChild(circle)
    animateUserIndicatorCircle()
  }
    
  func animateUserIndicatorCircle() {
    let pulseUp = SKAction.scale(to: 1.0, duration: 0.7)
    let pulseDown = SKAction.scale(to: 0.5, duration: 0.7)
    let pulse = SKAction.sequence([pulseUp, pulseDown])
    let repeatPulse = SKAction.repeatForever(pulse)
    self.circle.run(repeatPulse)
  }
  
  func updateCircle() {
    circle.position = CGPoint(x: fingerPointer.position.x - 25, y: fingerPointer.position.y + 45)
    circle.glowWidth = 1.5
    
    let pulseOut = SKAction.scale(to: 4.0, duration: 4*medianTapTime)
    let pulseIn = SKAction.scale(to: 0.5, duration: 4*medianTapTime)
    let sequence = SKAction.sequence([pulseOut, pulseIn])
    circle.removeAllActions()
    
    circle.run(SKAction.repeatForever(sequence))
  }

  
  
  //MARK: FingerPointer Node
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
    fingerPointer.position = CGPoint(x: frame.midX + 10, y: frame.midY - 250)
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
  
  //MARK: All of the Cats!
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
    let walkRight = SKAction.moveTo(x: catWalk.position.x + 190, duration: 2.0)
    let walkLeft = SKAction.moveTo(x: catWalk.position.x - 190, duration: 2.0)
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

  func buildCatFacePalm() {
    let catFacePalmAnimatedAtlas = SKTextureAtlas(named: "catFacePalm")
    var facePalmFrames: [SKTexture] = []
    
    let numImages = catFacePalmAnimatedAtlas.textureNames.count
    
    for i in 1...numImages {
      let catFacePalmTextureName = "catFacePalm\(i)"
      let frame = catFacePalmAnimatedAtlas.textureNamed(catFacePalmTextureName)
      facePalmFrames.append(frame)
    }
    catFacePalmFrames = facePalmFrames
    
    let firstFrameTexture = catFacePalmFrames[0]
    catFacePalm = SKSpriteNode(texture: firstFrameTexture)
    catFacePalm.position = CGPoint(x: frame.midX, y: frame.midY)
    catFacePalm.zPosition = 2
    
    addChild(catFacePalm)
    animateCatFacePalm()
  }

  
  func animateCatFacePalm() {
    catFacePalm.run(SKAction.repeatForever(SKAction.animate(with: catFacePalmFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey:"catFacePalmAnimation")
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
