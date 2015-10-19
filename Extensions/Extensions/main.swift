//
//  main.swift
//  Extensions
//
//  Created by Guy Azran on 10/19/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//Extensions

//extensions are a way to add functions to a class when you do not have access to it
//extensions are accessible in all files throughout the entire project

var p1 = Person();

//imagine that Person is not accessible
extension Person{
    //functions can be added
    func goToSleep(howManyHours: Int){
        print("\(self.name) is going to sleep for \(howManyHours) hours.");
    }
    
    //computed properties can also be added;
    var dogYear:Int{
        get{
            return self.age * 7;
        } set{
            self.age = newValue * 7;
        }
    }
    
    //var x:Int = 0; //this will not compile. extensions cannot contain stored properties
}

p1.goToSleep(3);
p1.dogYear = 21;