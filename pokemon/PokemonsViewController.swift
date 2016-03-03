//
//  PokemonsViewController.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 29/02/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class PokemonsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var town: UILabel!
    
    var trainer : Trainer!
    var pok : Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            let url = NSURL(string: self.trainer.photo)
            let data = NSData(contentsOfURL: url!)
            dispatch_async(dispatch_get_main_queue()){
                self.photo.image = UIImage(data: data!)
            };
        });
        self.name.text = trainer.name
        self.age.text=String(trainer.age)
        self.town.text=trainer.town
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainer.onHandPokemons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        let pokemon = trainer.onHandPokemons[indexPath.row] as! Pokemon
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            let url = NSURL(string: pokemon.icon)
            let data = NSData(contentsOfURL: url!)
            dispatch_async(dispatch_get_main_queue()){
               cell.img.image = UIImage(data: data!)
            };
        });
        cell.name.text = pokemon.name
        cell.type1.text = pokemon.type1
        cell.level.text = String(pokemon.level)
        if(pokemon.type2 != nil){
            cell.type2.text = pokemon.type2
        }else{
            cell.type2.text = "None"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.pok = trainer.onHandPokemons[indexPath.row] as! Pokemon
        self.performSegueWithIdentifier("gotoDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "gotoDetail"){
            let d = (segue.destinationViewController) as! DetailViewController
            d.pokemon = self.pok
        }
    }
}
