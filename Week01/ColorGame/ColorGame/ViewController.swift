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
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()


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
    
}

