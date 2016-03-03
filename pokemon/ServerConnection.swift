//
//  ServerConnection.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 01/03/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class ServerConnection: NSObject {

    var trainer : Trainer!
    
    func login(login:String, password:String, completionHandler: (Bool?, String?) -> Void ) -> NSURLSessionTask{
        let requestURL = NSURL(string:"http://server03.local:60080/login/?user="+login+"&password="+password)!
        let request = NSMutableURLRequest(URL: requestURL)
        request.HTTPMethod = "GET"
        let session = NSURLSession.sharedSession()
        
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) in
            do{
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                if(jsonResult["response"] as! String == "true"){
                    self.createPokemons(jsonResult)
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(true, nil)
                    })
                }else{
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(false, jsonResult["message"] as? String)
                    })
                }
            } catch {
            }
        })
        task.resume()
        return task
    }
    
    func createPokemons(dic:NSDictionary){
        let data = dic["data"] as! NSDictionary
        var pokemons = data.objectForKey("onHandPokemons") as! [NSDictionary]

        let arrayPokemons : NSMutableArray! = NSMutableArray()
        for (var i=0;i<pokemons.count;i++){
            let new = pokemons[i] as NSDictionary
            
            //Loading Status
            let statusDic = new["status"] as! NSDictionary
            let status = Status(health: statusDic["health"] as! Int, attack: statusDic["attack"] as! Int, defense: statusDic["defense"] as! Int, spAttack: statusDic["spAttack"] as! Int, spDefense: statusDic["spDefense"] as! Int, speed: statusDic["speed"] as! Int)
               
            //Loading Skills
            let skills : NSMutableArray! = NSMutableArray()
            var skillsDic = new.objectForKey("skills") as! [NSDictionary]
            for(var i=0;i<skillsDic.count;i++){
                let actualSkill = skillsDic[i] as NSDictionary
                skills.addObject(Skill(name: actualSkill["name"] as! String, type: actualSkill["type"] as! String, damageCategory: actualSkill["damageCategory"] as! String, power: actualSkill["power"] as! Int, accuracy: actualSkill["accuracy"] as! Int, powerPoint: actualSkill["powerPoint"] as! Int))
            }
            //Loading Pokemon
            let p = Pokemon(number: new["number"] as! Int, name: new["name"] as! String, icon: new["icon"] as! String, image: new["image"] as! String, level: new["level"] as! Int, type1: new["type1"] as! String, status: status, skills: skills as AnyObject as! [Skill])
            if(new["type2"] != nil){
               p.type2 = new["type2"] as! String
            }
            arrayPokemons.addObject(p)
        }
        self.trainer = Trainer(name: data["name"] as! String, age: data["age"] as! Int, photo: data["photo"] as! String, town: data["town"] as! String, onHandPokemons: arrayPokemons as AnyObject as! [Pokemon])
    }
}
