//
//  MenuScene.swift
//  CalmCat
//
//  Created by Hana Clements on 7/28/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black
        let backgroundSound = SKAudioNode(fileNamed: "George Street Shuffle.mp3")
        self.addChild(backgroundSound)
    }

}
