//
//  NoteNode.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/11/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class NoteNode: SKSpriteNode {
    
    let clef: ClefType
    //type is an int so we can use Treble, Bass, Alto, and Tenor note types, not just one. 
    let type: Int
    let colored: Bool
    //letter name is optional since fromRaw might not be able to convert all numbers passed in
    let letterName: String!
    
    //designated initializer
    init(type: Int, clef: ClefType, frame: CGRect, colored: Bool) {
        
        let imageName: String = String(format: "note_%02d", type)
        let imageTexture = SKTexture(imageNamed: imageName)
        self.clef = clef
        self.type = type
        self.colored = colored
        switch self.clef {
        
        //TODO: add tenor and alto clefs to the switch
        case ClefType.Treble:
            if let noteType = TrebleNotes(rawValue: self.type) {
                
                self.letterName = noteType.letterName
                
            }
            
        case ClefType.Bass:
            if let noteType = BassNotes(rawValue: self.type) {
                
                self.letterName = noteType.letterName
            }
            
        case ClefType.Tenor:
            if let noteType = TenorNotes(rawValue: self.type) {
                
                self.letterName = noteType.letterName
            }
            
        case ClefType.Alto:
            if let noteType = AltoNotes(rawValue: self.type) {
                
                self.letterName = noteType.letterName
            }
            
            
            
        
            
        default:
            //assign a default note of a until alto and tenor clefs are made
            self.letterName = "a"
        }
        
        //call super initializer
        super.init(texture: imageTexture, color: UIColor(), size: imageTexture.size())
       
        
        //set the notes position in the center of the frame
        self.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        
        //colorizes the note
        if (colored) {
            
            self.color = colors[self.letterName]!
            self.colorBlendFactor = 1.0
            
        } else {
            
            //makes the note black
            self.color = UIColor.blackColor()
            self.colorBlendFactor = 1.0
        }
        
    }
    
    //not used but required to be here
    required init?(coder aDecoder: NSCoder) {
        //assign default values to properties
        self.clef = ClefType.Treble
        self.type = TrebleNotes.ALower.rawValue
        self.colored = false
        self.letterName = "a"
        super.init(coder: aDecoder)
    }
    
    
    
    
    
    
}
