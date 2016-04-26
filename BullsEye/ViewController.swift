//
//  ViewController.swift
//  BullsEye
//
//  Created by Matthew Riddle on 21/04/2016.
//  Copyright © 2016 Matthew Riddle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, forState: .Normal)
    
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)

    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    if let trackLeftImage = UIImage(named: "SliderTrackLeft") { let trackLeftResizable =
      trackLeftImage.resizableImageWithCapInsets(insets)
      slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
    }
    if let trackRightImage = UIImage(named: "SliderTrackRight") {
      let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
      slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
    }
    
    super.viewDidLoad()
    startNewGame()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
    let title = titleForPoints(points)
  
    points += awardBonusPoints(difference)
    score += points
  
    let message = "You scored \(points) points"

    let alert = UIAlertController(title: title,
      message: message,
      preferredStyle: .Alert)
      
    let action = UIAlertAction(title: "OK", style: .Default,
      handler: { action in
        self.startNewRound()
        self.updateLabels()
      }
    )
      
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
  }

  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startNewGame() {
    round = 0
    score = 0
    startNewRound()
    updateLabels()
  }
  
  func startNewRound() {
    round += 1
    currentValue = 50
    targetValue = 1 + Int(arc4random_uniform(100))
    slider.value = Float(currentValue)
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  func titleForPoints(points: Int) -> String {
    if (points < 25) {
      return "Terrible"
    } else if (points < 50) {
      return "You can do better"
    } else if (points < 75) {
      return "You're close"
    } else if (points < 100) {
      return "Almost had it"
    } else {
      return "Nailed it"
    }
  }
  
  func awardBonusPoints(difference: Int) -> Int {
    if (difference == 0) {
      return 100
    } else if (difference == 1) {
      return 50
    } else {
      return 0
    }
  }
}

