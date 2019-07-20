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
    var sleepingZ = SKLabelNode(text: "Z")
    let bed = SKSpriteNode(imageNamed: ImageName.Bed)
    let table = SKSpriteNode(imageNamed: ImageName.Table)
    let window = SKSpriteNode(imageNamed: ImageName.Window)
    let wait = SKAction.wait(forDuration: 5.5)

    override func didMove(to view: SKView) {
        backgroundColor = .black
        buildCatWalk()
        buildZsWithAnimation()
        setUpScenery()
        animateCatYell()
    }
    
    func animateCatYell() {
        let catYell = SKSpriteNode(imageNamed: "catYell")
        catYell.position = CGPoint(x: frame.midX, y: frame.minY - 200)
        catYell.zPosition = 2
        addChild(catYell)
        
        let catYellMoveUp = SKAction.moveTo(y: 350, duration: 0.3)
        let sequence = SKAction.sequence([wait, catYellMoveUp])
        catYell.run(sequence)
    }
    
    func setUpScenery() {
        backgroundColor = .black

        bed.anchorPoint = CGPoint(x: 0, y: 0)
        bed.position = CGPoint(x: size.width * 0.0, y: frame.minY - 600)
        bed.zPosition = Layer.Bed
        bed.size = CGSize(width: size.width * 1.11, height: size.height * 0.6)
        addChild(bed)
        

        table.anchorPoint = CGPoint(x: 0, y: 0)
        table.position = CGPoint(x: size.width * 0.35, y: size.height * 0.6)
        table.zPosition = Layer.Table
        table.size = CGSize(width: size.width * 0.65, height: size.height * 0.3)
        table.alpha = 0.0
        addChild(table)
        
        window.anchorPoint = CGPoint(x: 0, y: 0)
        window.position = CGPoint(x: size.width * 0.1, y: size.height * 0.8)
        window.zPosition = Layer.Window
        window.size = CGSize(width: size.width * 0.23, height: size.height * 0.14)
        window.alpha = 0.0
        addChild(window)
        
        animateScenery()
    }
    
    func animateScenery() {
        let wait = SKAction.wait(forDuration: 7.0)
        let fadeInAction = SKAction.fadeIn(withDuration: 3.0)
        let sequence = SKAction.sequence([wait, fadeInAction])
        window.run(sequence)
        table.run(sequence)
        
        let bedMove = SKAction.moveTo(y: size.height * -0.1, duration: 0.7)
        let bedSequence = SKAction.sequence([wait, bedMove])
        bed.run(bedSequence)
        

    }
    
    func buildZsWithAnimation() {
        sleepingZ.position = CGPoint(x: frame.midX, y: frame.minY + 100)
        sleepingZ.fontName = "AvenirNext-Bold"
        sleepingZ.zPosition = 2
        sleepingZ.fontSize = 85
        sleepingZ.color = .white
        
        addChild(sleepingZ)
        
        let zMoveY = SKAction.moveTo(y: 300, duration: 2.0)
        let zFadeOut = SKAction.fadeOut(withDuration: 2.0)
        let zScale = SKAction.scale(to: 0.1, duration: 2.0)
        let zRotate = SKAction.rotate(byAngle: 1, duration: 1.0)
        
        let resetZY = SKAction.moveTo(y: frame.minY + 100, duration: 0.1)
        let resetZAlpha = SKAction.fadeIn(withDuration: 0.1)
        let resetZSize = SKAction.scale(to: 1.0, duration: 0.1)
        let zGroupOut = SKAction.group([zMoveY, zFadeOut, zScale, zRotate])
        let zGroupReset = SKAction.group([resetZY, resetZSize])
        let actionDone = SKAction.removeFromParent();
        
        let zSequence = SKAction.sequence([zGroupOut, zGroupReset, resetZAlpha])
        let endSequence = SKAction.sequence([wait, actionDone])
        
        sleepingZ.run(SKAction.repeatForever(zSequence), withKey: "SleepingZs")
        sleepingZ.run(endSequence)
        
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
        let pause = SKAction.wait(forDuration: 1.0)
        let walkRight = SKAction.moveTo(x: catWalk.position.x + 700, duration: 0.7)
        let closerY = SKAction.moveTo(y: catWalk.position.y - 150, duration: 0.1)
        let closestY = SKAction.moveTo(y: catWalk.position.y - 300, duration: 0.1)
        let scaleCat = SKAction.scale(by: 1.5, duration: 0.1)
        let walkLeft = SKAction.moveTo(x: catWalk.position.x - 700, duration: 0.7)
        let faceRight = SKAction.scaleX(to: -1.0, duration: 0.1)
        let faceLeft = SKAction.scaleX(to: 1.0, duration: 0.1)
        let actionDone = SKAction.removeFromParent();        let catWalkSequence = SKAction.sequence([faceRight, walkRight, closerY, pause, faceLeft, scaleCat, walkLeft, pause, faceRight, closestY, scaleCat, walkRight, actionDone])
        let catWalkAnimation = SKAction.animate(with: catWalkFrames, timePerFrame: 0.2, resize: false, restore: true)


        catWalk.run(catWalkAnimation,
                    withKey:"catWalkInPlace")
        catWalk.run(SKAction.repeatForever(catWalkSequence),
                    withKey:"catWalkBackAndForth")
    }
}
