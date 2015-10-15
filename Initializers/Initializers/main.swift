//
//  main.swift
//  Initializers
//
//  Created by Guy Azran on 10/15/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

class Person{
    //class properties in swift require initialization for compilation to occur. however there are 3 exceptions
    /*
    //here the properties are initialized
    var name:String = "Name";
    var age:Int = 0;
    
    func description() -> String{
    return "I'm " + name + " and I'm " + String(age) + " " + (age == 1 ? "year" : "years") + " old";
    }
    */
    
    /*
    //1. the properties are defined as optionals
    var name:String?;
    var age:Int?;
    
    func description() -> String{
    //optionals require unwrapping before use
    var n = "";
    if let theName = name{
    n = theName;
    }
    var a = 0;
    if let theAge = age{
    a = theAge;
    }
    return "I'm " + n + " and I'm " + String(a) + " " + (a == 1 ? "year" : "years") + " old";
    }
    */
    
    /*
    //2. give up on using Swift nil protection. this may fail in runtime
    var name:String!;
    var age:Int!;
    
    func description() -> String{
    return "I'm " + name + " and I'm " + String(age) + " " + (age == 1 ? "year" : "years") + " old";
    }
    */
    
    //3. use an initializer
    var name:String;
    private var _age:Int;
    
    var age:Int{
        get{
            return _age;
        }
        set{
            if newValue >= 0{
                _age = newValue;
            }
        }
    }
    
    //an initializer is a method is one that is used to initialize all stored properties.
    //initializers do not use the word "func"
    //initializer with parameters
    init(name:String, age:Int){
        self.name = name;
        //self.age = age; //methods and computed properties cannot be used in initializers]
        self._age = age;
    }
    
    //initializer without parameters
    convenience init(){ //convenience initializers use another initializer to initialize the object
        /*
        name = "Name";
        age = 0;
        */
        //convenience initializers another initializer instead of initializing every property
        self.init(name: "Name", age: 0);
    }
    
    func description() -> String{
        return "I'm " + name + " and I'm " + String(age) + " " + (age == 1 ? "year" : "years") + " old";
    }
}

var p1 = Person();
print(p1.description());

var p2 = Person(name: "Gal", age: 29); //when using an initializer with parameters you must declare the name of the parameter before the value in all values
print(p2.description());



class Animal {
    var age:Int;
    init(age:Int){
        print("in animal init");
        self.age = age;
    }
}

class Dog: Animal{
    var color:String;
    
    /*
    //an initializer can be overriden
    override init(age: Int) {
        self.color = "brown";
        super.init(age: 0)
    }
    */
    
    //an initializer can be an overload of it's super
    init(){
        color = "brown";
        super.init(age: 2)
    }
}

var d = Dog();














