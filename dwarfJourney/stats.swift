//
//  stats.swift
//  dwarfJourney
//
//  Created by Ehley, David A (ehley001) on 4/24/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//

import UIKit

class stats: NSObject, NSCoding{
    
    var strength: Int
    var health: Int
    var luck: Int
    
    
    
    init(_ str: Int,_ hlt: Int,_ lck: Int) {
        self.strength = str
        self.health = hlt
        self.luck = lck
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder){
        print(strength)
        print(health)
        print(luck)
        aCoder.encode(strength, forKey: "strength")
        aCoder.encode(health, forKey:"health")
        aCoder.encode(luck, forKey: "luck")
    }
    required init(coder aDecoder: NSCoder){
        strength = aDecoder.decodeInteger(forKey: "strength")
        health = aDecoder.decodeInteger(forKey:"health")
        luck = aDecoder.decodeInteger(forKey:"luck")
        
        super.init()
    }
//    let itemArchiveURL: URL = {
//        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentDirectory = documentsDirectories.first!
//        return documentDirectory.appendingPathComponent("stats.archive")
//    }()
    func saveChanges() -> Bool{
        let default2 = UserDefaults.standard
        let appDelegate = AppDelegate.shared().playerStats
        let stat = stats(appDelegate.strength,appDelegate.health,appDelegate.luck)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: stat)
        default2.set(encodedData, forKey: "stat")
        default2.synchronize()
        return true
    }
    
    
        
    
    
}
