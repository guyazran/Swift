

let s1:String = "Hello World"; //this is a constant and cannot be changed after initialization
//s1 = "new value"; //this is an error, s1 is let, hence, is immutable


var s2:String = "Hello World";
s2 = "new value"; //this is okay, s2 is var, hence, is mutable


var s3 = "Hello World"; //type inferrence
//s3 = 3; // this is an error because s3 was infered to a string and may not be assaigned any other data type


//Basic data types in Swift:
//String, Int, Float, Double, Bool

let i:Int = -25; //four bytes
let f:Float = 3.14 //four bytes
let d:Double = 99.99; //eight bytes
let b:Bool = true; //~one byte