//
//  GameOverScene.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/14/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    override init(size: CGSize) {
        
        super.init(size: size)
        self.backgroundColor = UIColor.whiteColor()
        var gameOverNode: SKNode = SKNode()
        gameOverNode.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) )
        
        //setup the score label
        let scoreLabel: SKLabelNode = SKLabelNode(fontNamed: font)
        scoreLabel.text = String(format: "Score: %d", GameState.sharedInstance.score)
        scoreLabel.fontSize = 25.0
        scoreLabel.fontColor = UIColor.blackColor()
        scoreLabel.position = CGPoint(x: 0, y: 0)
        gameOverNode.addChild(scoreLabel)
        
        //setup the retry label
        let retryLabel: SKLabelNode = SKLabelNode(fontNamed: font)
        retryLabel.position = CGPoint(x: scoreLabel.position.x, y: scoreLabel.position.y - scoreLabel.frame.height)
        retryLabel.fontSize = 18.0
        retryLabel.fontColor = UIColor.blackColor()
        retryLabel.text = "Tap to Retry"
        gameOverNode.addChild(retryLabel)
        
        self.addChild(gameOverNode)
        

            
        
        
    }
    
    //called when the user taps the scene
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        //restart the challenge
        let scene: ChallengeScene = ChallengeScene(size: self.size, colored: false)
        scene.scaleMode = SKSceneScaleMode.AspectFill
        
        self.view!.presentScene(scene)

    }
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
