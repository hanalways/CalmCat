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
    let catSprite = SKSpriteNode(imageNamed: "catNeutral")
    var catDirection = "SouthEast"

    override func didMove(to view: SKView) {
        backgroundColor = .black
        setUpScenery()
        buildCatSprite()
        buildPath()
        buildLaserPath()
    }
    
    func buildLaserPath() {
        var laserPoints: [SKNode] = []
        
        for i in 1...3 {
            let laserPoint = SKShapeNode(circleOfRadius: 5)
            laserPoint.position = CGPoint(x: (i * 50), y: (i * 50))
            laserPoint.zPosition = 3
            laserPoint.name = "point\(i)"
            laserPoint.fillColor = .red
            laserPoints.append(laserPoint)
        }
        
        laserPoints.forEach { point in
            print(point)
            addChild(point)
        }

    }
    
    func buildCatSprite() {
        catSprite.position = CGPoint(x: frame.midX, y: frame.midY)
        catSprite.zPosition = 3
        addChild(catSprite)
    }
    
    func animateCatSprite() {
        let catFrame = "cat\(catDirection)"
        let catTexture = SKTexture(imageNamed: catFrame)
        let switchFrame = SKAction.setTexture(catTexture, resize: true)
        catSprite.run(switchFrame)
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
    
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        
        if location.y < frame.midY {
            catDirection = "SouthEast"
            print(catDirection)
        } else if location.y > frame.midY {
            catDirection = "NorthEast"
            print(catDirection)
        } else {
            catDirection = "Neutral"
            print(catDirection)
        }
        animateCatSprite()
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
