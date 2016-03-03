//
//  Trainer.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 01/03/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class Trainer: NSObject {
    var name:String! = nil
    var age : Int = 0
    var photo : String! = nil
    var town : String! = nil
    var onHandPokemons : NSArray! = NSArray()
    
    init(name: String, age:Int, photo:String, town:String, onHandPokemons:NSArray) {
        self.name=name
        self.age=age
        self.photo=photo
        self.town=town
        self.onHandPokemons=onHandPokemons
    }
}
