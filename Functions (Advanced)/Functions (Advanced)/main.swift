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
