//
//  ViewController.swift
//  rpgOop
//
//  Created by lucas fernández on 20/03/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //var declarations
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    var playerAudio: AVAudioPlayer = AVAudioPlayer()
    
    //outlets
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var playerHpLabel: UILabel!
    
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    @IBOutlet weak var attackButton: UIButton!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    //Actions
    @IBAction func onChestPressed(sender: AnyObject) {
        
        chestButton.hidden = true
        printLabel.text = chestMessage
        //Now give some time to do the animation smoother
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func onAttackPressed(sender: AnyObject) {
        let attack = player.attackPower
        let color = UIColor(red: 242.0/255, green: 214.0/255, blue: 29.0/255, alpha: 1.0)
        printLabel.textColor = color
        
        if enemy.attemptAttack(attack){
            printLabel.text = "\(player.name) attacked \(enemy.type) for \(attack)"
            enemyHpLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "\(player.name) attack was unsuccesful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
            attackButton.enabled = false
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }else{
            
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "enemyAttacks", userInfo: nil, repeats: false)
        }
        
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlayer()
        generateRandomEnemy()
        //chestButton.hidden = true
        
        let audioPath = NSBundle.mainBundle().pathForResource("mainSound", ofType: "mp3")!
        do{
            try
                playerAudio = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath)!)
                playerAudio.numberOfLoops = -1
            
        } catch let error as NSError {
            
            error.description
        }
        
        playerAudio.play()
        
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            enemyImage.image = UIImage(named: "enem1")
        }else{
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
            enemyImage.image = UIImage(named: "enem2")
        }
        
//        switch rand {
//        case 0: enemy = Kimara(startingHp: 50, attackPwr: 12)
//        case 1: enemy = DevilWizard(startingHp: 60, attackPwr: 15)
//        default: enemy = Kimara(startingHp: 110, attackPwr: 30)
//        }
        
        enemyHpLabel.text = "\(enemy.hp) HP"
        enemyImage.hidden = false
        attackButton.enabled = true
        printLabel.text = "An \(enemy.type) appeared!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func enemyAttacks() {
        let attack = enemy.attackPower
        let color = UIColor(red: 176/255, green: 9/255, blue: 53/255, alpha: 1.0)
        printLabel.textColor = color
        
        if player.attemptAttack(attack){
            printLabel.text = "\(enemy.type) attacked \(player.name) for \(attack)"
            playerHpLabel.text = "\(player.hp) HP"
        } else {
            printLabel.text = "\(enemy.type) attack was unsuccesful!"
        }
        
        if !player.isAlive {
            playerImage.hidden = true
            playerHpLabel.text = ""
            printLabel.text = "You loose, reestarting..."
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generatePlayer", userInfo: nil, repeats: false)
        }else{
            attackButton.enabled = true
        }
    }
    
    func generatePlayer() {
        player = Player(name: "lucferbux", hp: 110, attackPwr: 30)
        playerHpLabel.text = "\(player.hp) HP"
        playerImage.hidden = false
        printLabel.text = "Press the attack button to attack"
        attackButton.enabled = true
    }

}

