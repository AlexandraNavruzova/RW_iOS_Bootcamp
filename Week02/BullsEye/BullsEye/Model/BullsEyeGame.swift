//
//  BullsEyeGame.swift
//  BullsEye
//
//  Created by Александра Наврузова on 06.06.2020.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import Foundation

class BullsEyeGame {
    
    var currentValue: Int
    var targetValue: Int
    var score: Int
    var round: Int
    
    var difference: Int
    var points: Int
    
    func startNewRound() {
      round += 1
      targetValue = Int.random(in: 1...100)
      currentValue = 50
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func calculateScore() {
        difference = abs(targetValue - currentValue)
        points = 100 - difference
        
        if difference == 0 {
          points += 100
        } else if difference == 1 {
            points += 50
        }
        
        score += points
                
    }
    
    func getTitle() -> String {
        let title: String
        if difference == 0 {
          title = "Perfect!"
        } else if difference < 5 {
          title = "You almost had it!"
        } else if difference < 10 {
          title = "Pretty good!"
        } else {
          title = "Not even close..."
        }

        return title
        
    }
    
    func getMessage() -> String {
        let message = "You scored \(points) points"
        return message
    }
    
    init() {
        self.currentValue = 0
        self.targetValue = 0
        self.score = 0
        self.round = 0
        self.difference = 0
        self.points = 0
    }
}
