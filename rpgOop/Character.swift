//
//  Character.swift
//  rpgOop
//
//  Created by lucas fernández on 20/03/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPower: Int = 10
    
    var attackPower: Int {
        get {
            return Int(arc4random_uniform(UInt32(_attackPower)))
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    //Computed propierties that have a computation before gave a result
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int){
        self._hp = startingHp
        self._attackPower = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool{
        self._hp -= attackPwr
        return true
    }
    
    
}