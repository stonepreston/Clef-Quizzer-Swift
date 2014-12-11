//
//  Util.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/10/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import UIKit

//the range of notes used in the app
let notes = ["a", "b", "c", "d", "e", "f", "g"]

//the colors and the corressponding letters
let colors = ["a": UIColor.greenColor(),
              "b": UIColor.brownColor(),
              "c": UIColor.darkGrayColor(),
              "d": UIColor.blueColor(),
              "e": UIColor.redColor(),
              "f": UIColor.purpleColor(),
              "g": UIColor.cyanColor()]

//the font used throughout the app
let font = "Futura-CondensedMedium"

//the amount of points the user gets for a correct answer
let PointsPerCorrectAnswer = 100

//the types of clefs used in the app
enum ClefType {
    
    case Treble
    
    case Bass
    
    case Alto
    
    case Tenor
}

//the note ranges the user can select
enum NoteRange {
    
    case Lines
    
    case Spaces
    
    case UpperLedgerLines
    
    case LowerLedgerLines
    
    func description() -> String {
        
        switch self {
            
        case .Lines:
            
            return "Lines"
        
        case .Spaces:
            
            return "Spaces"
            
        case .UpperLedgerLines:
            
            return "UpperLedgerLines"
            
        case .LowerLedgerLines:
            
            return "lowerLedgerLines"
        }
    }
}


//the game modes
enum Mode {
    
    case Training
    
    case Practice
    
    case Challenge
}


    
//treble note types
enum TrebleNotes: Int {
    
    case DLower = 0,
    ELower,
    FLower,
    GLower,
    ALower,
    BLower,
    CLower,
    DSpace,
    ELine,
    FSpace,
    GLine,
    ASpace,
    BLine,
    CSpace,
    DLine,
    ESpace,
    FLine,
    GSpace,
    AUpper,
    BUpper,
    CUpper,
    DUpper,
    EUpper,
    FUpper,
    GUpper
    
    var letterName: String {
        
        switch self {
        
        case .ALower, .ASpace, .AUpper:
            return "a"
            
        case .BLine, .BLower, .BUpper:
            return "b"
            
        case .CLower, .CSpace, .CUpper:
            return "c"
            
        case .DLine, .DLower, .DSpace, .DUpper:
            return "d"
            
        case .ELine, .ELower, .ESpace, .EUpper:
            return "e"
            
        case .FLine, .FLower, .FSpace, .FUpper:
            return "f"
            
        case .GLine, .GLower, .GSpace, .GUpper:
            return "g"
            
            }
    }
    
    
};


//bass note types
enum BassNotes: Int {
    
    case FLower = 0,
    GLower,
    ALower,
    BLower,
    CLower,
    DLower,
    ELower,
    FSpace,
    GLine,
    ASpace,
    BLine,
    CSpace,
    DLine,
    ESpace,
    FLine,
    GSpace,
    ALine,
    BSpace,
    CUpper,
    DUpper,
    EUpper,
    FUpper,
    GUpper,
    AUpper,
    BUpper
    
    var letterName: String {
        
        switch self {
            
        case .ALine, .ALower, .ASpace, .AUpper:
            return "a"
        
        case .BLine, .BLower, .BSpace, .BUpper:
            return "b"
        
        case .CLower, .CSpace, .CUpper:
            return "c"
            
        case .DLine, .DLower, .DUpper:
            return "d"
            
        case .ELower, .ESpace, .EUpper:
            return "e"
            
        case .FLine, .FLower, .FSpace, .FUpper:
            return "f"
        
        case .GLine, .GLower, .GSpace, .GUpper:
            return "g"
            
            }
    }
    
};

//tenor note types
enum TenorNotes: Int {
    
    case CLower = 0,
    DLower,
    ELower,
    FLower,
    GLower,
    ALower,
    BLower,
    CSpace,
    DLine,
    ESpace,
    FLine,
    GSpace,
    ALine,
    BSpace,
    CLine,
    DSpace,
    ELine,
    FSpace,
    GUpper,
    AUpper,
    BUpper,
    CUpper,
    DUpper,
    EUpper,
    FUpper
    
    var letterName: String {
        
        switch self {
            
            case .ALine, .ALower, .AUpper:
            return "a"
            
            case .BLower, .BUpper, .BSpace:
            return "b"
            
            case .CLower, .CSpace, .CUpper, .CLine:
            return "c"
            
            case .DLine, .DLower, .DUpper, .DSpace:
            return "d"
            
            case .ELower, .ESpace, .EUpper, .ELine:
            return "e"
            
            case .FLine, .FLower, .FSpace, .FUpper:
            return "f"
            
            case .GLower, .GSpace, .GUpper:
            return "g"
            
        }
    }
    
};

//alto note types
enum AltoNotes: Int {
    
    case ELower = 0,
    FLower,
    GLower,
    ALower,
    BLower,
    CLower,
    DLower,
    ESpace,
    FLine,
    GSpace,
    ALine,
    BSpace,
    CLine,
    DSpace,
    ELine,
    FSpace,
    GLine,
    ASpace,
    BUpper,
    CUpper,
    DUpper,
    EUpper,
    FUpper,
    GUpper,
    AUpper
    
    var letterName: String {
        
        switch self {
            
            case .ALine, .ALower, .AUpper, .ASpace:
            return "a"
            
            case .BLower, .BUpper, .BSpace:
            return "b"
            
            case .CLower, .CUpper, .CLine:
            return "c"
            
            case .DLower, .DUpper, .DSpace:
            return "d"
            
            case .ELower, .ESpace, .EUpper, .ELine:
            return "e"
            
            case .FLine, .FLower, .FSpace, .FUpper:
            return "f"
            
            case .GLower, .GSpace, .GUpper, .GLine:
            return "g"
            
        }
    }
    
};


    


//TODO: add tenor and alto note type enums

//the max number of lives given to the user
let MaxNumberOfLives: Int = 3

//returns a random int within a range
func random(min: Int, max: Int) -> Int {
    
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    
}





