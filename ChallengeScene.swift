//
//  ChallengeScene.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/14/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class ChallengeScene: GameplayScene {
    
   let hud: ChallengeHud!
    
   override init(size: CGSize, colored: Bool) {
    
        //reset the lives and score
        GameState.sharedInstance.lives = MaxNumberOfLives
        GameState.sharedInstance.score = 0
    
        super.init(size: size, colored: colored)
        hud = ChallengeHud(position: CGPoint(x: 0, y: self.frame.height - 50), frame: self.frame)
        addChild(hud)
    }
    
    //called when the user tapps the button
    override func buttonPressed(button: SpriteButton) {
        
        if (checkNoteForButton(button)) {
            
            //user got the answer correct
            hud.addPoints()
            //remove the current note
            self.currentNote.removeFromParent()
            //generate a new random note
            self.currentNote = randomNote()
            
            //setup the label
            self.correctOrIncorrectLabel.text = "Correct!"
            self.correctOrIncorrectLabel.fontColor = UIColor(red: 56.0/255.0, green: 180.0/255.0, blue: 3.0/255.0, alpha: 1.0)
            
        } else {
            
            //user got the answer incorrect
            //setup the label
            self.correctOrIncorrectLabel.text = "Incorrect!"
            self.correctOrIncorrectLabel.fontColor = UIColor.redColor()
            
            //test for game over
            if (hud.loseLife()) {
                
                let gameOverScene: GameOverScene = GameOverScene(size: self.size)
                self.view.presentScene(gameOverScene)
            }
        }
        
        //animate the label
        self.fadeLabelInAndOut(self.correctOrIncorrectLabel)
    }
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
}
