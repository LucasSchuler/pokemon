//
//  ViewController.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 29/02/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var trainer : Trainer!
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button(sender: AnyObject) {
        let server = ServerConnection()
        server.login(login.text!, password: password.text!) { (success, message) -> Void in
            if(success == true){
                self.trainer = server.trainer
                self.performSegueWithIdentifier("gotoPokemons", sender: self)
            }else{
                let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        
//        if(server.login(login.text!, password: password.text!)){
//            self.trainer = server.trainer
//            self.performSegueWithIdentifier("gotoPokemons", sender: self)
//        }else{
//            print("erro")
//        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "gotoPokemons")
        {
            let p = (segue.destinationViewController) as! PokemonsViewController
            p.trainer=self.trainer
        }
    }
}

