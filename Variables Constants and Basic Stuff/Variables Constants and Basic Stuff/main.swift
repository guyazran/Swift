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


//tuples
let  rectangle1 = (0,0,200,100);
print("rectangle1 = \(rectangle1)");
print("rectangle1 fourth component = \(rectangle1.3)");

let rectangle2 = (x: 0, y: 0, width: 200, height: 100);
print("rectangle2's width = \(rectangle2.width)");

let (_,_,width,height) = rectangle1; //the underscore allows us to choose values that do not interest me in the tuple
print("width of rectangle1 is \(width)");


// optionals
var s:String?; //a question mark at the end of the vavriable type makes it an "optional" and may or may not receive a value. if not, the value is "nil"
s = "hello"; //s is not a true string and therefore the value of is is an optional containing a string with the value "hello"
print("the value of s is \(s)"); //will print out "Optional("hello")"
print("the value of s is \(s!)"); //the exclamation mark will unwrap the wrapped content of s, and print out "hello"

var st:String?;
//print("the value of st is \(st!)"); //will cause a runtime error because there is no value to unwrap in st
/*
if st != nil{ //in an if statement in Swift there is no need for parentheses, but this may cause issues in certain cases
    print("the value of st is \(st!)")
} else{
    print("the value of st is nill")
}

this is a correct syntax, but it is not the expected syntax
*/

//conditional unwrap
if let theValueOfSt = st{ //an assignment of a constant(let) with another variable returns a boolean: true if the variable is not nil, false if the variable is nil
    print("the value of st is \(theValueOfSt)"); //"theValueOfSt" is unwrapped
}else{
    print("the value of st is nil");
}

//print(st.lowercaseString); //doesn't compile because st is optional
//print(st!.lowercaseString); //will throw runtime exception because st is nil
print(st?.lowercaseString); //cannot fail, the computer will make sure st is not nil before accessing it. if nil, the printed value is "nil"


//typealias
typealias Flag = Bool;
var myFlag:Flag = true;

typealias Note = String;
var myNote:Note = "bla bla";
