//
//  storyScreen.swift
//  dwarfJourney
//
//  Created by Ehley, David A (ehley001) on 4/3/18.
//  Copyright © 2018 Ehley, David A (ehley001). All rights reserved.
//

import Foundation

import UIKit

class storyScreen: UIViewController {
    lazy var index = nodeRoot
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         index = nodeRoot
        //let beginning = nodeRoot
        storyText.text = index.value
       
    }
    
    @IBOutlet weak var storyText: UITextView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choiceOne(_ sender: UIButton) {
        index = index.leftChild!
        storyText.text = index.value.story
    }
    @IBAction func choiceTwo(_ sender: UIButton) {
        index = index.rightChild!
        storyText.text = index.value.story
    }
    class Node<Story>{
        var value: Story
        var leftChild: Node?
        var rightChild: Node?
        
        init(_ left: Node?,_ value: Story,_ right: Node?){
            self.value = value
            self.leftChild = left
            self.rightChild = right
        }
    }
    class Story{
        var story: String
        var firstChoiceBtn: String
        var secondChoiceBtn: String
        var fight: Bool
        
        init(_ story: String, _ firstChoice: String, _ secondChoice: String,_ fight: Bool)
        {
            self.story = story
            self.firstChoiceBtn = firstChoice
            self.secondChoiceBtn = secondChoice
            self.fight = fight
        }
    }
    
    
    // Death/Victory Leaf Nodes
    let nodebb = Node(nil, Story("After taking the right tunnel you find yourself in a room filled with dancing and music. You get lost in the moment and forget about adventuring.","You have lost!","Start a new Game?", false), nil)
    let nodeaaaaaaaaabb = Node(nil,Story("As you proceed with caution you miss that you stepped on a pressure plate. A rock falls from above you and kills you.","You have Died", "Start a new Game?", false),nil)
    let nodeaaaaaaaaaba = Node(nil,"You sprint to the shiny object just to find that you have stepped on a pressure plate dropping a rock from above you, but because you were sprinting you were able to make it out the the rocks path and making it to the treasure.",nil)
    let nodeaaaaab = Node(nil,"As you continue on through the forest you find it getting darker and darker finding it hard to see in the forest. You feel the presence of something behind you, but without being able to see it you don’t know where to defend yourself. A black panther leaps at you and kills you.",nil)
    let nodeaaab = Node(nil, "You test the depth of the water and find that it only goes waist high. As you go through the water you immediately feel that something is in the water with you. Before you get a chance to react piranhas come from all around you and devour you.", nil)
    let nodeaaaaaaaaaa = Node(nil,"As you keep climbing you immediately regret your decision because you lose your grip and fall to your death.",nil)
    
    // Redirection Leaf Nodes
    let nodebaaaaa = Node(nil,"After slaying the goblin the dwarf thanks you and shows you a secret path out of the the cave. You exit the cave and find yourself in front of a forest. What do you do?",nil)
    let nodeab = Node(nil,"As you try to climb the wall you find that it is hard to get a good grip. Your hands slip and you fall into the water and get taken away by the current to a shallow point. After getting up you are presented with a rope bridge. What do you do?",nil)
    let nodeabbbaa = Node(nil,"Fortunately there was enough time to grab you axe and fight the goblin. After killing the goblin you continue on to Mt. Chaos. Treasure awaits on the top of Mt. Chaos. What do you do?",nil)
    let nodeaaaaaaaaba = Node(nil,"You take the left path and find yourself up higher on the mountain and in the open air. Ahead is another cave entrance. What do you do?",nil)
    let nodeaaaaaaaabbaa = Node(nil,"After defeating the goblin you find that you have reached a dead end.",nil)
    let nodeabbbbb = Node(nil,"After resting a little you continue onward. You see what looks like a goblin camp where a goblin is sleeping. You quietly go around the camp and make it to the base of Mt. Chaos. Treasure awaits on the top of Mt. Chaos. What do you do?",nil)
    
    // Intermediate Redirection Nodes
    lazy var nodeaaaaaaaabb = Node(nodeaaaaaaaabba,"As you take the right path you find that it twists and turn taking you deep into the mountain. The path opens up into a wide cavern. You can see something shining on the other side. What do you do?",nil)
    lazy var nodebaaa = Node(nodebaaaaa,"You open your mouth to speak, but the dwarf hushes you. The dwarf points to the wall and you can see in the dark that there is an goblin sleeping against it. What do you do?",nil)
    lazy var nodebaa = Node(nodebaaa,"Going through the left tunnel the smell gets stronger. You then find yourself in a room with another dwarf baking blueberry pie what do you do?",nil)
    
    // Intermediate Continuing Nodes
    lazy var nodeaaaaaaaaab = Node(nodeaaaaaaaaaba,"Upon entering the opening you see something shining in the distance. What do you do?",nodeaaaaaaaaabb )
    lazy var nodeaaaaaaaaa = Node(nodeaaaaaaaaaa,"As you climb you find that the higher you go the easier it is to climb. Coming to a ledge you find an entrance in the mountain. What do you do?", nodeaaaaaaaaab)
    lazy var nodeaaaaaaaabba = Node(nodeaaaaaaaabbaa,"Going to the light you find that it is actually the glint of a goblins armor. Before you could turnaround it sees you and attacks you.",nil)
    lazy var nodeaaaaaaaab = Node(nodeaaaaaaaaba,"You search the base of the mountain for an entrance. Eventually finding one you enter the mountain. Upon entering the mountain you find yourself at a fork in your path. Which path do you take?",nodeaaaaaaaabb)
    lazy var nodeaaaaaaaa = Node(nodeaaaaaaaaa,"After resting you continue on through the forest till you find yourself outside of the forest and in front of Mt. Chaos. Treasure awaits on the top of Mt. Chaos. What do you do?",nodeaaaaaaaab)
    lazy var nodeaaaaaaa = Node(nodeaaaaaaaa,"With great skill and strength you kill the goblin. What do you do next?",nodeaaaaab)
    lazy var nodeaaaaaa = Node(nodeaaaaaaa,"As you approach the campfire you find that it is an goblin camp. The goblin catches your scent. Get ready for a fight.",nil)
    lazy var nodeaaaaa = Node(nodeaaaaaa,"As you enter the forest you can hear and smell a campfire in the distance. What do you do?",nodeaaaaab)
    lazy var nodeaaaaba = Node(nodeabbbaa,"Not wanting to stop you continue on and find yourself at the base of Mt. Chaos. Tired of exhaustion you pass out. After a little while you come to and find a goblin closing in on you. Its fighting time.",nil)
    lazy var nodeaaaab = Node(nodeaaaaba,"As you travel around the forest you find it very tiring. What do you do?",nodeabbbbb)
    lazy var nodeaaaa = Node(nodeaaaaa,"The bridge creaks under your weight and at times feels as if it is going to break, but you push on and cross the bridge. When on the other side you find a forest lies before you. What do you do?",nodeaaaab)
    lazy var nodeaaa = Node(nodeaaaa,"You jump into the water and the current quickly pulls you under. Struggling to get up and out of the water you hit your leg on a sharp rock. Finally getting to a shallow point you are able to get out of the water and continue on your journey. While walking you come across a rope bridge. What do you do?",nodeaaab)
    lazy var nodeaa = Node(nodeaaa,"After traveling through the left tunnel you find yourself at the mouth of a waterfall. What do you do?",nodeab)
    lazy var nodeb = Node(nodebaa, "After traveling through the right tunnel you find yourself at yet another intersection. You hear some music coming from the right tunnel and can smell food from the left tunnel. Which tunnel do you take?", nodebb)
    
    // Root Node
    lazy var nodeRoot = Node(nodeaa,"TerraMine the homeworld of the dwarfs. Being an eager young dwarf you decide to go on an adventure. Upon leaving your home you are confronted with your first decision. Ahead of you is two tunnels. Which one do you take?",nodeb)
    
}
