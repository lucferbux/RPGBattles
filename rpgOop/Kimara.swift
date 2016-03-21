//
//  Kimara.swift
//  rpgOop
//
//  Created by lucas fernández on 21/03/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

class Kimara: Enemy {
 
    let IMUME_MAX = 7
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Ogre Green"
    }
    
    //You can call a super function inside an override function
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMUME_MAX {
            return super.attemptAttack(attackPwr)
        }else{
            return false
        }
    }
    
}