//
//  PracticeHudNode.swift
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/14/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

import Foundation
import SpriteKit

class PracticeHudNode: SKNode {
    
    //displays the number the user got correct
    var numberCorrectLabel: SKLabelNode!
    //displays the number the user got incorrect
    var numberIncorrectLabel: SKLabelNode!
    //stores the number the user has gotten correct
    var numberCorrect: Int!
    //stores the number the user has gotten incorrect
    var numberIncorrect: Int!
    
    //inits the practice node
    init(position: CGPoint, frame: CGRect) {
        
        //set the number correct and incorrect to 0
        numberCorrect = 0
        numberIncorrect = 0
        
        //setup the number correct label
        numberCorrectLabel = SKLabelNode(fontNamed: font)
        numberCorrectLabel.fontColor = UIColor.blackColor()
        numberCorrectLabel.text = String(format: "Correct: %d", numberCorrect)
        numberCorrectLabel.fontSize = 30.0
        numberCorrectLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        numberCorrectLabel.position = CGPoint(x: frame.size.width - 20, y: -20)
        
        //setup the number incorrrect label
        numberIncorrectLabel = SKLabelNode(fontNamed: font)
        numberIncorrectLabel.fontColor = UIColor.blackColor()
        numberIncorrectLabel.text = String(format: "Incorrect: %d", numberIncorrect)
        numberIncorrectLabel.fontSize = 30.0
        numberIncorrectLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        numberIncorrectLabel.position = CGPoint(x: numberCorrectLabel.position.x, y: numberCorrectLabel.position.y - (numberCorrectLabel.frame.size.height / 2) - 20)
        
        //call the super class init method to initilize the node
        super.init()
        //add the labels to the node
        self.addChild(numberCorrectLabel)
        self.addChild(numberIncorrectLabel)
        //set the nodes position
        self.position = position
        
        
    }
    
    //increases the value of the correct label by 1
    func increaseCorrectLabel() {
        
        numberCorrect = numberCorrect + 1
        numberCorrectLabel.text = String(format: "Correct: %d", numberCorrect)
    }
    
    //increase the value of the incorrect label by 1
    func increaseIncorrectLabel() {
        
        numberIncorrect = numberIncorrect + 1
        numberIncorrectLabel.text = String(format: "Incorrect: %d", numberIncorrect)
    }
    
    //not used, but required to be here
    required init?(coder aDecoder: NSCoder) {
        
        numberCorrect = 0
        numberIncorrect = 0
        
        
        numberCorrectLabel = SKLabelNode(fontNamed: font)
        numberCorrectLabel.fontColor = UIColor.blackColor()
        numberCorrectLabel.text = String(format: "Correct: %d", numberCorrect)
        numberCorrectLabel.fontSize = 30.0
        numberCorrectLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        numberCorrectLabel.position = CGPoint(x: 20, y: -20)
        
        numberIncorrectLabel = SKLabelNode(fontNamed: font)
        numberIncorrectLabel.fontColor = UIColor.blackColor()
        numberIncorrectLabel.text = String(format: "Incorrect: %d", numberIncorrect)
        numberIncorrectLabel.fontSize = 30.0
        numberIncorrectLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        numberIncorrectLabel.position = CGPoint(x: numberCorrectLabel.position.x, y: numberCorrectLabel.position.y - (numberCorrectLabel.frame.size.height / 2) - 20)
        super.init()
        self.addChild(numberCorrectLabel)
        self.addChild(numberIncorrectLabel)
        self.position = position
    }
}
