//
//  ViewController.swift
//  BullsEye
//
//  Created by Ray Wenderlich on 6/13/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = BullsEyeGame()
    var quickDiff: Int {
        return abs(game.targetValue - game.currentValue)
    }

    
  //MARK: Outlets
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    game.startNewGame()
    updateView()
    slider.minimumTrackTintColor =
    UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)
  }

    
    
    // MARK: Actions
    //Starts a new game
    @IBAction func startNewGame() {
          game.startNewGame()
          updateView()
    }
    
    //Shows alert
  @IBAction func showAlert() {
    
    game.calculateScore()
    
    let title = game.getTitle()
    
    let message = game.getMessage()
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: {
      action in
        self.game.startNewRound()
        self.updateView()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
  }
  
    //Gets slider value
  @IBAction func sliderMoved(_ slider: UISlider) {
    let roundedValue = slider.value.rounded()
    game.currentValue = Int(roundedValue)
    slider.minimumTrackTintColor =
    UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)
  }

  
    // MARK: Functions
    //Updates views
  func updateView() {
    targetLabel.text = String(game.targetValue)
    scoreLabel.text = String(game.score)
    roundLabel.text = String(game.round)
    slider.value = Float(game.currentValue)
    slider.minimumTrackTintColor =
    UIColor.blue.withAlphaComponent(CGFloat(quickDiff)/100.0)
  }
}



