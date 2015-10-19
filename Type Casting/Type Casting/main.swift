//
//  main.swift
//  Type Casting
//
//  Created by Guy Azran on 10/19/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

let f1 = 9.99;
let i1 = Int(f1); //the value is 9. data after the decimal point is lost
let d1 = Double(f1);
let b1 = Bool(f1); //value is true. all numbers that are not 0 return true (including negatives)
let s1 = String(f1);
let f2 = Double(i1); //value is 9.0 and not 9.99 because the data after the decimal has already been lost and cannot be retrieved

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

class Employee: Person {
    var employeeNumber = 12345;
    var hourlyRate = 23.0;
    
    func doEmployeeThings(){
        print("\(self.name) is doing employee things...")
    }
    
    override func description() -> String {
        return super.description() + ". My employee number is \(self.employeeNumber) and my hourly rate is \(self.hourlyRate)";
    }
}

var e1 = Employee();
e1.name = "Matan";
e1.doPersonThings();
e1.doEmployeeThings();

var p1:Person = e1;
print(p1.description());
var e2 = p1 as! Employee;
e2.doEmployeeThings();
(p1 as! Employee).doEmployeeThings(); //the same as the method before but without creating a pointer

//if as! is used for the wrong type, the value will be nil
//(p1 as? Employee).doEmployeeThings(); //will not compile, p1 may not be an Employee type. this can be avoided
//method 1:
var e3 = p1 as? Employee;
if let theEmployee = e3{
    theEmployee.doEmployeeThings();
}
//method 2:
if p1 is Employee{
    (p1 as! Employee).doEmployeeThings();
}
