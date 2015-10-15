//
//  main.swift
//  Point and Segment
//
//  Created by Guy Azran on 10/14/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

let p: Point = Point();
p.x = 2;
p.y = 4;

let p1: Point = Point();
p1.x = 3;
p1.y = 5;

let p2: Point = Point();
p2.x = 2;
p2.y = 4;

print(p.description());

print(p.distanceFromOrigin());

print(p.distanceFromPoint(p1))

print(p.getSlopeWithOrigin());

print(p.compare(p1));
print(p.compare(p2));

let p3: Point = Point();
p3.x = 5;
p3.y = 7;

let p4: Point = Point();
p4.x = 1;
p4.y = 1;

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

var arrayOfPoints: [AnyObject] = [Point(), Point(), Point()];
var p5 = arrayOfPoints[0] as! Point; //Forced Casting - casts to a certain type without question
var p6 = arrayOfPoints[1] as! Point;
var p7 = arrayOfPoints[2] as! Point;
p5.x = 18;
p5.y = 30;
p6.x = 5;
p6.y = 7;
p7.x = 3;
p7.y = 8;

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

var s:Segment = Segment();
s.p1.x = 1;
s.p1.y = 1;
s.p2.x = 3;
s.p2.y = 1;

var s2:Segment = Segment();
s2.p1.x = 2;
s2.p1.y = 2;
s2.p2.x = 3;
s2.p2.y = 1;


print(s.getSlope());

print(s.length());

print(s.getYIntercepct());

print(s.getIntersectionWith(s2)!.description());

