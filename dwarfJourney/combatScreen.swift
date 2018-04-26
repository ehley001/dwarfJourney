//
//  combatScreen.swift
//  dwarfJourney
//
//  Created by Ehley, David A (ehley001) on 4/11/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//
import Foundation

import UIKit
import GameplayKit

class combatScreen: UIViewController {
    
    @IBOutlet weak var strLbl: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    @IBOutlet weak var luckLbl: UILabel!
    
    @IBOutlet weak var userLbl: UITextView!
    @IBOutlet weak var opponentLbl: UITextView!
    @IBOutlet weak var btnFightOut: UIButton!
    @IBOutlet weak var luckBtnOut: UIButton!
    
    var strString = ""
    var hltString = ""
    var lckString = ""
    
    var baseStrength = 10, baseHealth = 15
    var userStrength = 0, userHealth = 0  // will later get set to whatever the user rolled
     
    //Using GK to get a random number for a 6 sided dice
    let dice = GKRandomDistribution.d6();
    
//    var statistics: stats!{
//        didSet{
//            strLbl.text = String(statistics.strength)
//            healthLbl.text = String(statistics.health)
//            luckLbl.text = String(statistics.luck)
//
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       strLbl.text = strString
        healthLbl.text = hltString
        luckLbl.text = lckString
        opponentLbl.text = String(baseHealth)
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnFight(_ sender: UIButton) {
        var userScore = 0, goblinScore = 0
        
        
        userScore = randomRoll() + userStrength
        
        goblinScore = randomRoll() + baseStrength
        
        // TODO look into using switch stament instead
        

        switch userScore {
            // user wins
        case _ where userScore > goblinScore:
            userLbl.text.append("You won!\n")
            baseHealth -= 2
            opponentLbl.text = String(baseHealth)
            
            //goblin wins
        case _ where userScore < goblinScore:
            userLbl.text.append("You lost!\n")
            userHealth -= 2
            healthLbl.text = String(userHealth)
        
        default:
            //tie
            userLbl.text.append("You tied!\n")
        }
        
        if(baseHealth < 1){
            opponentLbl.text = "Goblin is dead"
            
        }
        
        if(userHealth < 1){
            userLbl.text = "You died"
        }
        
     
     
        

    }
    
    @IBAction func btnLuck(_ sender: UIButton) {
        //if luck is pressed, damage will either increase or decrease, depending on the roll
        let luckRand = Int(arc4random_uniform(2))
        
        
            if(luckRand == 0){  //user won, so double their strength
                userStrength = userStrength * 2
                strLbl.text = String(userStrength)
                userLbl.text = "You are lucky!\n"
                
            } else {
                baseStrength = baseStrength * 2 //goblin won so double their strength
                userLbl.text = "You are unlucky!\n"
            }
        
        luckBtnOut.isEnabled = false //can only hit luck once in a fight
        
        
    }
    
    func randomRoll() -> Int{
        var first = 0, second = 0, sum = 0
        
        first = dice.nextInt()  //getting the random dice rolls
        second = dice.nextInt()
        sum = first + second
        
        return sum
        
    }
    
    
}

