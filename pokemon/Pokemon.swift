//
//  Pokemon.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 01/03/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class Pokemon: NSObject {
    var number : Int = 0
    var name : String! = nil
    var icon : String! = nil
    var image : String! = nil
    var level : Int = 0
    var type1 : String! = nil
    var type2 : String! = nil
    var status : Status! = nil
    var skills : NSArray! = NSArray()
    
    init(number: Int, name:String, icon:String, image:String, level:Int, type1:String, status:Status, skills:NSArray) {
        self.number=number
        self.name=name
        self.icon=icon
        self.image=image
        self.level=level
        self.type1=type1
        self.status=status
        self.skills=skills
    }
}
