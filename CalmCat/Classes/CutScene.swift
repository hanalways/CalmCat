//
//  CutScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/17/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit

class CutScene: SKScene {
    var catWalk:SKSpriteNode!
    var catWalkFrames: [SKTexture] = []
    var sleepingZ = SKLabelNode(text: "Z...")
    private let wait = SKAction.wait(forDuration: 1.0)
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        buildCatWalk()
        buildZsWithAnimation()
    }
    
    func buildZsWithAnimation() {
        sleepingZ.position = CGPoint(x: frame.midX, y: frame.minY + 100)
        sleepingZ.zPosition = 2
        sleepingZ.fontSize = 65
        sleepingZ.color = .white
        
        addChild(sleepingZ)
        
        let zMoveY = SKAction.moveTo(y: 300, duration: 2.0)
        let zFadeOut = SKAction.fadeOut(withDuration: 2.0)
        let zScale = SKAction.scale(to: 0.1, duration: 1.1)
        let zRotate = SKAction.rotate(byAngle: 5, duration: 1.0)
        
        let resetZY = SKAction.moveTo(y: frame.minY + 100, duration: 0.1)
        let resetZAlpha = SKAction.fadeIn(withDuration: 0.1)
        let resetZSize = SKAction.scale(to: 1.0, duration: 0.1)
        let zGroupOut = SKAction.group([zMoveY, zFadeOut, zScale, zRotate])
        let zGroupReset = SKAction.group([resetZY, resetZSize])
        let zSequence = SKAction.sequence([zGroupOut, zGroupReset, resetZAlpha])
        
        sleepingZ.run(SKAction.repeatForever(zSequence), withKey: "SleepingZs")
        
    }
    
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
        catWalk.position = CGPoint(x: frame.minX - 100, y: frame.maxY - 375)
        catWalk.zPosition = 1
        catWalk.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(catWalk)
        animateCatWalk()
    }

    func animateCatWalk() {
        let walkRight = SKAction.moveTo(x: catWalk.position.x + 700, duration: 0.7)
        let closerY = SKAction.moveTo(y: catWalk.position.y - 150, duration: 0.1)
        let closestY = SKAction.moveTo(y: catWalk.position.y - 300, duration: 0.1)
        let scaleCat = SKAction.scale(by: 1.5, duration: 0.1)
        let walkLeft = SKAction.moveTo(x: catWalk.position.x - 700, duration: 0.7)
        let faceRight = SKAction.scaleX(to: -1.0, duration: 0.1)
        let faceLeft = SKAction.scaleX(to: 1.0, duration: 0.1)
        let actionDone = SKAction.removeFromParent();        let catWalkSequence = SKAction.sequence([faceRight, walkRight, closerY, wait, faceLeft, scaleCat, walkLeft, wait, faceRight, closestY, scaleCat, walkRight, actionDone])
        let catWalkAnimation = SKAction.animate(with: catWalkFrames, timePerFrame: 0.2, resize: false, restore: true)


        catWalk.run(catWalkAnimation,
                    withKey:"catWalkInPlace")
        catWalk.run(SKAction.repeatForever(catWalkSequence),
                    withKey:"catWalkBackAndForth")
    }
}
