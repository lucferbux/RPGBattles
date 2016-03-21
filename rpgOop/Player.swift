//
//  Player.swift
//  rpgOop
//
//  Created by lucas fernández on 20/03/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

class Player: Character{
    private var _name: String = "Player"
    private var _inventory = [String]()
    let IMUME_MAX = 4
    
    var name: String{
        get {
            return _name
        }
    }
    
    var inventory: [String]{
        return _inventory
    }
    //convenience init are secondary supporting initializers for a class, the you can call the designated initializer
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMUME_MAX {
            return super.attemptAttack(attackPwr)
        }else{
            return false
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
    
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
        
    }
    
    
    
}