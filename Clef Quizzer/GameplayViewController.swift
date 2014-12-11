//
//  GameplayViewController.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/10/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GameplayViewController: UIViewController {
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        createSceneForMode(GameState.sharedInstance.mode)
    }
    

    func createSceneForMode(mode: Mode) {
        
        var scene: GameplayScene
        switch mode {
        
        case Mode.Training:
            scene = TrainingScene(size: self.view.bounds.size, colored: true)
            
        case Mode.Practice:
            scene = PracticeScene(size: self.view.bounds.size, colored: false)
        
        case Mode.Challenge:
            scene = ChallengeScene(size: self.view.bounds.size, colored: false)
            
        }
        
        // Configure the view.
        let skView: SKView = self.view as SKView
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }
    
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
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
