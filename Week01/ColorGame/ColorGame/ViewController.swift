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
    var firstValue = 0
    var secondValue = 0
    var thirdValue = 0
    let defaultColorName = "Color Name"
    let RGBMode = 0
    let HSBMode = 1
    var currentMode: Int? = nil
    
    // Sliders
    @IBOutlet weak var firstSlider: UISlider!
    @IBOutlet weak var secondSlider: UISlider!
    @IBOutlet weak var thirdSlider: UISlider!
    
    // Labels
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var firstSliderNameLabel: UILabel!
    @IBOutlet weak var secondSliderNameLabel: UILabel!
    @IBOutlet weak var thirdSliderNameLabel: UILabel!
    @IBOutlet weak var colorNameLabel: UILabel!

    // Controls
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorNameLabel.text = defaultColorName
        currentMode = RGBMode


    }
    
    //MARK: Actions
    // Update sliders' labels
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        switch slider {
        case firstSlider:
            firstLabel.text = String(currentValue)
            firstValue = currentValue
        case secondSlider:
            secondLabel.text = String(currentValue)
            secondValue = currentValue
        case thirdSlider:
            thirdLabel.text = String(currentValue)
            thirdValue = currentValue
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
        firstValue = 0
        secondValue = 0
        thirdValue = 0
        currentValue = 0
        self.view.backgroundColor = UIColor.white
        firstLabel.text = String(currentValue)
        secondLabel.text = String(currentValue)
        thirdLabel.text = String(currentValue)
        firstSlider.value = Float(currentValue)
        secondSlider.value = Float(currentValue)
        thirdSlider.value = Float(currentValue)
        colorNameLabel.text = defaultColorName
    }

    // Switches b/w RGB and HSB modes
    @IBAction func toggleMode(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
            case RGBMode:
                currentMode = RGBMode
                setColorNames(firstSliderName: "Red", secondSliderName: "Green", thirdSliderName: "Blue")
                setSliderValues(firstSliderValue: 255, secondSliderValue: 255, thirdSliderValue: 255)
            case HSBMode:
                currentMode = HSBMode
                setColorNames(firstSliderName: "Hue", secondSliderName: "Saturation", thirdSliderName: "Brightness")
                setSliderValues(firstSliderValue: 360, secondSliderValue: 100, thirdSliderValue: 100)
            default:
                break
        }
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
        
        let backgroundColor: UIColor!
        if currentMode == RGBMode {
            backgroundColor = UIColor(red: CGFloat(Float(firstValue) / 255), green: CGFloat(Float(secondValue) / 255), blue: CGFloat(Float(thirdValue) / 255), alpha: 1.0)
        } else {
            backgroundColor = UIColor(hue: CGFloat(Float(firstValue) / 360), saturation: CGFloat(Float(secondValue) / 100), brightness: CGFloat(Float(thirdValue) / 100), alpha: 1.0)
        }
        self.view.backgroundColor = backgroundColor
        
    }

    // Sets sliders' names
    func setColorNames(firstSliderName: String, secondSliderName: String, thirdSliderName: String) {
        firstSliderNameLabel.text = firstSliderName
        secondSliderNameLabel.text = secondSliderName
        thirdSliderNameLabel.text = thirdSliderName
    }
    
    // Sets slides' values
    func setSliderValues(firstSliderValue: Float, secondSliderValue: Float, thirdSliderValue: Float) {
        reset()
        firstSlider.maximumValue = firstSliderValue
        secondSlider.maximumValue = secondSliderValue
        thirdSlider.maximumValue = thirdSliderValue
    }

 }

