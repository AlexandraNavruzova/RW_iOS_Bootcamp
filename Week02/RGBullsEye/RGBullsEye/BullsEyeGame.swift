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

import Foundation

class BullsEyeGame {  // might be class?
    var targetColor = RGB()
    var round = 0
    var score = 0
    var difference: Double = 0
    var points = 0

    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
        
    }
    
    func startNewRound() {
        targetColor.r = Int.random(in: 1...255)
        targetColor.g  = Int.random(in: 1...255)
        targetColor.b = Int.random(in: 1...255)
        self.round += 1
    }
    
    func calculateScore(guessColor: RGB) {
        difference = guessColor.difference(target: targetColor)
        print(difference)
        points = Int((1 - difference) * 100)
        print(points)
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
}
