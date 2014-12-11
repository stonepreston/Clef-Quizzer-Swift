//
//  NotesViewController.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/10/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import UIKit

class NotesViewController: UIViewController {
    
    //checkbox outlets
    @IBOutlet weak var linesCheckbox: UIButton!
    @IBOutlet weak var spacesCheckbox: UIButton!
    @IBOutlet weak var upperLedgerLinesCheckbox: UIButton!
    @IBOutlet weak var lowerLedgerLinesCheckbox: UIButton!
    
    //checkbox actions
    @IBAction func linesCheckboxPressed(sender: AnyObject) {
        
        handleButtonPress(linesCheckbox, noteRange: NoteRange.Lines)
        
    }
    @IBAction func spacesCheckboxPressed(sender: AnyObject) {
        
        let button: UIButton = sender as UIButton
        handleButtonPress(spacesCheckbox, noteRange: NoteRange.Spaces)
    }
    @IBAction func upperLedgerLinesCheckboxPressed(sender: AnyObject) {
        
        let button: UIButton = sender as UIButton
        handleButtonPress(upperLedgerLinesCheckbox, noteRange: NoteRange.UpperLedgerLines)
        
    }
    @IBAction func lowerLedgerLinesCheckboxPressed(sender: AnyObject) {
        
        let button: UIButton = sender as UIButton
        handleButtonPress(lowerLedgerLinesCheckbox, noteRange: NoteRange.LowerLedgerLines)
        
    }
    
    
    //button actions
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        
        //check to see if the noteRanges array is empty
        if (GameState.sharedInstance.noteRanges.count == 0) {
            
            //its empty, dont let the user advance and show an alert
            let alert: UIAlertView = UIAlertView(title: "Oops", message: "You must select at least one category of notes", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        } else {
            
            performSegueWithIdentifier("showMode", sender: self)
        }
    }
    
    @IBAction func linesButtonPressed(sender: AnyObject) {
        
        let button: UIButton = sender as UIButton
        handleButtonPress(linesCheckbox, noteRange: NoteRange.Lines)
    }
    
    @IBAction func spacesButtonPressed(sender: AnyObject) {
        
        let button: UIButton = sender as UIButton
        handleButtonPress(spacesCheckbox, noteRange: NoteRange.Spaces)
    }
    
    
    @IBAction func upperLedgerLinesButtonPressed(sender: AnyObject) {
        
        let button: UIButton = sender as UIButton
        handleButtonPress(upperLedgerLinesCheckbox, noteRange: NoteRange.UpperLedgerLines)
    }
    
    @IBAction func lowerLedgerLinesButtonPressed(sender: AnyObject) {
        
        let button: UIButton = sender as UIButton
        handleButtonPress(lowerLedgerLinesCheckbox, noteRange: NoteRange.LowerLedgerLines)
    }
    
    //handles the button presses
    func handleButtonPress(button: UIButton, noteRange: NoteRange) {
        
        //see if the button is selected
        if (button.selected) {
            
            //uncheck it
            button.selected = false
            
            //loop over the array
            for (index, aNoteRange) in enumerate(GameState.sharedInstance.noteRanges!) {
                
                //if  its the note range thats being deselected, remove it from the array
                if (aNoteRange == noteRange) {
                    
                    GameState.sharedInstance.noteRanges!.removeAtIndex(index)
                }
            }
            
        } else {
            
            //mark the checkbox as selected
            button.selected = true
            
            //add the noteRange to the game states note range array
            GameState.sharedInstance.noteRanges.append(noteRange)
        }
        
        
    }
    
    //unselect all the checkboxes
    func resetCheckboxes() {
        
        linesCheckbox.selected = false
        spacesCheckbox.selected = false
        upperLedgerLinesCheckbox.selected = false
        lowerLedgerLinesCheckbox.selected = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //reset the checkboxes
        resetCheckboxes()
        
        //loop over the noteRanges array
        for noteRange in GameState.sharedInstance.noteRanges {
            
            switch noteRange {
            
            //lines needs to be checked
            case NoteRange.Lines:
                linesCheckbox.selected = true
                
            //spaces needs to be checked
            case NoteRange.Spaces:
                spacesCheckbox.selected = true
                
            //upper ledger lines needs to be checked
            case NoteRange.UpperLedgerLines:
                upperLedgerLinesCheckbox.selected = true
            
            //lower ledger lines needs to be checked
            case NoteRange.LowerLedgerLines:
                lowerLedgerLinesCheckbox.selected = true
                
            }
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    
    
    
}
