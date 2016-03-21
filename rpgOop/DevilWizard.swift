//
//  DevilWizard.swift
//  rpgOop
//
//  Created by lucas fernández on 21/03/16.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

import Foundation

class DevilWizard: Enemy{
    
    override var loot: [String]{
        return ["Magic Wand", "Dark Ammulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Ogre Blue"
    }
    
    
    
}