//
//  main.swift
//  Functions (Advanced)
//
//  Created by Guy Azran on 10/22/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//external parameter name
//you can add a name for a parameter in a function that will be shown when calling the function
func someFunction(theFirstParameter param1: Int, theSecondParameter param2: Int){ //the first parameter names are the external one.
    let sum = param1 + param2;
    print("the sum is \(sum)");
}

//here we use the first parameter names defined in the function. this also forces the stating of the first parameter name
someFunction(theFirstParameter: 3, theSecondParameter: 4);

//this is an example where an external name is used to make the calling of a function readable as a sentence
func multiply(x: Int, by y: Int) -> Int{
    return x*y;
}

//here is a calling of a function that looks like a sentence in english
multiply(3, by: 4); //multiply 3 by 4

//you can also use the same name as the internal parameter for the external name.
func calcRectangleArea(width width: Int, height: Int) -> Int{
    return width * height;
}

calcRectangleArea(width: 3, height: 4); //calc rectangle area - width: 3, height: 4


//default parameter values
//you can define a default value for a parameter in a function. this allows you to only define the other parameters (alternative to overloads)
func multiply2(x: Int, by y: Int = 2) -> Int{ //y's defalut value is 2
    return x*y;
}

multiply2(3, by: 4); //this will return 12 as if y does not have a default value;
multiply2(3); //this will return 6 because 3 will be multiplied by the defalut value of y which is 2


//variadic parameter
//a parameter that represents an array that is constructed of an undefined number of parameters defined when the function is called
/*
//if i want to sum different amounts of numbers, i need to write many overloads
func sum(x: Int, y: Int) -> Int{
    return x + y;
}

func sum(x: Int, y: Int, z: Int) -> Int{
    return sum(x, y: y) + z;
}

//i can also use an array, but this is very cumbersome
func sum(numbers: [Int]) -> Int{
    var total = 0;
    for num in numbers{
        total += num;
    }
    return total;
}

var numbers = [Int]();
numbers.append(3);
numbers.append(12);
numbers.append(-3);

//both will return the same result, but the array was more cumbersome to initialize
sum(numbers);
sum(3, y: 12, z: -3);
*/

//here we use a variadic parameter
func sum(numbers:Int...) -> Int{
    var total = 0;
    for num in numbers{
        total += num;
    }
    return total;
}

sum(3, 12, -3); //here i can add as many integer parameters i want

var numbers = [Int]();
numbers.append(3);
numbers.append(12);
numbers.append(-3);

//sum(numbers); //this does not work, but it should

//if we want to add other parameters, the variadic parameter must be last. there can only be one variadic parameter per function
func sum(s:String, numbers:Int...) -> Int{
    var total = 0;
    for num in numbers{
        total += num;
    }
    print(s);
    return total;
}

sum("in sum", numbers: 5, 7, 9, 13)


//value and reference type parameters

//value type parameters
//primitive parameters and structs are copied to the function, therefor changing their value does not affect the original variable sent to the function.
func stam (var x: Int){ //in order to change the parameter it must be defined as "var"
    x++;
}

var x = 8;
stam(x);
print(x); //this will print 8 because x was copied to stam, but the original variable was not changed

//reference type parameters
//object parameters will pass their address in the RAM, therefor the original object will be changed if it is changed in the function
class Dog {
    var name:String;
    init(name: String){
        self.name = name;
    }
}

var d = Dog(name: "snoopy");

func handleDog(dog: Dog){ //the variable "dog" is the same as "d" outside the function. changing "dog" will change "d".
    dog.name += " handled";
}

handleDog(d);
print("dog's name is " + d.name); //will print "snoopy handled" because the original dog is altered in the function.

//primitive parameters and structs can also be passed as a reference type
//the use of "inout" before the parameter name will pass it as reference type
func stam2(inout x: Int){
    x++;
}
stam2(&x);
print(x)// will print 9 because the original x was changed in the function.
