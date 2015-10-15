//
//  main.swift
//  Subscripts
//
//  Created by Guy Azran on 10/15/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//subscripts

var array = ["a","b","c"];
let itemInTheArray = array[0]; //this is an example of subscript - "[0]"

class Person {
    var name:String = "Name";
    var age:Int = 0;
    
    func description() -> String{
        return "I'm " + name + " and I'm " + String(age) + " " + (age == 1 ? "year" : "years") + " old";
    }
    
    private var roles = ["Manager", "Parent", "Runner"];
    
    subscript(index:Int) -> String{
        get{
            return roles[index];
        }
        set{
            self.roles[index] = newValue;
        }
    }
}

var p = Person();
p.name = "Gil";
p.age = 22;
print(p[1]); //will return the value at index 1 of roles
p[1] = "Ringer";
print(p[1]);


class Map {
    //a subscript is another syntax of writing a getter and a setter
    //this subscript is the same as the get function below it
    subscript(lat:Double, lng:Double) -> String{
        get{
            if (lat < 10 && lat > 5 && lng > 10 && lng > 10){
                return "Ramat Gan";
            } else {
                return "Jerusalem";
            }
        }
    }
    
    //this function will return the same result
    func getCityName(lat:Double, lng:Double) -> String{
        if (lat < 10 && lat > 5 && lng > 10 && lng > 10){
            return "Ramat Gan";
        } else {
            return "Jerusalem";
        }
    }
}

var map = Map();
//these will print the same result
print(map[7, 11]);
print(map.getCityName(7, lng: 11));
















