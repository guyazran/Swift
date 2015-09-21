//
//  main.swift
//  Variables Constants and Basic Stuff
//
//  Created by Guy Azran on 9/21/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

let s1:String = "Hello World";

print(s1);


let i:Int = -25;
let f:Float = 3.14
let d:Double = 99.99;
let b:Bool = true;

print("i = \(i) f = \(f) d = \(d) b = \(b)");
var s2 = "hello";
s2 += " ";
s2 += "world";
//s2 += 2; this is an error because in Swift there is no implicit casting
print(s2);

/*
block of comments.
you may also use comments to disable code
*/

//numbers
let i1:Int = 5;// type int
var i2 = 7; // automatic Int
var myByte:Int8 = 127; //type byte from
var myUnsignedByte:UInt8 = 255 //type byte only positive (from 0 to 255). all Int types can be unsigned
var myShort:Int16 = 200; //type short
var myInt:Int32 = 2000; // type int
var myLong:Int64 = 200000000 // type long

//myByte++; //this will cause a runtime error because of the byte overflow
print(myByte)

//Strings
let c1:Character = "a";
let isS1EqualToSomething = s1 == "Hello World";//initializing a boolean using a boolieanic expression
print("isS1EqualToSomething = \(isS1EqualToSomething)"); // will print true even though these are two different objects

//Booleans
var b1:Bool;
//print("b1 = \(b1)"); // doesn't compile because the compiler recognizes that this variable was not initialized

