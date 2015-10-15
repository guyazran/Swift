//: Playground - noun: a place where people can play

import Cocoa

class Animal : NSObject{
    
}

class Dog : Animal{
    
}

let a = Animal();

let d = Dog();

class Car{
    
}

let c = Car();

var array:[Animal] = [d]; //the array receives the type of the element put in it unless defined otherwise.
array.append(a);
//array.append(c); //this array cannot have any members that are not Animal types

var array2 = [d, a]; //the array finds the common type between the members and that becomes its type
array.append(a);

var arr = [1,2,"3"]; //the common type here is NSObject and therefor any object that extends this type may be added to the array
arr.append("4");
arr.append(4.7);
arr.append(a);
arr.append(d);