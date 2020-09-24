//
//  PokemonTests.swift
//  PokemonTests
//
//  Created by The App Experts on 23/09/2020.
//  Copyright © 2020 Brian @ TAE. All rights reserved.
//

import XCTest
@testable import Pokemon

class PokemonTests: XCTestCase {
    var pokemonUnderTest: Pokemon!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        pokemonUnderTest = nil
        super.tearDown()
    }

    func testPokemonDM_2() {
        // given
        let pt = PokemonType.self
        let cases = [
        // damage multiplier = 2, health after attack = (100 - (30 *2))
        (pt.fire, pt.water, 40),
        (pt.water, pt.grass, 40),
        (pt.water, pt.electric, 40),
        (pt.grass, pt.fire, 40),
        (pt.dragon, pt.dragon, 40),
        (pt.dragon, pt.fire, 40),
        
        // damage multiplier = 1, health after attack = (100 - (30 *1))
        (pt.normal, pt.fire, 70),
        (pt.normal, pt.water, 70),
        (pt.normal, pt.grass, 70),
        (pt.normal, pt.electric, 70),
        (pt.normal, pt.psychic, 70),
        (pt.normal, pt.dragon, 70),
        (pt.fire, pt.electric, 70),
        (pt.fire, pt.normal, 70),
        (pt.fire, pt.electric, 70),
        (pt.fire, pt.psychic, 70),
        (pt.fire, pt.dragon, 70),
        (pt.water, pt.normal, 70),
        (pt.water, pt.psychic, 70),
        (pt.water, pt.dragon, 70),
        (pt.grass, pt.normal, 70),
        (pt.grass, pt.psychic, 70),
        (pt.grass, pt.dragon, 70),
        (pt.electric, pt.normal, 70),
        (pt.electric, pt.fire, 70),
        (pt.electric, pt.water, 70),
        (pt.electric, pt.grass, 70),
        (pt.electric, pt.psychic, 70),
        (pt.electric, pt.dragon, 70),
        (pt.psychic, pt.normal, 70),
        (pt.psychic, pt.fire, 70),
        (pt.psychic, pt.water, 70),
        (pt.psychic, pt.grass, 70),
        (pt.psychic, pt.electric, 70),
        (pt.psychic, pt.dragon, 70),
        (pt.dragon, pt.normal, 70),
        (pt.dragon, pt.psychic, 70),


        // damage multiplier = 0.5, health after attack = (100 - (30 *0.5))
        (pt.fire, pt.fire, 85),
        (pt.fire, pt.grass, 85),
        (pt.water, pt.fire, 85),
        (pt.water, pt.water, 85),
        (pt.grass, pt.water, 85),
        (pt.grass, pt.electric, 85),
        (pt.grass, pt.grass, 85),
        (pt.electric, pt.electric, 85),
        (pt.psychic, pt.psychic, 85),
        (pt.normal, pt.normal, 85)]
        
        for (defend, attack, healthAfterAttack) in cases{
            let defender = Pokemon(defend)
            let attacker = Pokemon(attack)
            //when
            attacker.attack(defender)
//            let damageMultiplier = (defender.health + defender.health)/Int(defender.attackDamage)
            print("DM > \(defend) > \(attack) >> \(attacker.health) >> \(defender.health)")
            //then
            XCTAssertEqual(defender.health, healthAfterAttack, "Incorect damage  multiplier")

        }
    }
    
    func testIceType() {
        // given
        // pokemon ice type
        let pt = PokemonType.self
        let cases = [
            (pt.ice, pt.fire, 40),
            (pt.grass, pt.ice, 40),
            (pt.dragon, pt.ice, 40),
            
            (pt.ice, pt.normal, 70),
            (pt.ice, pt.water, 70),
            (pt.ice, pt.grass, 70),
            (pt.ice, pt.electric, 70),
            (pt.ice, pt.psychic, 70),
            (pt.ice, pt.dragon, 70),
            (pt.ice, pt.ghost, 70),
            (pt.normal, pt.ice, 70),
            (pt.fire, pt.ice, 70),
            (pt.electric, pt.ice, 70),
            (pt.psychic, pt.ice, 70),
            (pt.ghost, pt.ice, 70),
            
            (pt.water, pt.ice, 85),
            (pt.ice, pt.ice, 85)
        ]
        for (defend, attack, healthAfterAttack) in cases{
            let defender = Pokemon(defend)
            let attacker = Pokemon(attack)
            //when
            attacker.attack(defender)
            print("DM > \(defend) > \(attack) >> \(healthAfterAttack) >> \(defender.health)")
            //then
            XCTAssertEqual(defender.health, healthAfterAttack, "Incorect damage  multiplier")
        }
    }
    
    func testGhostType() {
        let pt = PokemonType.self
         let cases = [
             (pt.ghost, pt.normal, 100),
             (pt.normal, pt.ghost, 100),
             (pt.psychic, pt.ghost, 100),
             
             (pt.ghost, pt.fire, 70),
             (pt.ghost, pt.water, 70),
             (pt.ghost, pt.grass, 70),
             (pt.ghost, pt.electric, 70),
             (pt.ghost, pt.psychic, 70),
             (pt.ghost, pt.dragon, 70),
             (pt.ghost, pt.ice, 70),
             (pt.fire, pt.ghost, 70),
             (pt.water, pt.ghost, 70),
             (pt.grass, pt.ghost, 70),
             (pt.electric, pt.ghost, 70),
             (pt.dragon, pt.ghost, 70),
             (pt.ice, pt.ghost, 70),
             
             (pt.ghost, pt.ghost, 40)

         ]
         for (defend, attack, healthAfterAttack) in cases{
             let defender = Pokemon(defend)
             let attacker = Pokemon(attack)
             //when
             attacker.attack(defender)
             print("DM > \(defend) > \(attack) >> \(healthAfterAttack) >> \(defender.health)")
             //then
             XCTAssertEqual(defender.health, healthAfterAttack, "Incorect damage  multiplier")
         }
    }
}
