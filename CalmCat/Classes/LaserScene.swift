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
    
    var nodeA = SKShapeNode(circleOfRadius: 20)
    var nodeB: SKShapeNode? = nil
    var successes = 0
    var isGameScoring = false

    override func didMove(to view: SKView) {
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(circleOfRadius: 10)
            
//            rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            spinnyNode.zPosition = 4
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }

        
        backgroundColor = .black
        setUpScenery()
        buildCatSprite()
        
        setUpFirstNode()
        
    }

    func setUpFirstNode() {
        nodeA.name = "nodeA"
        nodeA.fillColor = .red
        nodeA.zPosition = 3
        nodeA.position = CGPoint(x: frame.midX, y: frame.midY + 300)
        
        
        addChild(nodeA)
    }

    func buildCatSprite() {
        catSprite.position = CGPoint(x: frame.midX, y: frame.midY)
        catSprite.zPosition = 2
        addChild(catSprite)
    }

    func animateCatSprite() {
        let catFrame = "cat\(catDirection)"
        let catTexture = SKTexture(imageNamed: catFrame)
        let switchFrame = SKAction.setTexture(catTexture, resize: true)
        catSprite.run(switchFrame)
    }



    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override func touchesEnded(_ touches:Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)

        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        
        let touchNodes = self.nodes(at: location)
        touchNodes.forEach { (node) in
            if node.name == "nodeA" && isGameScoring == false {
                if nodeB == nil { setUpNodeB() }
                isGameScoring = true
            }
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        
        if location.y < frame.midY {
            catDirection = "SouthEast"
        } else if location.y > frame.midY {
            catDirection = "NorthEast"
        } else {
            catDirection = "Neutral"
        }
        animateCatSprite()
        
        let touchNodes = self.nodes(at: location)
        touchNodes.forEach { (node) in
            if node.name == "nodeB" {
                replaceNode(node: nodeA)
            } else if node.name == "nodeA" {
                print("replace node B")
            }
        }
        
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    
    func replaceNode(node: SKShapeNode) {
        nodeA.removeFromParent()
        
        let height = self.view!.frame.height - 100
        let width = self.view!.frame.width - 100
        let randomPosition = CGPoint(x: CGFloat(arc4random()).truncatingRemainder(dividingBy: height), y: CGFloat(arc4random()).truncatingRemainder(dividingBy: width))
        nodeA.position = randomPosition
        
        addChild(nodeA)
        
        successes += 1
        print(successes)
        
    }
    
    func setUpNodeB() {
        print("hey this is being called!")
        
        let newNode = SKShapeNode(circleOfRadius: 20)
        newNode.name = "nodeB"
        newNode.fillColor = .green
        
        let height = self.view!.frame.height
        let width = self.view!.frame.width
        let randomPosition = CGPoint(x: CGFloat(arc4random()).truncatingRemainder(dividingBy: height), y: CGFloat(arc4random()).truncatingRemainder(dividingBy: width))
        
        newNode.position = randomPosition
        newNode.zPosition = 3
        
        self.nodeB = newNode
        
        addChild(newNode)
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
    
    
    //MARK: Laser pointer
    private var spinnyNode : SKShapeNode?
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
}

