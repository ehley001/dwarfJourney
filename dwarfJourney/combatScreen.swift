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
    
    
    var playerStatsCombat: stats!
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
        
       strLbl.text = String(playerStatsCombat.strength)
        healthLbl.text = String(playerStatsCombat.health)
        luckLbl.text = String(playerStatsCombat.luck)
        opponentLbl.text = String(baseHealth)
        luckBtnOut.setTitle("Luck", for: .normal)
        btnFightOut.setTitle("Fight", for: .normal)
        if(playerStatsCombat.luck == 0)
        {
            luckBtnOut.isEnabled = false
        }
        else
        {
            luckBtnOut.isEnabled = true
        }
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
    func dead(){
        btnFightOut.setTitle("You have died", for: .normal)
        btnFightOut.isEnabled = false
        luckBtnOut.setTitle("Start a new Game?", for: .normal)
        luckBtnOut.isEnabled = true
    }
    @IBAction func btnFight(_ sender: UIButton) {
        if(luckBtnOut.currentTitle == "")
        {
            self.performSegue(withIdentifier: "unwindCombatScreen", sender: Any?.self)
        }
        else
        {
            var userScore = 0, goblinScore = 0
            
            
            userScore = randomRoll() + playerStatsCombat.strength
            
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
                playerStatsCombat.health -= 2
                healthLbl.text = String(playerStatsCombat.health)
                
            default:
                //tie
                userLbl.text.append("You tied!\n")
            }
            
            if(baseHealth < 1){
                opponentLbl.text = "Goblin is dead"
                btnFightOut.setTitle("Go back to Story!", for: .normal)
                luckBtnOut.setTitle("", for: .normal)
                luckBtnOut.isEnabled = false
            }
            
            if(userHealth < 1){
                userLbl.text = "You died"
                dead()
            }
        }
        
        
     
     
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "combatToStats"?:
            if segue.destination is statScreen{
                
            }
        default:
            preconditionFailure("unexpected segue identitfier")
        }
        
    }
    @IBAction func unwindCombatScreen(segue: UIStoryboardSegue)
    {
        
    }
    @IBAction func btnLuck(_ sender: UIButton) {
        if(luckBtnOut.currentTitle == "Start a new Game?")
        {
            performSegue(withIdentifier: "combatToStats", sender: Any?.self)
        }
        else
        {
            var userScore = 0, goblinScore = 0
            
            
            userScore = randomRoll() + playerStatsCombat.strength
            
            goblinScore = randomRoll() + baseStrength
            
            // TODO look into using switch stament instead
            
            
            switch userScore {
            // user wins
            case _ where userScore > goblinScore:
                userLbl.text.append("You are lucky!\n")
                baseHealth -= 4
                opponentLbl.text = String(baseHealth)
                
            //goblin wins
            case _ where userScore < goblinScore:
                userLbl.text.append("You are unlucky!\n")
                playerStatsCombat.health -= 4
                healthLbl.text = String(playerStatsCombat.health)
                
            default:
                //tie
                userLbl.text.append("You tied!\n")
            }
            
            if(baseHealth < 1){
                opponentLbl.text = "Goblin is dead"
                btnFightOut.setTitle("Go back to Story!", for: .normal)
                luckBtnOut.setTitle("", for: .normal)
                luckBtnOut.isEnabled = false
            }
            
            if(userHealth < 1){
                userLbl.text = "You died"
                dead()
            }
            
            luckBtnOut.isEnabled = false //can only hit luck once in a fight
            
            
        }
        
        
        }
        
    func randomRoll() -> Int{
        var first = 0, second = 0, sum = 0
        
        first = dice.nextInt()  //getting the random dice rolls
        second = dice.nextInt()
        sum = first + second
        
        return sum
        
    }
    
}

