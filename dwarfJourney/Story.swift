//
//  Story.swift
//  dwarfJourney
//
//  Created by Stuedemann, Zechariah D (stued002) on 5/1/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//

import Foundation
import UIKit
class Story: NSObject, NSCoding{
    var story: String
    var firstChoiceBtn: String
    var secondChoiceBtn: String
    var fight: Bool = false
    
    init(_ story: String, _ firstChoice: String, _ secondChoice: String,_ fight: Bool)
    {
        self.story = story
        self.firstChoiceBtn = firstChoice
        self.secondChoiceBtn = secondChoice
        self.fight = fight
    }
    func encode(with aCoder: NSCoder){
        aCoder.encode(story, forKey: "story")
        aCoder.encode(firstChoiceBtn, forKey:"firstChoiceBtn")
        aCoder.encode(secondChoiceBtn, forKey: "secondChoiceBtn")
        aCoder.encode(fight, forKey: "fight")
        
    }
    required convenience init(coder aDecoder: NSCoder){
        let story = aDecoder.decodeObject(forKey: "story") as! String
        let firstChoiceBtn = aDecoder.decodeObject(forKey:"firstChoiceBtn")as! String
        let secondChoiceBtn = aDecoder.decodeObject(forKey:"secondChoiceBtn")as! String
        
        let fight = aDecoder.decodeBool(forKey:"fight")
        self.init(story,firstChoiceBtn,secondChoiceBtn,fight)
    }
    
    
    
}
