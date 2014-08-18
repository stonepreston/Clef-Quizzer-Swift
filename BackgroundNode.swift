//
//  BackgroundNode.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/11/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class BackgroundNode: SKSpriteNode {
    
    //designated initializer
    init(clef: ClefType, position: CGPoint, size: CGSize) {
        
        //stores the background texture
        var backgroundTexture: SKTexture
        
        //switch on the clef paramter to set the appropriate background
        switch clef {
            
        case ClefType.Treble:
                backgroundTexture = SKTexture(imageNamed: "background_treble")
            
        case ClefType.Bass:
                backgroundTexture = SKTexture(imageNamed: "background_bass")
            
        case ClefType.Alto:
                backgroundTexture = SKTexture(imageNamed: "background_alto")
            
        case ClefType.Tenor:
            backgroundTexture = SKTexture(imageNamed: "background_tenor")
            
        }
        
        
        super.init(texture: backgroundTexture, color: UIColor(), size: size)
        //left-center align the background node
        anchorPoint = CGPoint(x: 0, y: 0.5)
        self.position = position
        
    }
    
    
    //not used but required to be here
    required init(coder aDecoder: NSCoder!) {
         super.init(coder: aDecoder)
    }
    
}
