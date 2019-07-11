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
    
  var seconds = 70
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
//    let rString = "\(minutes):\(seconds)"
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
        medianTapTime = timeDifferences.sorted(by: <)[timeDifferences.count/2]
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

//    NOT WORKING - initializeUserTaps.layer.zPosition = CGFloat(integerLiteral: 1)
    initializeUserTaps.layer.cornerRadius = initializeUserTaps.frame.size.width/2.0
    createPulse()
  }
  
  func createPulse() {
    let circularPath = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width/5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
    pulseLayer.path = circularPath.cgPath
    pulseLayer.lineWidth = 2.0
    pulseLayer.fillColor = UIColor.clear.cgColor
    pulseLayer.strokeColor = UIColor.white.cgColor
    pulseLayer.lineCap = CAShapeLayerLineCap.round
    pulseLayer.position = CGPoint(x: initializeUserTaps.frame.size.width/2.0, y: initializeUserTaps.frame.size.height/2.0)
    initializeUserTaps.layer.addSublayer(pulseLayer)
    animatePulse()
  }
  
  func animatePulse() {
    let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
    scaleAnimation.duration = 5.0
    scaleAnimation.fromValue = 0.0
    scaleAnimation.toValue = 0.9
    scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    scaleAnimation.repeatCount = .greatestFiniteMagnitude
//    scaleAnimation.autoreverses = true
    pulseLayer.add(scaleAnimation, forKey: "scale")
  }
}
