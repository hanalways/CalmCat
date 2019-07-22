//
//  BreathingTutorial.swift
//  CalmCat
//
//  Created by Hana Clements on 7/22/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit

class BreathingTutorialScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        let title = SKLabelNode(text: "How To Play")
        title.fontColor = .white
        title.position = CGPoint(x: frame.midX, y: frame.midY + 200)
        addChild(title)
    }

}
