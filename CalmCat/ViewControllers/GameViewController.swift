//  GameViewController.swift
//  CalmCat
//
//  Created by Hana Clements on 7/8/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//

import SpriteKit
import UIKit

class GameViewController: UIViewController {
  
  @IBOutlet weak var tapButton: UIButton!
  
  @IBOutlet weak var displayTimer: UILabel!
    
  @IBOutlet weak var initializeUserTaps: UIButton!
    
  var seconds = 120
  var timer = Timer()
  var isTimerRunning = false
  var timeOfLastTap = -1.0
  var timeDifferences = [Double]()
  
  func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    isTimerRunning = true
    displayTimer.isHidden = false
  }
  
  @objc func updateTimer() {
    if seconds < 1 {
      timer.invalidate()
    } else {
      seconds -= 1
      displayTimer.text = timeString(time: TimeInterval(seconds))
    }
  }
  
  func timeString(time:TimeInterval) -> String {
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    let rString = "\(minutes):\(seconds)"
    return rString
  }

  @IBAction func startButtonTapped() {
    if isTimerRunning == false {
      runTimer()
    }
  }
    
    
  @IBAction func userButtonTapped() {
    let timeOfCurrentTap = NSDate().timeIntervalSince1970
    
    if timeOfLastTap > 0 {
        let timeDifference = timeOfCurrentTap - timeOfLastTap
        timeDifferences.append(timeDifference)
        print(timeDifference)
    }
    timeOfLastTap = timeOfCurrentTap
    
    if timeDifferences.count == 10 {
        let medianTapTime = timeDifferences.sorted(by: <)[timeDifferences.count/2]
        print("This is the medianTapTime", medianTapTime)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let scene = GameScene(size: view.bounds.size)
    let skView = view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.ignoresSiblingOrder = true
    scene.scaleMode = .resizeFill
    skView.presentScene(scene)
    
    displayTimer.isHidden = true
    
  }
}
