//
//  Pokemon.swift
//  Pokemon
//
//  Created by Brian @ TAE on 17/09/2018.
//  Copyright © 2018 Brian @ TAE. All rights reserved.
//

import Foundation

enum PokemonType {
    case normal
    case fire
    case water
    case grass
    case electric
    case psychic
    case dragon
    case ice
    case ghost
}

typealias PokemonAttackType = PokemonType

class Pokemon {
    
    let type: PokemonType
    var health = 100
    let attackDamage = 30.0
    
    init(_ type:PokemonType) {
        self.type = type
    }
    
    var attackType: PokemonAttackType {
        return type
    }
    
}

extension Pokemon {
    
    func attack(_ defender: Pokemon) {
        
        var damageMultiplier = 1.0
        
        // Check when an X type pokemon is attacked by a Y type attack
        switch (defender.type, attackType) {
            
        case (.fire, .water),
             (.water, .grass),
             (.water, .electric),
             (.grass, .fire),
             (.dragon, .dragon),
             (.dragon, .fire),
             (.ice, .fire),
             (.grass, .ice),
             (.dragon, .ice),
             (.ghost, .ghost):
            damageMultiplier = 2.0
            
        case (.fire, .fire),
             (.fire, .grass),
             (.water, .fire),
             (.water, .water),
             (.grass, .water),
             (.grass, .electric),
             (.grass, .grass),
             (.electric, .electric),
             (.psychic, .psychic),
             (.normal, .normal),
             (.water, .ice),
             (.ice, .ice):
            damageMultiplier = 0.5
            
        case (.ghost, .normal),
             (.normal, .ghost),
             (.psychic, .ghost):
            damageMultiplier = 0
        default: break
        }
        
        defender.health = defender.health - Int(attackDamage * damageMultiplier)
        
    }
    
}
