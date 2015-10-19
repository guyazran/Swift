//
//  SomeClass.swift
//  Protocols
//
//  Created by Guy Azran on 10/19/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

protocol PrinterProtocol3{
    func printStuff();
    func printThings();
}

class SomeClass {
    
    var delegate: PrinterProtocol3?;
    
    func someEvent(){
        if let theDelegate = delegate{
            theDelegate.printStuff();
        }
    }
}