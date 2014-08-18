//
//  GameState.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/10/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation

let GameStateHighScoreKeyTreble = "highScoreTreble";
let GameStateHighScoreKeyBass = "highScoreBass";
let GameStateHighScoreKeyAlto = "highScoreAlto";
let GameStateHighScoreKeyTenor = "highScoreTenor";


class GameState {
    
    var clefType: ClefType!
    //these properties will have values after initialization
    var noteRanges: Array<NoteRange>!
    var mode: Mode!
    var lives: Int!
    var score: Int!
    
    
    
    
    //used to setup the singleton object propertie
    class func loadInstance() -> GameState {
        
      
        
        var gameState: GameState = GameState()
        //initialize the score, lives and note range
        gameState.score = 0
        gameState.lives = MaxNumberOfLives
        //create an empty note range array
        gameState.noteRanges = Array<NoteRange>()
    
        return gameState
        
    }
    
    //returns a singleton object
    class var sharedInstance : GameState {
        
        struct Static {
        
            static let instance: GameState = GameState.loadInstance()
        
        }
            
        return Static.instance
    }
    
        
    
    
    
}
