//
//  ChallengeHud.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/14/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class ChallengeHud: SKNode {
    
    //displays the users score
    let scoreLabel: SKLabelNode!
    
    //inits the challenge hud
    init(position: CGPoint, frame: CGRect) {
        
        //setup the score label
        scoreLabel = SKLabelNode(fontNamed: font)
        scoreLabel.fontColor = UIColor.blackColor()
        scoreLabel.fontSize = 30.0
        scoreLabel.text = String(format: "%d", GameState.sharedInstance.score)
        scoreLabel.position = CGPoint(x: frame.size.width - 20, y: -20)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        
        //call the superclass's init
        super.init()
        
        //set the position
        self.position = position
        //setup the lives
        var lastLife: SKSpriteNode?
        var life: SKSpriteNode
        for var i = 0; i < MaxNumberOfLives; i++ {
            
            
            //determine which life image to use
            switch GameState.sharedInstance.clefType! {
            
            //TODO: add in tenor and alto clefs
            case ClefType.Treble:
                life = SKSpriteNode(imageNamed: "treble_life")
                
            case ClefType.Bass:
                life = SKSpriteNode(imageNamed: "bass_life")
                
            default:
                life = SKSpriteNode(imageNamed: "treble_life")
                
            }
            
            life.name = String(format: "Life%d", i + 1)
            addChild(life)
            
            //find out if last life is nil or not
            if let theLastLife = lastLife {
                
                //last life is not nil, so position this life after hte last one
                life.position = CGPoint(x: theLastLife.position.x + 20, y: theLastLife.position.y)
                
            } else {
                
                //it was nil, so its the first life
                life.position = CGPoint(x: 20, y: -10)
            }
            
            lastLife = life
            
        }
        
        addChild(scoreLabel)
        
        
    }
    
    //adds points to the users score
    func addPoints() {
        
        GameState.sharedInstance.score = GameState.sharedInstance.score + PointsPerCorrectAnswer
        scoreLabel.text = String(format: "%d", GameState.sharedInstance.score)
        
        
    }
    
    //removes a life from the users lives
    func loseLife() -> Bool {
        
        //check to see if any lives are left
        if GameState.sharedInstance.lives > 0 {
            
            //remove the last life
            let name = String(format: "Life%d", GameState.sharedInstance.lives)
            var lifeToRemove: SKNode = self.childNodeWithName(name)
            lifeToRemove.removeFromParent()
            
            //update the game state lives
            GameState.sharedInstance.lives = GameState.sharedInstance.lives - 1
            
            
        }
        
        //this is used to test for a game over
        return GameState.sharedInstance.lives == 0
        
    }
    
    //note used but required to be here
    required init(coder aDecoder: NSCoder!) {
        
        //setup the score label
        scoreLabel = SKLabelNode(fontNamed: font)
        scoreLabel.fontColor = UIColor.blackColor()
        scoreLabel.fontSize = 30.0
        scoreLabel.text = String(format: "%d", GameState.sharedInstance.score)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        scoreLabel.position = CGPoint(x: 0, y: -20);
        
        super.init()

        
    }
}