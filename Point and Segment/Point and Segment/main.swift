//
//  main.swift
//  Point and Segment
//
//  Created by Guy Azran on 10/14/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

let p: Point = Point(x: 2, y: 4);

let p1: Point = Point(x: 3, y: 5);

let p2: Point = Point(x: 2, y: 4);

print(p.description());

print(p.distanceFromOrigin());

print(p.distanceFromPoint(p1))

print(p.getSlopeWithOrigin());

print(p.compare(p1));
print(p.compare(p2));

let p3: Point = Point(x: 5, y: 7);

let p4: Point = Point(x: 1, y: 1);

/*
var pointArray:[Point] = [p, p2, p3, p4];

func printPointArray(pointArray: [Point]){
    var line = "[";
    for p in pointArray{
        line += p.description();
    }
    line += "]";
    print(line);
}

printPointArray(pointArray);


pointArray.sortInPlace { (p1: Point, p2: Point) -> Bool in
    let compareResult = p1.compare(p2);
    
    if compareResult == 1{
        return false;
    } else{
        return true;
    }
}

printPointArray(pointArray);
*/

var arrayOfPoints: [AnyObject] = [Point(x: 18, y: 13), Point(x: 5, y: 7), Point(x: 3, y: 8)];
var p5 = arrayOfPoints[0] as! Point; //Forced Casting - casts to a certain type without question
var p6 = arrayOfPoints[1] as! Point;
var p7 = arrayOfPoints[2] as! Point;

func sortArray(inout items: [AnyObject], comparator: (AnyObject, AnyObject) -> Bool){
    var lastPosition = items.count - 1;
    var isSorted = false;
    while(!isSorted){
        isSorted = true;
        for (var i = 0; i < lastPosition; i++){
            if(comparator(items[i], items[i + 1])){
                let temp = items[i];
                items[i] = items[i+1];
                items[i+1] = temp;
                isSorted = false;
            }
        }
        lastPosition--;
    }
}

sortArray(&arrayOfPoints) { (p1: AnyObject, p2: AnyObject) -> Bool in
    let point1 = p1 as! Point;
    let point2 = p2 as! Point;
    return point1.compare(point2) > 0;
}

func printArrayOfPoints(pointArray: [AnyObject]){
    var line = "[";
    for p in pointArray{
        let point = p as! Point
        line += point.description();
    }
    line += "]";
    print(line);
}

printArrayOfPoints(arrayOfPoints);

var s:Segment = Segment(p1: Point(x: 1, y: 1), p2: Point(x: 1, y: 3));

var s2:Segment = Segment(p1: Point(x: 2, y: 2), p2: Point(x: 3, y: 1));

print(s.getSlope());

print(s.length);

print(s.getYIntercepct());

print(s.getIntersectionWith(s2)!.description());

//here we create a pointer that refers to a new Point. then we make the pointer refer to "nil". when this happens, the Point is deinitialized and the "deinit" is called.
var p10:Point? = Point(x: 3, y: 4);
p10 = nil;
//deinit function will print before "done" is printed
print("done");
