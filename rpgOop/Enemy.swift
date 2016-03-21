//
//  Enemy.swift
//  rpgOop
//
//  Created by lucas fernández on 21/03/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String]{
        return ["Rusty Dagger", "Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    //return an optional string wether is alive or not
    func dropLoot() -> String? {
        
        if !isAlive{
            let rand = Int(arc4random_uniform(UInt32(loot.count))) //A random number betweet 1 to array, casting to fit
            return loot[rand]
        }
        
        return nil
    }
    
    
}