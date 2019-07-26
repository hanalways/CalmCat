//
//  DemoScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/23/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit

class DemoScene: SKScene {
    var demoViewController:DemoViewController!

    override func didMove(to view: SKView) {
        setUpScenery()
        buildTitle()
    }
    
    
    func buildCat() {
        let catSprite = SKSpriteNode(imageNamed: "catWalk")
        catSprite.position = CGPoint(x: frame.maxX - 100, y: frame.midY + 150)
        addChild(catSprite)
    }
    
    func instructions() {
        let instructionsA = SKLabelNode()
        instructionsA.text = "Calm the anxious cat"
        instructionsA.fontColor = .white
        instructionsA.fontSize = 20
        instructionsA.position = CGPoint(x: frame.minX + 120, y: frame.midY + 170)
        instructionsA.zPosition = 3
        addChild(instructionsA)
        
        let instructionsB = SKLabelNode()
        instructionsB.text = "by setting your"
        instructionsB.fontColor = .white
        instructionsB.fontSize = 20
        instructionsB.position = CGPoint(x: frame.minX + 120, y: frame.midY + 140)
        instructionsB.zPosition = 3
        addChild(instructionsB)
        
        let instructionsC = SKLabelNode()
        instructionsC.text = "consistent, internal rhythm"
        instructionsC.fontColor = .white
        instructionsC.fontSize = 20
        instructionsC.position = CGPoint(x: frame.minX + 120, y: frame.midY + 110)
        instructionsC.zPosition = 3
        addChild(instructionsC)
        
        let tapHere = SKSpriteNode(imageNamed: "tapHere")
        tapHere.position = CGPoint(x: frame.midX + 50, y: frame.minY + 250)
        tapHere.size = CGSize(width: 150, height: 80)
        tapHere.zPosition = 3
        addChild(tapHere)
    }
    
    func buildTitle() {
        let titleLabel = SKLabelNode(fontNamed: "RichelaKids")
        titleLabel.text = "How to Play"
        titleLabel.fontSize = 65
        titleLabel.fontColor = .white
        titleLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
        addChild(titleLabel)
    }
    
    func setUpScenery() {
        backgroundColor = .black
        let bed = SKSpriteNode(imageNamed: ImageName.Bed)
        bed.anchorPoint = CGPoint(x: 0, y: 0)
        bed.position = CGPoint(x: size.width * 0.0, y: size.height * -0.1)
        bed.zPosition = Layer.Bed
        bed.size = CGSize(width: size.width * 1.11, height: size.height * 0.6)
        addChild(bed)
        buildCat()
        instructions()
    }
}
