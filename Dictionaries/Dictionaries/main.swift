//
//  main.swift
//  Dictionaries
//
//  Created by Guy Azran on 10/19/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//regular array
var myArray = [Int]();
myArray.append(8);
myArray.append(19);
myArray.append(30);
for num in myArray{
    print(num);
}
print("we have", myArray.count, "elements in the array");
if let positionOfEight = myArray.indexOf(8){
    myArray.removeAtIndex(positionOfEight);
}

//Dictionary
//a dictionary is an array that has a key of some type for every value in the array

//a dictionary can be initialized in 3 ways
//1.
var d1:Dictionary<String, Int>;
d1 = Dictionary();

//2.
var d2 = [String: Int]();

//3.
var cities = [3: "Tel Aviv", 2: "Jerusalem", 8: "Modi'in"];

//a dictionary can hold any objectas it's value
class Dog {
    var name:String;
    init(name:String){
        self.name = name;
    }
}

var pairs = [String: Dog]();

/*
//the key can be any object that conforms to the "Hashable" protocol
class Cat {
    
}

var pairs2 = [Cat: Dog](); //this is an error because
*/

pairs["Snoopy"] = Dog(name: "Snoopy");
pairs["Rexi"] = Dog(name: "Rexi");

pairs["Rexi"] = Dog(name: "rexi"); //the first dog is removed from the dictionary and the new dog will replace it.
print(pairs["Rexi"]?.name); //all dictionary values are optionals because there might not have been a value put for the specific key

var exists = pairs.keys.contains("Rexi"); //aDictionary.keys is an array of the keys in the dictionary

var exists2 = pairs.contains { (key, value) -> Bool in
    print("Key: \(key)    value: \(value.name)");
    return key == "yombo";
}

for d in pairs{
    print(d.0 + " " + d.1.name); //in a foreach loop, the key and the value are accessible via "varName.0" for the key and "varName.1" for the value
}