//
//  main.swift
//  Closures
//
//  Created by Guy Azran on 12/10/2015.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

var names = ["Alex", "Guy", "Gil", "Gal"];

/*
//create an anonymous function to allow the sort function to compare the values of the array
//the function returns true if the first element is larger the second element (for ascending order)
//this function is called a "closure", a function that is required to use another function
names.sortInPlace { (s1: String, s2: String) -> Bool in
    return s1 < s2;
}
*/

/*
func compare(s1: String, s2: String) -> Bool{
    return s1 < s2;
}

//give the function another comparing function that already exists
names.sortInPlace(compare);
*/

/*
//create a constant or variable with a function as a value
let compare = {(s1: String, s2: String) -> Bool in
    return s1 < s2;
}

//this variable can be used as a function
let f = compare("A", "B")
print(f);

//give the function a constant or variable containing a camparing function
names.sortInPlace(compare);

print(names);
*/

//a function that receives a closure as a parameter
func mySort(a: String, b: String, sortRule: (String, String) -> Bool){
    if sortRule(a, b){
        print("b is larger");
    } else{
        print("a is larger");
    }
}

/*
//calling a function that receives a closure
mySort("A", b: "B") { (s1: String, s2: String) -> Bool in
    return s1 < s2;
}
*/

/*
//rearange a the calling of a function that receives a closure so that the closure looks like one of the parameters
//this is automatic when the closure is not the final parameter
mySort("A", b: "B", sortRule: { (s1: String, s2: String) -> Bool in
    return s1 < s2;
});
*/

//mySort { (s1: String, s2: String) -> Bool in
//    return s1 < s2;
//}

func sortArray(inout arr: [AnyObject], sortRule: (AnyObject, AnyObject) -> Bool){
    var lastPosition = arr.count - 1;
    var isSorted = false
    while(!isSorted){
        isSorted = true;
        for (var i = 0; i < lastPosition; i++){
            if(sortRule(arr[i + 1], arr[i])){
                let temp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = temp;
                isSorted = false;
            }
        }
        lastPosition--;
    }
}
