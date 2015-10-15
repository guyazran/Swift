//
//  main.swift
//  Inheritance
//
//  Created by Guy Azran on 10/15/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

class Person{
    var name:String = "Name";
    var age:Int = 0;
    
    func description() -> String{
        return "I'm " + name + " and I'm " + String(age) + " " + (age == 1 ? "year" : "years") + " old";
    }
}

class Employee: Person {
    var employeeNumber:Int = 1234
    var hourlyRate = 23.0;
    
    override func description() -> String {
        return super.description() + " my employee number is " + String(employeeNumber) + " and my hourly rate is " + String(hourlyRate);
    }
}

var emp = Employee();
emp.age = 20;
emp.hourlyRate = 30;
var emp2:Person = Employee();
//the methods and properties available are determined by the pointer's type
//emp2.hourlyRate = 35; //this is an error because emp2 is a Person type pointer and does not have access to "hourlyRate"
var emp2asEmployee = emp2 as! Employee;
emp2asEmployee.hourlyRate = 35;

/*
//the methods that is invoked is determined by the type of the actual object that the pointer is refering to.
print(emp2asEmployee.description()); //this is an employee type pointer that will use the description in employee
print(emp2.description()); //this is a person type pointer. however, the opject it is pointing to is an employee. therefor he will invoke the description in employee
*/

class A{
    
}

class B : A{
    func stam(){
        print("stam...");
    }
}

/*
var b:A = B();
//this is correct syntax for casting and invoking subclass methods. however, this can crash in runtime
(b as! B).stam();
*/

var b:A = A();
let c = b as? B; //this makes c an optional B. the value of c will be the value of b only if casting is possible. if not, the value of c is nil
//print(c?.stam()); //"?" after an optional while invoking a method is a safe way to invoke without fear of runtime error because of a nil reference. this will print "nil"
if let theC = c{
    print(theC.stam());
} else{
    print("c is nil");
}
//another way to cast safely:
if b is B{
    (b as! B).stam();
} else{
    print("b cannot be cast to B, wrong Type");
}
