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


let i1:Int = -25;
let f:Float = 3.14
let d:Double = 99.99;
let b:Bool = true;

print("i1 = \(i1) f = \(f) d = \(d) b = \(b)");
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
let i2:Int = 5;// type int
var i3 = 7; // automatic Int
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


//scope
let isTrue = true; //global variable: can be used in all scopes created in it's scope
if(isTrue){
    var myString = "This is a \(isTrue) statement"; //myString is in the "if"'s scope and cannot be used outside of it
    print(myString);
}
//print(myString); //will not compile because myString is declared an an inner scope


//math operators
i3++;
i3--;
i3 *= 2;
i3 /= 2;
i3 = i2 % 5;
i3 = 5;
var x = Double(i2) / 2.0; //both variables must be of the same type. here i2 is casted to a double
print("x = \(x)");

//logical operators
var y = 8.9;
myFlag = x == y;
myFlag = x != y;
myFlag = x > y;

let f1 = true, f2 = true;

let f3 = !f1;
let f4 = f1 && f2;

//ternary if
x = y>19 ? 8 : 10;

//loops
for i in 1...10{ //includes 10
    print("i = \(i)");
}

for i in 1..<10{ //doesn't include 10
    print("i = \(i)");
}


//enums
enum ComputerState{
    case Inactive
    case Active
    case Hibernate
    case Terminated
}
var myComputerState:ComputerState;
myComputerState = ComputerState.Active;

if myComputerState == ComputerState.Active{
    print("your computer is active");
}

enum MaritalStatus{
    case Married
    case Divorced
    case Widow
    case Single
}

var myMaritalStatus = MaritalStatus.Married; //Swift can also understand enum types

var myMaritalStatus2:MaritalStatus;
myMaritalStatus = .Married; //if the enum type is set on declaration, there is no need to write the type before assigning a value


//arrays
var myArray:[String]; //create a reference (pointer) to an array of Strings

myArray = [String](); //assign it a new object that is an array of Strings

myArray.append("Guy");
myArray.append("Gal");
myArray.append("Moran");

var myArray2 = ["Guy", "Gal", "Moran"];

for name in myArray{
    print("name = \(name)");
}
print(myArray[1]);

myArray.insert("Gil", atIndex: 0);
myArray.removeAtIndex(1)

for name in myArray{
    print("name = \(name)");
}

//myArray.removeAll(keepCapacity: true) //"keepCapacity: true" this will keep the size of the array
myArray[1] = "Elad";

for i in 0 ..< myArray.count{
    print("value at \(i) = \(myArray[i])");
}


//loops (continued)

for var i = 0; i <= 10; ++i{
    print("i = \(i)");
}

var i = 0;
while i <= 10{
    print("i = \(i)");
    i++;
}

//do while (same as java)

//in loops, like in java we have "continue" and "break"


//conditions
//if, else, else if (same as java)

switch i{
case 0:
    print("i is zero"); //in Swift no case is needed
case 2...4:
    print("i is between two and four");
default: //in Swift a default case is mandatory
    print("i is something else");
}
