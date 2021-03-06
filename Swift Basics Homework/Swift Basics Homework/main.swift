//
//  main.swift
//  Swift Basics Homework
//
//  Created by Guy Azran on 9/30/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

let x:Int = 5321;
let y:Int = 2;

func distance(x: Int, y: Int) -> Int{
    var large = x;
    var small = y;
    if y > x{
        large = y;
        small = x;
    }
    var result:Int = 0;
    while small + result < large{
        result++;
    }
    return result;
}

print("the distance between \(x) and \(y) is \(distance(x, y:y))");

func product(x: Int, y: Int) -> Int{
    if x == 0 || y == 0{
        return 0
    }
    
    var large = x;
    var small = y;
    
    if y > x{
        large = y;
        small = x;
    }
    
    var result = 0;
    for _ in 0 ..< small{
        result += large
    }
    return result;
}


print("the product of \(x) and \(y) is \(product(x, y: y))")

/*
use quotientB to also receive the remainder in the same function
func quotient(x: Int, y: Int) -> Int{
    if y == 0{
        return -1;
    }
    var result = 0;
    for var i = y; i <= x; i += y{
        result++;
    }
    return result;
}

print("the quotient of \(x) and \(y) is \(quotient(x, y: y))")
*/

func quotientB(x: Int, y: Int) -> (Int,Int){
    if y == 0{
        return (-1,-1);
    }
    var result = 0;
    var largestProductOfY = 0;
    for var i = y; i <= x; i += y{
        result++;
        largestProductOfY = i;
    }
    return (result, distance(x, y: largestProductOfY));
}

/*
this function is less CPU minded because quotient and product both reach the largest product of y. therefor there is no need to run both of them.
instead, we will bring the solution directly from quotient using Tupel.

func remainder(x: Int, y: Int) -> Int{
    if y == 0{
        return -1;
    }
    
    return distance(product(y, y: quotient(x, y: y)), y:x);
}

print("the remainder of \(x) and \(y) is \(remainder(x, y: y))");
*/

let (q, r) = quotientB(x, y: y);
print("the quotient of \(x) and \(y) is \(q) and the remainder is \(r)");

//with loop
func powerA(x: Int, y: Int) -> Int{
    if x == 0{
        if y == 0{
            return -1;
        }
        return 0
    }
    if y == 0 || x == 1{
        return 1;
    }
    
    var result = x;
    for _ in 1..<y{
        result *= x;
    }
    return result;
}

print("\(x) to the power of \(y) is \(powerA(x, y: y)) (powerA)");

//without loop
func powerB(x: Int, y: Int) -> Int{
    if x == 0{
        if y == 0{
            return -1;
        }
        return 0
    }
    if y == 0 || x == 1{
        return 1;
    }
    
    return x * powerB(x, y: y-1);
}

print("\(x) to the power of \(y) is \(powerB(x, y: y)) (powerB)");

func sqrt(x: Int) -> Int{
    var result:Int = 0;
    while result*result < x{
        result++;
    }
    return result;
}

print("the square root of \(x) is \(sqrt(x))");

func sumOfDigits(var x: Int) -> Int{
    var result = 0;
    var lastDigit:Int;
    while (x != 0){
        lastDigit = x % 10;
        x /= 10;
        
        result += lastDigit;
    }
    return result;
}

print("the sum of the digits of \(x) is \(sumOfDigits(x))");

func largestDigit(var x: Int) -> Int{
    var result = 0;
    var lastDigit:Int;
    while(x > 0){
        lastDigit = x % 10;
        x /= 10;
        
        if lastDigit > result{
            result = lastDigit;
        }
    }
    return result;
}

print("the largest digit in \(x) is \(largestDigit(x))");

func reverseDigits(var x: Int) -> Int{
    var result = 0;
    var lastDigit:Int;
    while x > 0{
        lastDigit = x % 10;
        x /= 10;
        
        result = result * 10 + lastDigit;
    }
    return result;
}

print("the reverse digits of \(x) is \(reverseDigits(x))");

var myArray = [2, 4, 3, 2, 9, 8, 7, 1];

func sumOfMembers(numbers:[Int]) -> Int{
    var result = 0;
    for num in numbers{
        result += num;
    }
    return result;
}

print("the sum of the members is \(myArray) are \(sumOfMembers(myArray))");

func largestMember(numbers: [Int]) -> Int{
    var result = numbers[0];
    for i in 1..<numbers.count{
        if numbers[i] > result{
            result = numbers[i];
        }
    }
    return result;
}

print("the largest member in \(myArray) is \(largestMember(myArray))");

func averageOfMembers(numbers: [Int]) -> Double{
    return Double(sumOfMembers(numbers)) / Double(numbers.count);
}

print("the average of all members in \(myArray) is \(averageOfMembers(myArray))");

