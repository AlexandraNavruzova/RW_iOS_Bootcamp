//
//  ViewController.swift
//  ColorGame
//
//  Created by Александра Наврузова on 29.05.2020.
//  Copyright © 2020 Alexandra Navruzova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark: Properties
    var currentValue = 0
    var redValue = 0
    var greenValue = 0
    var blueValue = 0
    var defaultColorName = "Color Name"
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var colorNameLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        colorNameLabel.text = defaultColorName


    }
    
    //MARK: Actions
    // Update sliders' labels
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        switch slider {
        case redSlider:
            redLabel.text = String(currentValue)
            redValue = currentValue
        case greenSlider:
            greenLabel.text = String(currentValue)
            greenValue = currentValue
        case blueSlider:
            blueLabel.text = String(currentValue)
            blueValue = currentValue
        default:
            print("i don't know what's that")
        }
    }
    
    // Alert function
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Name the color!", message: "Give it a cool name", preferredStyle: .alert)
        let action = UIAlertAction(title: "Enter", style: .default, handler: {
            (alertAction) in
            let textField = alert.textFields![0] as UITextField
            let colorName: String = textField.text!
            self.setColorName(colorName: colorName)
            self.setBackgroundColor()
        })
        alert.addAction(action)
        alert.addTextField {(textField) in
            textField.text = "Enter color name"}
        
        present(alert, animated: true, completion: nil)
    }
    
    // Resets the labels and sliders
    @IBAction func reset() {
        redValue = 0
        greenValue = 0
        blueValue = 0
        currentValue = 0
        self.view.backgroundColor = UIColor.white
        redLabel.text = String(currentValue)
        greenLabel.text = String(currentValue)
        blueLabel.text = String(currentValue)
        redSlider.value = Float(currentValue)
        greenSlider.value = Float(currentValue)
        blueSlider.value = Float(currentValue)
        colorNameLabel.text = defaultColorName
    }
    
    //MARK: Functions
    // Sets the name of the colorNameLabel
    func setColorName(colorName: String) {
        if colorName == "" {
            colorNameLabel.text = "No color"
        } else {
            colorNameLabel.text = colorName
        }
    }
    
    // Sets the background color
    func setBackgroundColor() {
        let backgroundColor = UIColor(red: CGFloat(Float(redValue) / 255), green: CGFloat(Float(greenValue) / 255), blue: CGFloat(Float(blueValue) / 255), alpha: 1.0)
        self.view.backgroundColor = backgroundColor
        
    }

 }

