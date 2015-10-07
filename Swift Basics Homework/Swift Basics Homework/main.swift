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
    for _ in small..<large{
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
    if small == 1{
        return large;
    }else{
        return (large + product(large, y: distance(small, y: 1)));
    }
}


print("the product of \(x) and \(y) is \(product(x, y: y))")

func quotient(x: Int, y: Int) -> Int{
    if y == 0{
        return -1;
    }
    var result = 0;
    for var i = 0; y + product(i, y: y) <= x; ++i{
        result++;
    }
    return result;
}

print("the quotient of \(x) and \(y) is \(quotient(x, y: y))")

func remainder(x: Int, y: Int) -> Int{
    if y == 0{
        return -1;
    }
    if x < y{
        return x;
    }
    let quotientXY:Int = quotient(x, y: y);
    let productOfQuotient:Int = product(y, y: quotientXY);
    return distance(productOfQuotient, y:x);
}

print("the remainder of \(x) and \(y) is \(remainder(x, y: y))");

func power(x: Int, y: Int) -> Int{
    if x == 0{
        return 0
    }
    if y == 0{
        return 1;
    }
    if y == 1{
        return x;
    }
    return x * power(x, y: y-1);
}

print("\(x) to the power of \(y) is \(power(x, y: y))");

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
    while (x > 0){
        result += x % 10;
        x = x / 10;
    }
    return result;
}

print("the sum of the digits of \(x) is \(sumOfDigits(x))");

func largestDigit(var x: Int) -> Int{
    var result = x % 10;
    x = x / 10;
    while(x > 0){
        let digit:Int = x % 10;
        if digit > result{
            result = digit;
        }
        x /= 10;
    }
    return result;
}

print("the largest digit in \(x) is \(largestDigit(x))");

func reverseDigits(var x: Int) -> Int{
    var result = 0;
    while x > 0{
        result *= 10;
        result += x % 10;
        x /= 10;
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

func averageOfMembers(numbers: [Int]) -> Int{
    return sumOfMembers(numbers) / numbers.count;
}

print("the average of all members in \(myArray) is \(averageOfMembers(myArray))");

func sortArray(var numbers: [Int]) -> [Int]{
    for var i = numbers.count - 1; i > 0; --i{
        for var j = 0; j < i; ++j{
            if (numbers[j] > numbers[j + 1]){
                let temp = numbers[j];
                numbers[j] = numbers[j + 1]
                numbers[j + 1] = temp;
            }
        }
    }
    return numbers;
}

print("\(myArray) in ascending order is \(sortArray(myArray))");

func drawX(size:Int){
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









