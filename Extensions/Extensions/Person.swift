//
//  Person.swift
//  Extensions
//
//  Created by Guy Azran on 10/19/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

class Person {
    var name:String = "Name";
    var age:Int = 0;
    
    func description() -> String{
        return "I'm \(self.name) and i'm \(self.age) years old";
    }
    
    func doPersonThings(){
        print("\(self.name) is doing person things...");
    }
}