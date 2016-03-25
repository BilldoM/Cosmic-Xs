//
//  ViewController.swift
//  Cosmic-Xs
//
//  Created by William Melvin on 3/20/16.
//  Copyright © 2016 William Melvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var alienImg: UIImageView!
    @IBOutlet weak var learnLabel: UILabel!
    @IBOutlet weak var multiplyTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var doMathOnButton: UIButton!
    @IBOutlet weak var multiplyLabel: UILabel!
    
    //Variables
    var multiplier: Int = 0
    var runningSum: Int = 0
    var pressCounter: Int = 0
    let maxPress = 12
    
    @IBAction func doMathOnPress(sender: AnyObject) {
        
        pressCounter = pressCounter + 1
        
        let newSum = runningSum * multiplier
        updateLabel(runningSum, mul: multiplier, newSum: newSum)
        runningSum = runningSum + 1
        
        if gameOver() {
            reloadGame()
        }
        
    }
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        
        if multiplyTextField.text != nil && multiplyTextField != "" {
        
        logoImg.hidden = false
        alienImg.hidden = false
        doMathOnButton.hidden = false
        multiplyLabel.hidden = false
        learnLabel.hidden = true
        multiplyTextField.hidden = true
        playButton.hidden = true
        
        resetLabel()
        multiplier = Int(multiplyTextField.text!)!
        runningSum = 0
        
        
        }
        
    }
    
    func reloadGame() {
        
        pressCounter = 0
        multiplier = 0
        multiplyTextField.text = ""
        logoImg.hidden = false
        alienImg.hidden = false
        learnLabel.hidden = false
        multiplyTextField.hidden = false
        playButton.hidden = false
        multiplyLabel.hidden = true
        doMathOnButton.hidden = true
        resetLabel()
    }
    
    func gameOver() -> Bool {
        if pressCounter >= maxPress {
            return true
        } else {
            return false
        }
    }
    
    func resetLabel() {
     multiplyLabel.text = "Press Xs to multiply!"
        
    }
    
    func updateLabel(oldSum: Int, mul: Int, newSum: Int) {
        multiplyLabel.text = "\(oldSum) x \(mul) = \(newSum)"
    }


}

