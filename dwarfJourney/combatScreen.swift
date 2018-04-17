//
//  combatScreen.swift
//  dwarfJourney
//
//  Created by Ehley, David A (ehley001) on 4/11/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//
import Foundation

import UIKit

class combatScreen: UIViewController {
    
    @IBOutlet weak var strLbl: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    @IBOutlet weak var luckLbl: UILabel!
    
    @IBOutlet weak var userLbl: UITextView!
    @IBOutlet weak var opponentLbl: UITextView!
    
    
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
        
    
    }
    
    @IBAction func btnLuck(_ sender: UIButton) {
        
        
    }
    
    
}

