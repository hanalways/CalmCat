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
  var medianTapTime = 1.0
  let pulseLayer = CAShapeLayer()
  
  func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    isTimerRunning = true
    displayTimer.isHidden = false
  }
  
  @objc func updateTimer() {
    if seconds < 1 {
      timer.invalidate()
      displayTimer.isHidden = true
    } else {
      seconds -= 1
      displayTimer.text = timeString(time: TimeInterval(seconds))
    }
  }
  
  func timeString(time:TimeInterval) -> String {
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    let rString = String(format: "\(minutes):%02d", seconds)
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
    
    if timeDifferences.count == 8 {
        medianTapTime = timeDifferences.sorted(by: <)[timeDifferences.count/2]
        print("This is the medianTapTime", medianTapTime)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let view = view as? SKView {
      // Create the scene programmatically
      let scene = GameScene(size: view.bounds.size)
      scene.scaleMode = .resizeFill
      view.ignoresSiblingOrder = true
      view.showsFPS = true
      view.showsNodeCount = true
      view.presentScene(scene)
    }
    
    displayTimer.isHidden = true
  }
}
