//
//  PracticeScene.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/14/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit
class PracticeScene: GameplayScene {
    
    let hud: PracticeHudNode!
    
    //designated initializer
    override init(size: CGSize, colored: Bool) {
        super.init(size: size, colored: colored)
        //adds the hud to the scene
        hud = PracticeHudNode(position: CGPoint(x: 0, y: self.frame.height - 20), frame: self.frame)
        self.addChild(hud)
    }
    
    //called when the user taps a button
    override func buttonPressed(button: SpriteButton) {
        
        if (checkNoteForButton(button)) {
            
            //user got the answer correct
            hud.increaseCorrectLabel()
            //remove the current note
            self.currentNote.removeFromParent()
            //generate a new random note
            self.currentNote = randomNote()
            
            //setup the label
            self.correctOrIncorrectLabel.text = "Correct!"
            self.correctOrIncorrectLabel.fontColor = UIColor(red: 56.0/255.0, green: 180.0/255.0, blue: 3.0/255.0, alpha: 1.0)
            
        } else {
            
            //user got the answer incorrect
            hud.increaseIncorrectLabel()
            //setup the label
            self.correctOrIncorrectLabel.text = "Incorrect!"
            self.correctOrIncorrectLabel.fontColor = UIColor.redColor()
        }
        
        //animate the label
        self.fadeLabelInAndOut(self.correctOrIncorrectLabel)

        
    }
    
    //not used but required to be here
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}