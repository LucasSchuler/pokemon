//
//  Status.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 01/03/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class Status: NSObject {
    var health : Int = 0
    var attack : Int = 0
    var defense : Int = 0
    var spAttack : Int = 0
    var spDefense : Int = 0
    var speed : Int = 0
    
    init(health:Int, attack:Int, defense:Int, spAttack:Int, spDefense:Int, speed:Int) {
        self.health=health
        self.attack=attack
        self.defense=defense
        self.spAttack=spAttack
        self.spDefense=spDefense
        self.speed=speed
    }
}
