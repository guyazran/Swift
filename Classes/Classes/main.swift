//
//  main.swift
//  Classes
//
//  Created by Guy Azran on 12/10/2015.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//create a pointer (reference). The pointer refers to nothing (nil).
var p:Person;
//create an instance (object) of Person
//1. find a free space for the object (large enough to contain it)
//2. mark the space as taken
//3. initialize the space (zero)
//4. return the address in the memory of the created object (first byte only)
//  and save the address of the new object to a variable(pointer)
p = Person();


p.name = "Gil";
p.age = 22;
print(p.description());

//Person is of a reference type!!!!!
var p2 = p; //now we have 2 pointers that point to the same address in the memory

p.age = 23;

print("p2.age = " + String(p2.age));
//prints 23 because the two pointers point to the same address

func incrementAge(p: Person){
    p.age++;
}

incrementAge(p2)
print("p2.age = " + String(p2.age));

let p3 = Person(); //can be "let" because we are changing the values of variables in the object and not the value of the pointer which is the address of the object
p3.name = "Gil";
p3.age = 24; //this wouldn't work if person was a struct

//p3 = p2; //this will not compile because p3 is let and we can't change it's value (because it's a reference type, its value is actually an address in the memory)

print(p2 === p3); //we have to use "===" when comparing pointers. will return false because p2 and p3 hold different addresses in the memory

let p2IsEqualTop3 = p2.age == p3.age && p2.name == p3.name; //will return true because the values of the fields in p2 and p3 are equal
print(p2IsEqualTop3);

//p2.lastName //this will not compile because lastName is private and cannot be accessed from a different file.

p2.lastName = "Gal";
print(p2.lastName);

var p4 = Person();
print(p4.name); //name is lazy and therefor is created only when this line is reached

//p4.id = 9; p4 is "get only" and cannot be assigned a new value from outside the class
print(p4.id)

//we can call class specific computed properties by adding the name of the class before the property
print(Person.species);
