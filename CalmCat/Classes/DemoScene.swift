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
        backgroundColor = .black
        setScenery()
        buildCatWalk()
        createMultilineLabel()
    }
    
    func createMultilineLabel() {
//        var text = "Calm the anxious cat by setting your consistent, internal rhythm."
        
        let instructionsA = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        instructionsA.text = "Calm the anxious"
        instructionsA.fontSize = 20
        instructionsA.position = CGPoint(x: frame.midX + 60, y: frame.midY + 230)
        instructionsA.zPosition = 2
        addChild(instructionsA)
        
        let instructionsB = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        instructionsB.text = "cat by setting"
        instructionsB.fontSize = 20
        instructionsB.position = CGPoint(x: frame.midX + 55, y: frame.midY + 200)
        instructionsB.zPosition = 2
        addChild(instructionsB)
        
        let instructionsC = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        instructionsC.text = "your consistent,"
        instructionsC.fontSize = 20
        instructionsC.position = CGPoint(x: frame.midX + 65, y: frame.midY + 170)
        instructionsC.zPosition = 2
        addChild(instructionsC)
        
        let instructionsD = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        instructionsD.text = "internal rhythm."
        instructionsD.fontSize = 20
        instructionsD.position = CGPoint(x: frame.midX + 55, y: frame.midY + 140)
        instructionsD.zPosition = 2
        addChild(instructionsD)
        
        let instructionsE = SKLabelNode(fontNamed: "RichelaKids")
        instructionsE.text = "Tap Here!"
        instructionsE.fontSize = 35
        instructionsE.fontColor = .red
        instructionsE.position = CGPoint(x: frame.midX + 60, y: frame.minY + 200)
        instructionsE.zPosition = 2
        addChild(instructionsE)
        
        
        
        
//            let tmp = text
//
//            text = "" // This avoid the text been duplicated
//
//            let myFontSize = 16.0
//            let myFontColor = UIColor.white
//
//            let separators = NSCharacterSet.whitespacesAndNewlines
//            let words = tmp.components(separatedBy: separators)
//            let lenght = words.count
//            let width = wordsPerLine + 1 // number of words per line + 1
//
//            // get the number of labelnode we need.
//            let totLines = (lenght/width)+1
//            var cnt = 0 // used to parse through the words array
//
//            // here is the for loop that create all the SKLabelNode that we need to
//            // display the string.
//
//            print("lenght: \(lenght) | width: \(width) = \(totLines)")
//
//            for i in (0 ..< totLines ) {
//
//                print("i: \(i)")
//                var lenghtPerLine = 0
//                var lineStr = ""
//                var wordCount = [String]()
//
//                while lenghtPerLine < width
//                {
//                    print("\(i) lenghtPerLine: \(lenghtPerLine) < width: \(width)")
//                    if cnt > (words.count)-1
//                    {
//                        break
//                    }
//                    else
//                    {
//
//                        lineStr = lineStr + " " + (words[cnt])
//
//                        wordCount = lineStr.components(separatedBy: separators)
//                        lenghtPerLine = wordCount.count
//                        cnt += 1
//
//                    }
//                } // END while
//
//                // creation of the SKLabelNode itself
//                let _multiLineLabel = SKLabelNode()
//                _multiLineLabel.text = lineStr
//                // name each label node so you can animate it if u wish
//                // the rest of the code should be self-explanatory
//                _multiLineLabel.name = "line \(i)"
//                _multiLineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
//                _multiLineLabel.fontSize = CGFloat(myFontSize)
//                _multiLineLabel.fontColor = myFontColor
//                let lineHeight = myFontSize + (myFontSize * 0.25)
//                let Top = 30
//                _multiLineLabel.position = CGPoint(x: 0, y: frame.midY)
//
//
//                addChild(_multiLineLabel)
//
//
//            } // END for loop
    }
    
    func buildCatWalk() {
        let catWalkAtlas = SKTextureAtlas(named: "catWalk")
        let catWalk = SKSpriteNode(texture: catWalkAtlas.textureNamed("catWalk1"))
        catWalk.position = CGPoint(x: frame.minX + 100, y: frame.midY + 175)
        catWalk.zPosition = 1
        
        addChild(catWalk)
    }
    
    func buildTitle() {
        let title = SKLabelNode(text: "How to Play")
        title.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
        title.zPosition = 2
        title.fontSize = 60
        title.fontName = "RichelaKids"
        addChild(title)
    }
    
    func setScenery() {
        let bed = SKSpriteNode(imageNamed: "bed")
        bed.anchorPoint = CGPoint(x: 0, y: 0)
        bed.position = CGPoint(x: size.width * 0.0, y: size.height * -0.1)
        bed.zPosition = Layer.Bed
        bed.size = CGSize(width: size.width * 1.11, height: size.height * 0.6)
        addChild(bed)
        
        buildTitle()
    }
}
