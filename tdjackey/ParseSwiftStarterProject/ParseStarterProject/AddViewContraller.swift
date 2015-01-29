//
//  AddViewContraller.swift
//  ParseStarterProject
//
//  Created by 龚杰 on 1/28/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class AddViewContraller: UIView {

 //   @IBOutlet weak var outletScore: UITextField!
    
    @IBOutlet weak var outletSocre: UITextField!
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
                // Drawing code
    }
    @IBAction func doSave(sender: AnyObject) {
        
        var gameScore = PFObject(className:"GameScore")
        gameScore["score"] = outletSocre.text
        gameScore["playerName"] = "Sean Plott"
        gameScore["cheatMode"] = false
        gameScore.saveInBackground()

    }
    
   // @IBAction func doSave(sender: AnyObject) {
        /*
        var gameScore = PFObject(className:"GameScore")
        gameScore["score"] = outletScore
        gameScore["playerName"] = "Sean Plott"
        gameScore["cheatMode"] = false
        gameScore.saveInBackground()
        */

    //}

}
