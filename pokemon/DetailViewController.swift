//
//  DetailViewController.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 29/02/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pokemon :Pokemon!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var type1: UILabel!
    @IBOutlet weak var type2: UILabel!
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var spattack: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var spdefense: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            let url = NSURL(string: self.pokemon.image)
            let data = NSData(contentsOfURL: url!)
            dispatch_async(dispatch_get_main_queue()){
                self.img.image = UIImage(data: data!)
            };
        });
        self.name.text = pokemon.name
        self.number.text = String(pokemon.number)
        self.level.text = String(pokemon.level)
        self.type1.text = pokemon.type1
        self.health.text = String(pokemon.status.health)
        self.attack.text = String(pokemon.status.attack)
        self.speed.text = String(pokemon.status.speed)
        self.spattack.text = String(pokemon.status.spAttack)
        self.defense.text = String(pokemon.status.defense)
        self.spdefense.text = String(pokemon.status.spDefense)
        if(pokemon.type2 != nil){
            self.type2.text = pokemon.type2
        }else{
            self.type2.text = "None"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.skills.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SkillTableViewCell
        let skill = pokemon.skills[indexPath.row] as! Skill
        cell.name.text=skill.name
        cell.type.text=skill.type
        cell.damage.text=skill.damageCategory
        cell.powerpoint.text=String(skill.powerPoint)
        cell.power.text=String(skill.power)
        cell.accuracy.text=String(skill.accuracy)
        
        return cell
    }
    
}
