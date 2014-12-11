//
//  ClefViewController.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/10/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import UIKit

class ClefViewController: UIViewController {
    
    
    @IBAction func trebleClefButtonPressed(sender: AnyObject) {
        
        GameState.sharedInstance.clefType = ClefType.Treble
        self.performSegueWithIdentifier("showNotes", sender: self)
    }
    
    @IBAction func bassClefButtonPressed(sender: AnyObject) {
        
        GameState.sharedInstance.clefType = ClefType.Bass
        self.performSegueWithIdentifier("showNotes", sender: self)
    }
    
    @IBAction func altoClefButtonPressed(sender: AnyObject) {
        
        GameState.sharedInstance.clefType = ClefType.Alto
        self.performSegueWithIdentifier("showNotes", sender: self)
    }
    
    @IBAction func tenorClefButtonPressed(sender: AnyObject) {
        
        GameState.sharedInstance.clefType = ClefType.Tenor
        self.performSegueWithIdentifier("showNotes", sender: self)
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
