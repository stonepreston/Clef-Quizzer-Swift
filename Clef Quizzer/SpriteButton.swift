//
//  SpriteButton.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/13/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteButton: SKSpriteNode {
    
    //used in checking the users answer
    enum ButtonType: String {
        
        case A = "a",
        B = "b",
        C = "c",
        D = "d",
        E = "e",
        F = "f",
        G = "g"
    }
    
    //stores the type of the button
    let buttonType: ButtonType
    
    //closure is set in the scene. the closure is called whenever the button is tapped
    var buttonPressedFunc: ((button: SpriteButton) -> ())?
   
    init(texture: SKTexture, buttonType: ButtonType) {
        
        self.buttonType = buttonType
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.userInteractionEnabled = true
        
        
    }
    
    //called when the user taps the button
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        animateForTouchDown()
        
        
       
    }
    
    //called when the user finishes touching the button
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        animateForTouchUp()
        
        //call the function that gets set in the scene passing in the button as a parameter
        if let buttonPressed = self.buttonPressedFunc {
            
            buttonPressed(button: self)
            
        }
    }
    
    //shrinks the button when the user presses down
    func animateForTouchDown() {
        
        self.runAction(SKAction.scaleBy(0.8, duration: 0.1))
        
    }
    
    //enlarges the button when the user finishes touching the button
    func animateForTouchUp() {
        
        self.runAction(SKAction.scaleBy(1.25, duration: 0.1))
        
    }
    
    //not used but required to be here
    required init?(coder aDecoder: NSCoder) {
        self.buttonType = ButtonType.A
        super.init(coder: aDecoder)
        
        
    }
    
    
}
