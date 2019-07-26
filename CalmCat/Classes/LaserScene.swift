//
//  LaserScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/25/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit

class LaserScene: SKScene {
    var laserViewController:LaserViewController!

    override func didMove(to view: SKView) {
        backgroundColor = .black
        setUpScenery()
        catSprite()
        buildPath()
    }
    
    func buildPath() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0 ))
        path.addLine(to: CGPoint(x: 0, y: 1000))
        
        let move = SKAction.follow(path.cgPath,  asOffset: true, orientToPath: true, speed: 200)
        
        let pathLine = SKShapeNode(circleOfRadius: 20)
        pathLine.strokeColor = .red
        pathLine.zPosition = 2
        addChild(pathLine)
        
        pathLine.run(move)
    }
    
    func catSprite() {
        let catSprite = SKSpriteNode(imageNamed: "catLaunch")
        catSprite.position = CGPoint(x: frame.midX, y: frame.midY)
        catSprite.zPosition = 2
        addChild(catSprite)
    }
    
    func setUpScenery() {
        backgroundColor = .black
        let bed = SKSpriteNode(imageNamed: ImageName.Bed)
        bed.anchorPoint = CGPoint(x: 0, y: 0)
        bed.position = CGPoint(x: size.width * 0.0, y: size.height * -0.1)
        bed.zPosition = Layer.Bed
        bed.size = CGSize(width: size.width * 1.11, height: size.height * 0.6)
        addChild(bed)
    }
}
