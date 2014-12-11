//
//  GameplayScene.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/11/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class GameplayScene: SKScene {
    
    
    //stores whether or not to use colored notes/buttons
    let colored: Bool!
    
    let buttonPadding: CGFloat = 25.0
    
    //stores the currentNote displayed on screen
    var currentNote: NoteNode!
    
    //stores the array of note types that are used to randomly generate a note
    let noteTypes: Array<Int>!
    
    let backgroundNode: BackgroundNode!
    
    //the label that notifies the user if his answer was correct or incorrect
    var correctOrIncorrectLabel: SKLabelNode!
        

    
    //designated initializer
    init(size: CGSize, colored: Bool) {
        
        
        super.init(size: size)
        self.colored = colored
        self.noteTypes = generateNoteTypesForNoteRanges(GameState.sharedInstance.noteRanges)
        self.currentNote = randomNote()
        self.correctOrIncorrectLabel = addCorrectOrIncorrectlabel()
        self.backgroundNode = BackgroundNode(clef: GameState.sharedInstance.clefType, position: CGPoint(x: 0.0, y: CGRectGetMidY(self.frame)), size: self.frame.size)
        self.addChild(backgroundNode)
        self.addButtons()
        self.backgroundColor = UIColor.whiteColor()
    
        
        
        
    }
    
    
    //creates a random note using the note types in the range(s) the user selected
    func randomNote() -> NoteNode {
        
        var note: NoteNode
        var randomNoteType: Int
        
        //generate a random index
        var randomIndex = random(0, self.noteTypes.count - 1)
        
        //pick a note type using the randomIndex
        randomNoteType = self.noteTypes[randomIndex]
        //create the note using the random note type
        note = NoteNode(type: randomNoteType, clef: GameState.sharedInstance.clefType, frame: self.frame, colored: self.colored)
        
        //the following prevents the same note being generate twice in a row
        if let currentNote = self.currentNote {
            
            while (note.type == currentNote.type) {
                
                //generate another random index
                randomIndex = random(0, self.noteTypes.count - 1)
                //pick a note type using the randomIndex
                randomNoteType = self.noteTypes[randomIndex]
                //create the note using the random note type
                note = NoteNode(type: randomNoteType, clef: GameState.sharedInstance.clefType, frame: self.view!.frame, colored: self.colored)
            }
            
        }
        
        //set the notes position (for some reason setting the notes position in NoteNode doesnt do it correctly all the time:
        note.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        //add the note as a child of the scene
        self.addChild(note)
        println("note: \(note.description)")
        return note
        
    
    }
    
    //returns an array of ints so we can convert to Treble, Bass, Alto, and Tenor note types
    func generateNoteTypesForNoteRanges(noteRanges: Array<NoteRange>) -> Array<Int> {
        
        var noteTypes: Array<Int> = []
        
        for noteRange in noteRanges {
            
            //add all the line numbers to the noteTypes array
            if noteRange == NoteRange.Lines {
                
                //lines start at 8. they are every even number up to and including 16
                for type in 8...16 {
                    
                    //add the type to the note types array if its even
                    if type % 2 == 0 {
                        
                        noteTypes.append(type)
                        
                    }
                    
                }
                
            }
            
            //add all the spaces numbers to the noteTypes array
            if noteRange == NoteRange.Spaces {
                
                //spaces start at 9. they are every odd number up to and including 15
                for type in 9...15 {
                    
                    if type % 2 != 0 {
                        
                        noteTypes.append(type)
                        
                    }
                    
                }
            }
            
            //add all the uppwer ledger line numbers to the noteTypes array
            if noteRange == NoteRange.UpperLedgerLines {
                
                //upper ledger lines start at 17. they are every number up to and including 24
                for type in 17...24 {
                    
                    noteTypes.append(type)
                }
                
            }
            
            //add all the lower ledger line numbers to the noteTypes array
            if noteRange == NoteRange.LowerLedgerLines {
                
                //lower ledger lines start at 0. they are every number up to and including 7
                for type in 0...7 {
                    
                    noteTypes.append(type)
                }
            }
        }
        
        return noteTypes
    }
    
    //creates the correct or incorrect label
    func addCorrectOrIncorrectlabel() -> SKLabelNode {
        
        var label: SKLabelNode = SKLabelNode(fontNamed: font)
        label.position = CGPoint(x: self.frame.size.width - 150, y: 90)
        label.text = "Correct!"
        label.fontSize = 21.0
        label.fontColor = UIColor.blackColor()
        label.alpha = 0.0
        addChild(label)
        
        return label
        
    }
    
    //fades the correct/incorrect label in or out
    func fadeLabelInAndOut(label: SKLabelNode) {
        
        let fadeIn = SKAction.fadeInWithDuration(0.5)
        let fadeOut = SKAction.fadeOutWithDuration(0.5)
        let wait = SKAction.waitForDuration(0.5)
        
        //remove all actions currently running on the label (this cancels any actions so the fade can start fresh from whatever opacity it was previously at
        label.removeAllActions()
        
        //animates the label to fade in and out
        let sequence = [fadeIn, wait, fadeOut]
        label.runAction(SKAction.sequence(sequence))
        
        
    }
    
    //adds all the buttons to the scene
    func addButtons() {
        
        //grab a texture to get the size the buttons are going to be
        let texture: SKTexture = SKTexture(imageNamed: "a_button")
        let buttonRowSize = (texture.size().width * CGFloat(notes.count)) + (CGFloat(buttonPadding) * CGFloat(notes.count - 1))
        var startingX = CGFloat((self.size.width - buttonRowSize) / 2.0)
        for (index, value) in enumerate(notes) {
            
            let imageName = value + "_button"
            let buttonTexture = SKTexture(imageNamed: imageName)
            let button: SpriteButton = SpriteButton(texture: buttonTexture, buttonType: SpriteButton.ButtonType(rawValue: value)!)
            button.anchorPoint = CGPoint(x: 0, y: 0.5)
            button.name = value + "_button"
            button.position = CGPoint(x: startingX, y: 30)
            button.zPosition = 20
            //the following function is called whenever a button is tapped
            button.buttonPressedFunc = buttonPressed
            
            if (self.colored == true) {
                
                button.color = colors[value]!
                button.colorBlendFactor = 1.0
                
            } else {
                
                button.color = UIColor.blackColor()
                button.colorBlendFactor = 1.0
                
            }
            
            startingX = startingX + button.size.width + buttonPadding
            self.addChild(button)
            
            
        }
        
       
        
        
        
        
    }
    
    //checks the users answer to see if its correct
    func checkNoteForButton(button: SpriteButton) -> Bool {
        
        if (currentNote.letterName == button.buttonType.rawValue) {
            
            //correct
            return true
        } else {
            
            //incorrect
            return false
        }
    }
    
    //called when a button is tapped
    func buttonPressed(button: SpriteButton) {
        
        if (checkNoteForButton(button)) {
            
            //user got the answer correct
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
        }
        
        //animate the label
        self.fadeLabelInAndOut(self.correctOrIncorrectLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   
    
    
    
    
    
}
