//
//  Point.swift
//  Point and Segment
//
//  Created by Guy Azran on 10/14/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

class Point{
    private var _x:Double = 0;
    private var _y:Double = 0;
    
    var x:Double{
        get{
            return _x;
        }set{
            if newValue < 0{
                _x = 0;
            } else{
                _x = newValue;
            }
        }
    }
    
    var y:Double{
        get{
            return _y;
        }set{
            if newValue < 0{
                _y = 0;
            } else{
                _y = newValue;
            }
        }
    }
    
    func description() -> String{
        return "(\(x),\(y))";
    }
    
    func distanceFromPoint(p: Point) -> Double{
        let deltaX = p.x - self.x;
        let deltaY = p.y - self.y;
        let sumOfSquares = deltaX * deltaX + deltaY * deltaY;
        let distance = sqrt(Double(sumOfSquares));
        return distance;
    }
    
    func distanceFromOrigin() -> Double{
        return distanceFromPoint(Point());
    }
    
    func getSlopeWith(p: Point) -> Double{
        let deltaX = p.x - x;
        let deltaY = p.y - y;
        
        if deltaX == 0{
            return DBL_MIN;
        }
        
        let slope:Double = Double(deltaY) / Double(deltaX)
        return slope;
    }
    
    func getSlopeWithOrigin() -> Double{
        return getSlopeWith(Point());
    }
    
    func compare(p: Point) -> Int{
        if self === p || (self.x == p.x && self.y == p.y){
            return 0;
        }
        
        let selfDistanceFromOrigin = self.distanceFromOrigin();
        let pDistanceFromOrigin = p.distanceFromOrigin();
        
        if selfDistanceFromOrigin == pDistanceFromOrigin{
            let selfSlope = self.getSlopeWithOrigin();
            let pSlope = p.getSlopeWithOrigin()
            
            if selfSlope > pSlope{
                return 1;
            } else if selfSlope < pSlope{
                return -1;
            } else{
                return 0;
            }
        } else if selfDistanceFromOrigin > pDistanceFromOrigin{
            return 1;
        } else {
            return -1
        }
    }
    
}