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
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Actions
    // Keeps track of the current value of the slider and converts it to an Integer
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
}

