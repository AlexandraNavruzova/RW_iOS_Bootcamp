/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var targetTextLabel: UILabel!
  @IBOutlet weak var guessLabel: UILabel!
  
  @IBOutlet weak var redLabel: UILabel!
  @IBOutlet weak var greenLabel: UILabel!
  @IBOutlet weak var blueLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!

    var rgb = RGB()
    let game = BullsEyeGame()

  
  @IBAction func aSliderMoved(sender: UISlider) {
    let roundedValue = sender.value.rounded()
    let currentValue = Int(roundedValue)
    switch sender {
    case redSlider:
        redLabel.text = "R \(currentValue)"
        rgb.r = currentValue
    case greenSlider:
        greenLabel.text = "G \(currentValue)"
        rgb.g = currentValue
    case blueSlider:
        blueLabel.text = "B \(currentValue)"
        rgb.b = currentValue
    default:
        print("i don't know what's that")
    }
    guessLabel.backgroundColor = UIColor(rgbStruct: rgb)
  }
  
  @IBAction func showAlert(sender: AnyObject) {
    game.calculateScore(guessColor: rgb)
    
    let title = game.getTitle()
    
    let message = game.getMessage()
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: {
      action in
        self.reset()
        self.game.startNewRound()
        self.updateView()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func startOver(sender: AnyObject) {
    game.startNewGame()
    updateView()
    reset()
  }
  
  func updateView() {
    let targetColor = game.targetColor
    print(targetColor)
    targetLabel.backgroundColor = UIColor(rgbStruct: targetColor)
    roundLabel.text = "Round: \(game.round)"
    scoreLabel.text = "Score: \(game.score)"
    redSlider.value = 127
    greenSlider.value = 127
    blueSlider.value = 127
    }
    
    func reset() {
        rgb.r = 127
        rgb.g = 127
        rgb.b = 127
        guessLabel.backgroundColor = UIColor(rgbStruct: rgb)
        redLabel.text = "R \(rgb.r)"
        greenLabel.text = "G \(rgb.g)"
        blueLabel.text = "B \(rgb.b)"
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    reset()
    game.startNewGame()
    updateView()
  }
    
}

