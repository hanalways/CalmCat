//
//  CatWalk.swift
//  CalmCat
//
//  Created by Hana Clements on 7/19/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit

struct CatWalk {
    var catWalk = SKSpriteNode()
    var catWalkFrames: [SKTexture] = []

//    func buildCatWalk() {
//        let catWalkAnimatedAtlas = SKTextureAtlas(named: "catWalk")
//        var walkFrames: [SKTexture] = []
//
//        let numImages = catWalkAnimatedAtlas.textureNames.count
//
//        for i in 1...numImages {
//            let catWalkTextureName = "catWalk\(i)"
//            let frame = catWalkAnimatedAtlas.textureNamed(catWalkTextureName)
//            walkFrames.append(frame)
//        }
//        catWalkFrames = walkFrames
//
//        let firstFrameTexture = catWalkFrames[0]
//        catWalk = SKSpriteNode(texture: firstFrameTexture)
//        catWalk.position = CGPoint(x: frame.minX + 200, y: frame.maxY - 375)
//        catWalk.zPosition = 1
//        catWalk.anchorPoint = CGPoint(x: 0, y: 0)
//        addChild(catWalk)
//        animateCatWalk()
//    }
//
//    func animateCatWalk() {
//        let walkRight = SKAction.moveTo(x: catWalk.position.x + 180, duration: 2.0)
//        let walkLeft = SKAction.moveTo(x: catWalk.position.x - 180, duration: 2.0)
//        let faceRight = SKAction.scaleX(to: -1.0, duration: 0.1)
//        let faceLeft = SKAction.scaleX(to: 1.0, duration: 0.1)
//        let catWalkSequence = SKAction.sequence([faceRight, walkRight, faceLeft, walkLeft])
//        let catWalkAnimation = SKAction.animate(with: catWalkFrames, timePerFrame: 0.2, resize: false, restore: true)
//
//
//        catWalk.run(SKAction.repeatForever(catWalkAnimation),
//                    withKey:"catWalkInPlace")
//        catWalk.run(SKAction.repeatForever(catWalkSequence),
//                    withKey:"catWalkBackAndForth")
//    }
}
