//
//  main.swift
//  Protocols
//
//  Created by Guy Azran on 10/19/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

//Protocols
//a protocol is a list of functions that must be realized by a class that conforms to this protocol

protocol PrinterProtocol{
    func printThis();
    func printThat();
}

class aClass : PrinterProtocol {
    func printThis() {
        print("aClass printThis");
    }
    func printThat() {
        print("aClass printThat")
    }
}

protocol PrinterProtocol2{
    func printThose();
}

class anotherClass : PrinterProtocol, PrinterProtocol2 { //if a class conforms to multiple protocols, they are separated by a comma
    func printThis() {
        print("aotherClass printThis");
    }
    func printThat() {
        print("anotherClass printThat")
    }
    
    func printThose() {
        print("anotherClass printThose");
    }
}

class aSuperClass {
    
}

class aSubClass: aSuperClass, PrinterProtocol{ //when a sub class inherits from a super class and also conforms a protocol, the inherited class must be first
    func printThis() {
        print("aSubClass printThis");
    }
    func printThat() {
        print("aSubClass printThat")
    }
}

class aThirdClass: PrinterProtocol3 {
    func printStuff(){
        print("aThirdClass printStuff");
    }
    func printThings(){
        print("aThirdClass printThings");
    }
}

var a = aThirdClass();
var someObject = SomeClass();
SomeObject.delegate = a;
//SomeObject.delegate = aThirdClass();
someObject.someEvent();