/*
this way the method receives a copy of the array
func sortArray(var numbers: [Int]) -> [Int]{
    for var i = numbers.count - 1; i > 0; --i{
        for var j = 0; j < i; ++j{
            if (numbers[j] > numbers[j + 1]){
                //let temp = numbers[j];
                //numbers[j] = numbers[j + 1]
                //numbers[j + 1] = temp;
                
                //this is also possible
                numbers.insert(numbers[j + 1], atIndex: j);
                numbers.removeAtIndex(j + 2);
            }
        }
    }
    return numbers;
}

print("\(myArray) in ascending order is \(sortArray(myArray))");
*/

//this method receives a refference to the array and changes the original
func sortArray(inout numbers: [Int]){
    var lastPosition = numbers.count - 1;
    var isSorted = false
    while(!isSorted){
        isSorted = true;
        for (var i = 0; i < lastPosition; i++){
            if(numbers[i] > numbers[i+1]){
                let temp = numbers[i];
                numbers[i] = numbers[i+1];
                numbers[i+1] = temp;
                isSorted = false;
            }
        }
        lastPosition--;
    }
}

var s = "\(myArray) in ascending order is ";
sortArray(&myArray);
s += "\(myArray)";
print(s);

func drawX(var size:Int){
    if size % 2 == 0{
        size++;
    }
    for i in 0...size{
        var line = "";
        for j in 0...size{
            line += j == i || j == size - i ? "*" : " ";
        }
        print(line);
    }
}

drawX(10);

func drawRect(x: Int, y: Int, width: Int, height: Int){
    for var i = 0; i < y; ++i{
        print("");
    }
    for var i = 0; i < height; ++i{
        var line = "";
        for var j = 0; j < x; ++j{
            line += " ";
        }
        for var j = 0; j < width; ++j{
            line += j == 0 || j == width - 1 || i == 0 || i == height - 1 ? "*" : " ";
        }
        print(line);
    }
}

drawRect(5, y: 5, width: 50, height: 10);


func distanceFromPoint(x1: Int, y1: Int, x2: Int, y2: Int) -> Double{
    let deltaX = x1 - x2;
    let deltaY = y1 - y2;
    let sumOfSquares = deltaX * deltaX + deltaY * deltaY;
    return sqrt(Double(sumOfSquares));
}

//my Solution
func drawCircle(x: Int, y: Int, radius: Int){
    let xOfRect = x - radius;
    let yOfRect = y - radius;
    let sideOfRect = radius * 2;
    
    for var i = 0; i < yOfRect; ++i{
        print("");
    }
    for var i = 0; i < sideOfRect + 1; ++i{
        var line = "";
        for var j = 0; j < xOfRect; ++j{
            line += " ";
        }
        for var j = 0; j < sideOfRect + 1; ++j{
            let distanceFromOrigin = distanceFromPoint(x, y1: y, x2: j + xOfRect, y2: i + yOfRect)
            line += distanceFromOrigin > Double(Double(radius) - 0.5) && distanceFromOrigin < Double(Double(radius) + 0.5) ? "*" : " ";
        }
        print(line);
    }
}

drawCircle(50, y: 30, radius: 10);

//teacher solution
func drawCircle2(a: Double, b: Double, radius: Double){
    
    func isPointOnCircle(x: Double, y: Double) -> Bool{
        let deltaX = x - a;
        let deltaY = y - b;
        let distance = sqrt(deltaX * deltaX + deltaY * deltaY);
        var difference = distance - radius;
        if difference < 0{
            difference *= -1;
        }
        return difference < 0.5;
        
    }
    
    var line:String;
    
    for i in 0 ..< Int(b + radius + 1){
        line = "";
        for j in 0 ..< Int(a + radius + 1){
            line += isPointOnCircle(Double(j), y: Double(i)) ? "*" : " ";
        }
        print(line);
    }
}

drawCircle2(30, b: 50, radius: 10)

var canvas:[[Bool]] = [[Bool]]();
for i in 0..<20{
    var line = [Bool]();
    for j in 0..<100{
        line.append(false);
    }
    canvas.append(line);
}


func drawRect2(inout canvas: [[Bool]], x: Int, y: Int, var width: Int, var height: Int){
    if y > canvas.count || x > canvas[1].count{
        return;
    }
    
    if y + height > canvas.count{
        height = canvas.count - y;
    }
    if x + width > canvas[1].count{
        width = canvas[1].count - x;
    }
    
    /*
    //this loop will go through all places within the rectangle
    for i in y ..< y + height{
        for j in x ..< x + width{
            if(j == x || j == x + width - 1 || i == y || i == y + height - 1){
                canvas[i][j] = true;
            }
        }
        
    }
    */
    
    //this loop will only go through the sides of the rectangle
    for i in x ..< x + width{
        canvas[y][i] = true;
        canvas[y + height - 1][i] = true;
    }
    for i in y ..< y + height{
        canvas[i][x] = true;
        canvas[i][x + width - 1] = true;
    }
    
}

func render(inout canvas: [[Bool]]){
    for i in 0..<canvas.count{
        var line = ""
        for j in 0..<canvas[1].count{
            line += canvas[i][j] ? "*" : " ";
        }
        print(line);
    }
}

drawRect2(&canvas, x: 20, y: 8, width: 30, height: 10);
drawRect2(&canvas, x: 10, y: 3, width: 30, height: 10);
render(&canvas);
