//
//  Node.swift
//  dwarfJourney
//
//  Created by Stuedemann, Zechariah D (stued002) on 5/1/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//

import Foundation
import UIKit
class Node: NSObject, NSCoding{
    var value: Story
    var leftChild: Node?
    var rightChild: Node?
  
    init(_ left: Node?,_ value: Story,_ right: Node?){
        self.value = value
        self.leftChild = left
        self.rightChild = right
        
    }
    func encode(with aCoder: NSCoder){
        print(value.story)
        aCoder.encode(value, forKey: "value")
        aCoder.encode(leftChild, forKey:"leftChild")
        aCoder.encode(rightChild, forKey: "rightChild")
        
    }
    required init(coder aDecoder: NSCoder){
        
        value = aDecoder.decodeObject(forKey: "value") as! Story
      
        
        leftChild = aDecoder.decodeObject(forKey:"leftChild")as? Node
   
        rightChild = aDecoder.decodeObject(forKey:"rightChild")as? Node
        
        
        
        super.init()
    }
    
    func saveChanges() -> Bool{
        let appDelegate = AppDelegate.shared().story
        let node = Node(appDelegate.leftChild,appDelegate.value,appDelegate.rightChild)
        
        let default2 = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: node)
        default2.set(encodedData, forKey: "story")
        default2.synchronize()
        return true
    }
}
