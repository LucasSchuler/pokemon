//
//  Skill.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 01/03/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class Skill: NSObject {
    var name : String! = nil
    var type : String! = nil
    var damageCategory : String! = nil
    var power : Int = 0
    var accuracy : Int = 0
    var powerPoint : Int = 0
    
    init(name:String, type:String, damageCategory:String, power:Int, accuracy:Int, powerPoint:Int) {
        self.name=name
        self.type=type
        self.damageCategory=damageCategory
        self.power=power
        self.accuracy=accuracy
        self.powerPoint=powerPoint
    }
}
