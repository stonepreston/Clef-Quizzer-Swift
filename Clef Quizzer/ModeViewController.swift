//
//  ModeViewController.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/10/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import UIKit

class ModeViewController: UIViewController {
    
    @IBAction func TrainingButtonPressed(sender: AnyObject) {
        
        handleButtonPressForMode(Mode.Training)
        
    }
    
    @IBAction func PracticeButtonPressed(sender: AnyObject) {
        
        handleButtonPressForMode(Mode.Practice)
    }
    
    @IBAction func ChallengeButtonPressed(sender: AnyObject) {
        
        handleButtonPressForMode(Mode.Challenge)
    }
    
    func handleButtonPressForMode(mode: Mode) {
        
        GameState.sharedInstance.mode = mode
        performSegueWithIdentifier("showGame", sender: self)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
