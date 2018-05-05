//
//  statScreen.swift
//  dwarfJourney
//
//  Created by Ehley, David A (ehley001) on 4/10/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//
import Foundation

import UIKit
import GameplayKit

class statScreen: UIViewController {
    let appDelegate = AppDelegate.shared()
    let appDelegateNeutral = AppDelegate.shared()
    // label declarations
    @IBOutlet weak var strengthLbl: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    @IBOutlet weak var luckLbl: UILabel!
    @IBOutlet weak var instructionLbl: UITextView!
    @IBOutlet var rollBtn: UIButton!
    
    @IBOutlet weak var continueBtn: UIButton!
    var defaults = UserDefaults.standard
    //Using GK to get a random number for a 6 sided dice
    let dice = GKRandomDistribution.d6();
    
    let strengthMod = 5
    let healthMod = 10
    var strength = 0, lck = 0, hlt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.isEnabled = false
        instructionLbl.text = "Welcome\nYour journey begins with a roll of the dice.\nWhen luck is used in combat, if you win you do double damage, if you lose, you lose double health"
        
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if(appDelegateNeutral.restart){
            
        }
        else if let decoded = defaults.object(forKey: "stat") as? Data{
            let decodedStory = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! stats
            appDelegate.playerStats.strength = decodedStory.strength
            strength = decodedStory.strength
            appDelegate.playerStats.health = decodedStory.health
            lck = decodedStory.luck
            appDelegate.playerStats.luck = decodedStory.luck
            hlt = decodedStory.health
            strengthLbl.text = String(strength)
            healthLbl.text = String(hlt)
            luckLbl.text = String(lck)
            continueBtn.isEnabled = true
            rollBtn.isEnabled = false
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rollBtn(_ sender: UIButton) {
       
        calcStrength()
        calcHealth()
        calcLuck()
        sender.isEnabled = false      // disabling roll so you can only roll once
        continueBtn.isEnabled = true  // The user can now move on to the story
        
        
    }
    
    func calcStrength(){
        var first = 0, second = 0, sum = 0
        
        first = dice.nextInt()  //getting the random dice rolls
        second = dice.nextInt()
        sum = first + second + strengthMod  //adding them together with the modifier
        strength = sum
        appDelegate.playerStats.strength = sum
        strengthLbl.text = String(sum)
        
    }
    
    func calcHealth(){
        var first = 0, second = 0, sum = 0
        
        first = dice.nextInt()  //getting the random dice rolls
        second = dice.nextInt()
        sum = first + second + healthMod  //adding them together with the modifier
        hlt = sum
        appDelegate.playerStats.health = sum
        healthLbl.text = String(sum)
    }
    
    func calcLuck(){
        var first = 0, second = 0, sum = 0
        
        first = dice.nextInt()  //getting the random dice rolls
        second = dice.nextInt()
        sum = first + second   //adding them together
        lck = sum
        appDelegate.playerStats.luck = sum
        luckLbl.text = String(sum)
    }
    
    // segue code
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "toStoryScreen"?:
            if segue.destination is storyScreen{
                let statsPlayer = stats(strength,hlt,lck)
                let vc = segue.destination as! storyScreen
                vc.playerStats = statsPlayer
                
            }
        default:
            preconditionFailure("unexpected segue identifier")
        }
        
        
    }

    //practicing encoding as done in class
//    override func encode(with aCoder: NSCoder) {
//        aCoder.encode(strength, forKey:"strength")
//        aCoder.encode(hlt, forKey:"health")
//        aCoder.encode(lck, forKey:"luck")
//    }
    
}

