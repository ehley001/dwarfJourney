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
        storyText.text = index.value.story
        choiceOne.setTitle(index.value.firstChoiceBtn, for: .normal)
        choiceTwo.setTitle( index.value.secondChoiceBtn, for: .normal)
       
    }
    @IBOutlet weak var choiceTwo: UIButton!
    
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var storyText: UITextView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choiceOne(_ sender: UIButton) {
        if(index.value.fight)
        {
            performSegue(withIdentifier: "toCombatScreen", sender: Any?.self)
        }
        index = index.leftChild!
        storyText.text = index.value.story
        if(index.value.secondChoiceBtn == "")
        {
            choiceTwo.isEnabled = false
        }
        else
        {
            choiceTwo.isEnabled = true
        }
        if(index.value.secondChoiceBtn == "Start a new Game?")
        {
            choiceOne.isEnabled = false
        }
        else
        {
            choiceOne.isEnabled = true
        }
        choiceOne.setTitle(index.value.firstChoiceBtn, for: .normal)
        choiceTwo.setTitle( index.value.secondChoiceBtn, for: .normal)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//
//    }
    var playerStats: stats! {
        didSet {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "toCombatScreen"?:
            if segue.destination is combatScreen{
                let startPlayer = stats(playerStats.strength,playerStats.health,playerStats.luck)
                let vc = segue.destination as! combatScreen
                vc.playerStatsCombat = startPlayer
                
                
            }
        case "toStatsScreen"?:
            if segue.destination is statScreen{
                
            }
        default:
            preconditionFailure("unexpected segue identitfier")
        }
        
    }
    @IBAction func unwindCombatScreen(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func choiceTwo(_ sender: UIButton) {
        if(index.value.secondChoiceBtn == "Start a new Game?")
        {
            performSegue(withIdentifier: "toStatsScreen", sender: Any?.self)
        }
        else
        {
            index = index.rightChild!
            storyText.text = index.value.story
            if(index.value.secondChoiceBtn == "")
            {
                choiceTwo.isEnabled = false
            }
            else
            {
                choiceTwo.isEnabled = true
            }
            if(index.value.secondChoiceBtn == "Start a new Game?")
            {
                choiceOne.isEnabled = false
            }
            else
            {
                choiceOne.isEnabled = true
            }
            choiceOne.setTitle(index.value.firstChoiceBtn, for: .normal)
            choiceTwo.setTitle( index.value.secondChoiceBtn, for: .normal)
        }
        
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
    let nodeaaaaaaaaaba = Node(nil,Story("You sprint to the shiny object just to find that you have stepped on a pressure plate dropping a rock from above you, but because you were sprinting you were able to make it out the the rocks path and making it to the treasure.","You have Won!", "Start a new Game?",false),nil)
    let nodeaaaaab = Node(nil,Story("As you continue on through the forest you find it getting darker and darker finding it hard to see in the forest. You feel the presence of something behind you, but without being able to see it you don’t know where to defend yourself. A black panther leaps at you and kills you.","You have Died","Start a new Game?", false),nil)
    let nodeaaab = Node(nil, Story("You test the depth of the water and find that it only goes waist high. As you go through the water you immediately feel that something is in the water with you. Before you get a chance to react piranhas come from all around you and devour you.","You have Died","Start a new Game?", false), nil)
    let nodeaaaaaaaaaa = Node(nil,Story("As you keep climbing you immediately regret your decision because you lose your grip and fall to your death.","You have Died","Start a new Game?", false),nil)
    
    // Redirection Leaf Nodes
    lazy var nodebaaaaa = Node(nodeaaaaa,Story("After slaying the goblin the dwarf thanks you and shows you a secret path out of the the cave. You exit the cave and find yourself in front of a forest. What do you do?","Enter the forest?","Go around the forest?",false),nodeaaaab)
    lazy var nodeab = Node(nodeaaaa,Story("As you try to climb the wall you find that it is hard to get a good grip. Your hands slip and you fall into the water and get taken away by the current to a shallow point. After getting up you are presented with a rope bridge. What do you do?","Attempt to cross?","Search for another way?",false),nodeaaab)
    lazy var nodeabbbaa = Node(nodeaaaaaaaaa,Story("Fortunately there was enough time to grab you axe and fight the goblin. After killing the goblin you continue on to Mt. Chaos. Treasure awaits on the top of Mt. Chaos. What do you do?","Climb Mt. Chaos?","Look for an entrance?",false),nodeaaaaaaaab)
    lazy var nodeaaaaaaaaba = Node(nodeaaaaaaaaab,Story("You take the left path and find yourself up higher on the mountain and in the open air. Ahead is another cave entrance. What do you do?","Enter the cave?","Climb the mountain?",false),nodeaaaaaaaaaa)
    lazy var nodeaaaaaaaabbaa = Node(nodeaaaaaaaaba,Story("After defeating the goblin you find that you have reached a dead end.","Go back and take left path","",false),nil)
    lazy var nodeabbbbb = Node(nodeaaaaaaaaa,Story("After resting a little you continue onward. You see what looks like a goblin camp where a goblin is sleeping. You quietly go around the camp and make it to the base of Mt. Chaos. Treasure awaits on the top of Mt. Chaos. What do you do?","Climb Mt. Chaos?","Look for an entrance?",false),nodeaaaaaaaab)
    
    // Intermediate Redirection Nodes
    lazy var nodeaaaaaaaabb = Node(nodeaaaaaaaabba,Story("As you take the right path you find that it twists and turn taking you deep into the mountain. The path opens up into a wide cavern. You can see something shining on the other side. What do you do?","Follow the light?","Go back and take left path?",false),nodeaaaaaaaaba)
    lazy var nodebaaa = Node(nodebaaaaa,Story("You open your mouth to speak, but the dwarf hushes you. The dwarf points to the wall but it is too late the goblin wakes up and rushes toward you.","Fight!","",true),nil)
    lazy var nodebaa = Node(nodebaaa,Story("Going through the left tunnel the smell gets stronger. You then find yourself in a room with another dwarf baking blueberry pie what do you do?","Talk to the dwarf?","Go back and take right tunnel?",false),nodebb)
    
    // Intermediate Continuing Nodes
    lazy var nodeaaaaaaaaab = Node(nodeaaaaaaaaaba,Story("Upon entering the opening you see something shining in the distance. What do you do?","Sprint towards it?","Proceed with caution?",false),nodeaaaaaaaaabb )
    lazy var nodeaaaaaaaaa = Node(nodeaaaaaaaaaa,Story("As you climb you find that the higher you go the easier it is to climb. Coming to a ledge you find an entrance in the mountain. What do you do?","Keep Climbing?","Enter Mt. Chaos?",false), nodeaaaaaaaaab)
    lazy var nodeaaaaaaaabba = Node(nodeaaaaaaaabbaa,Story("Going to the light you find that it is actually the glint of a goblins armor. Before you could turnaround it sees you and attacks you.","Fight!","",true),nil)
    lazy var nodeaaaaaaaab = Node(nodeaaaaaaaaba,Story("You search the base of the mountain for an entrance. Eventually finding one you enter the mountain. Upon entering the mountain you find yourself at a fork in your path. Which path do you take?","Left?","Right?",false),nodeaaaaaaaabb)
    lazy var nodeaaaaaaaa = Node(nodeaaaaaaaaa,Story("After resting you continue on through the forest till you find yourself outside of the forest and in front of Mt. Chaos. Treasure awaits on the top of Mt. Chaos. What do you do?","Climb Mt. Chaos?","Look for an entrance?",false),nodeaaaaaaaab)
    lazy var nodeaaaaaaa = Node(nodeaaaaaaaa,Story("With great skill and strength you kill the goblin. What do you do next?","Rest?","Continue through forest?",false),nodeaaaaab)
    lazy var nodeaaaaaa = Node(nodeaaaaaaa,Story("As you approach the campfire you find that it is an goblin camp. The goblin catches your scent. Get ready for a fight.","Fight!","",true),nil)
    lazy var nodeaaaaa = Node(nodeaaaaaa,Story("As you enter the forest you can hear and smell a campfire in the distance. What do you do?","Investigate?","Continue through forest?",false),nodeaaaaab)
    lazy var nodeaaaaba = Node(nodeabbbaa,Story("Not wanting to stop you continue on and find yourself at the base of Mt. Chaos. Tired of exhaustion you pass out. After a little while you come to and find a goblin closing in on you. Its fighting time.","Fight!","",true),nil)
    lazy var nodeaaaab = Node(nodeaaaaba,Story("As you travel around the forest you find it very tiring. What do you do?","Continue on?","Rest?",false),nodeabbbbb)
    lazy var nodeaaaa = Node(nodeaaaaa,Story("The bridge creaks under your weight and at times feels as if it is going to break, but you push on and cross the bridge. When on the other side you find a forest lies before you. What do you do?","Enter the forest?","Go around forest?",false),nodeaaaab)
    lazy var nodeaaa = Node(nodeaaaa,Story("You jump into the water and the current quickly pulls you under. Finally getting to a shallow point you are able to get out of the water and continue on your journey. While walking you come across a rope bridge. What do you do?","Attempt to cross?","Find another way across?",false),nodeaaab)
    lazy var nodeaa = Node(nodeaaa,Story("After traveling through the left tunnel you find yourself at the mouth of a waterfall. What do you do?","Swim out?","Climb wall to land?",false),nodeab)
    lazy var nodeb = Node(nodebaa, Story("After traveling through the right tunnel you find yourself at yet another intersection. You hear some music coming from the right tunnel and can smell food from the left tunnel. Which tunnel do you take?","Left tunnel?","Right tunnel?",false), nodebb)
    
    // Root Node
    lazy var nodeRoot = Node(nodeaa,Story("TerraMine the homeworld of the dwarfs. Being an eager young dwarf you decide to go on an adventure. Upon leaving your home you are confronted with your first decision. Ahead of you is two tunnels. Which one do you take?","Left tunnel?","Right tunnel?",false),nodeb)
    
}
