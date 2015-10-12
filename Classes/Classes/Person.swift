//
//  Person.swift
//  Classes
//
//  Created by Guy Azran on 12/10/2015.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//a class is the definition of what an object that is the same type of that class should look like
//a class is a template for creating an object
//what does "should look like" mean

//objects have 2 attributes
//1. characteristics / properties
//2. actions / functions

class Person {
    //stored properties
    lazy var name:String = "Name"; //a lazy field is not created until it is used
    var age:Int = 0{ //observers: allow you to perform actions before and after a value is set for a field
        willSet{
            print("the value of age is about to be changed");
        }didSet{
            print("the value of age has been changed");
        }
    }
    
    private var _lastName: String = "";
    
    //this is a computed property (as opposed to stored propperties), and is the conventional way to define "getters and setters" in swift
    var lastName:String{
        get{
            return _lastName
        }
        set{
            if newValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)<10{
                _lastName = newValue;
            }
        }
    }
    
    //computed properties can also be "get only" and cannot be changed from outside this class. however, if there is a setter there must be a getter
    private var _id:Int = ++counter;
    
    var id:Int{
        //get{ there is no need to write the "get" in a "get only" computed property
        return _id;
        //}
    }
    
    //this is a computed property that belongs to the class and is the same for all objects that are instances of this class
    class var species:String{
        return "Homo Sapiens";
    }
    
    //this is
    private static var counter:Int = 0;
    
    func description() -> String{
        return "I'm \(self.name) and I am \(self.age) " + (age == 1 ? "year" : "years") + " old";
    }
    
    /*
    //this method of "getter and setter" is also possible but is not conventional
    func setLastName(newValue: String){
        if newValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)<10{
            self._lastName = newValue;
        }
    }
    
    func getLastName() -> String{
        return self.getLastName()
    }
    */
}