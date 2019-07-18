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
//  @IBOutlet weak var circleTaps: UIButton!
  
  var seconds = 2
  var timer = Timer()
  var isTimerRunning = false
  var timeOfLastTap = -1.0
  var timeDifferences = [Double]()
  var medianTapTime = 1.0
  let pulseLayer = CAShapeLayer()
  
  var scoringPhase = false
  var score = 0
  var totalTaps = 0

  
  func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    isTimerRunning = true
    displayTimer.isHidden = false
  }
  
  @objc func updateTimer() {
    if seconds < 1 {
      timer.invalidate()
      isTimerRunning = false
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
    print("tapped")
    let timeOfCurrentTap = NSDate().timeIntervalSince1970
    var timeDifference = 1.0
    
    if timeOfLastTap > 0 {
      timeDifference = timeOfCurrentTap - timeOfLastTap
    }

    if scoringPhase {
      scoreTaps(timeDifference: timeDifference)
    } else {
      initializeMedianTapTime(timeDifference: timeDifference)
    }
    
    timeOfLastTap = timeOfCurrentTap
  }
  
  func scoreTaps(timeDifference: Double) {
    totalTaps += 1
    
    if (medianTapTime - 0.1) <= timeDifference && timeDifference <= (medianTapTime + 0.1) {
      score += 1
      print(score)
    }
    
    if !isTimerRunning {
      let totalScore = Double(score)/Double(totalTaps)
      if totalScore > 0.6 {
        print("Success!")
        print(totalScore)
      } else {
        print("Failure")
        print(totalScore)
      }
    }

  }
  
  func initializeMedianTapTime(timeDifference: Double) {
    if timeOfLastTap > 0 {
      timeDifferences.append(timeDifference)
    }
    
    if timeDifferences.count == 8 {
      medianTapTime = timeDifferences.sorted(by: <)[timeDifferences.count/2]
      scoringPhase = true
      initializeUserTaps.setTitle("Tap This Circle", for: .normal)
      runTimer()
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
