//
//  stats.swift
//  dwarfJourney
//
//  Created by Ehley, David A (ehley001) on 4/24/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//

import UIKit

class stats: NSObject{
    
    var strength: Int
    var health: Int
    var luck: Int
    
    init(str: Int, hlt: Int, lck: Int) {
        self.strength = str
        self.health = hlt
        self.luck = lck
        
        super.init()
    }
    
    
}
