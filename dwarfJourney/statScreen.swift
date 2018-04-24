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
    
    // label declarations
    @IBOutlet weak var strengthLbl: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    @IBOutlet weak var luckLbl: UILabel!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    //Using GK to get a random number for a 6 sided dice
    let dice = GKRandomDistribution.d6();
    
    
    let strengthMod = 5
    let healthMod = 10
    var strength = 0, lck = 0, hlt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.isEnabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
       
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
        strengthLbl.text = String(sum)
        
    }
    
    func calcHealth(){
        var first = 0, second = 0, sum = 0
        
        first = dice.nextInt()  //getting the random dice rolls
        second = dice.nextInt()
        sum = first + second + healthMod  //adding them together with the modifier
        hlt = sum
        healthLbl.text = String(sum)
    }
    
    func calcLuck(){
        var first = 0, second = 0, sum = 0
        
        first = dice.nextInt()  //getting the random dice rolls
        second = dice.nextInt()
        sum = first + second   //adding them together
        lck = sum
        luckLbl.text = String(sum)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is combatScreen{
            let vc = segue.destination as? combatScreen
            vc?.strString = String(strength)
            vc?.hltString = String(hlt)
            vc?.lckString = String(lck)
        }
    }
    
}

