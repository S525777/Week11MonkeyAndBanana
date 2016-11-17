//
//  ViewController.swift
//  Vurugonda_The Monkey and Banana Game
//
//  Created by Student on 11/15/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var randomNo:Int = 1
    @IBOutlet var bananaIV1: UIImageView!
    @IBOutlet var bananaIV2: UIImageView!
    @IBOutlet var bananaIV3: UIImageView!
    @IBOutlet var bananaIV4: UIImageView!
    
    @IBOutlet var questionLBL: UILabel!
    @IBOutlet var monkeyIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    @IBAction func NewProblemBTN(sender: AnyObject) {
        
        randomNo = Int(arc4random_uniform(4) + 1)
        if randomNo == 1{
        questionLBL.text = "I want \(randomNo) banana"
        }
        else{
            questionLBL.text = "I want  \(randomNo) bananas"
           
        }
    }

    @IBAction func CheckResultActionBTN(sender: AnyObject) {
        let monkeyPosX = monkeyIV.center.x
        let monkeyposY = monkeyIV.center.y
        var bananaCount:Int = 0
        
        if sqrt(pow(monkeyPosX-bananaIV1.center.x,2) + pow(monkeyposY-bananaIV1.center.y,2)) < 80 {
            bananaCount += 1
        }
        if sqrt(pow(monkeyPosX-bananaIV2.center.x, 2) + pow(monkeyposY - bananaIV2.center.y, 2)) < 80 {
            bananaCount += 1
        }
        if sqrt(pow(monkeyPosX-bananaIV3.center.x, 2) + pow(monkeyposY - bananaIV3.center.y, 2)) < 80 {
            bananaCount += 1
        }
        if sqrt(pow(monkeyPosX-bananaIV4.center.x, 2) + pow(monkeyposY - bananaIV4.center.y, 2)) < 80 {
            bananaCount += 1
        }
        
        if bananaCount == randomNo
        {
            questionLBL.text = "Thanks :)"
        }
        else{
            questionLBL.text = "Try Again...I want \(randomNo) banana"
        }
    }
    
    
}

