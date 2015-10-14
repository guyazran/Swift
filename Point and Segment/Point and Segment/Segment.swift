//
//  Segment.swift
//  Point and Segment
//
//  Created by Guy Azran on 10/14/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

class Segment {
    private var _p1:Point = Point();
    private var _p2:Point = Point();
    
    var p1:Point{
        get{
            return _p1
        } set{
            _p1 = newValue
        }
    }
    var p2:Point{
        get{
            return _p2
        } set{
            _p2 = newValue
        }
    }
    
    func length() -> Double{
        return p1.distanceFromPoint(p2);
    }
    
    func getSlope() -> Double{
        return p1.getSlopeWith(p2);
    }
    
    func getYIntercepct() -> Double{
        if getSlope() == DBL_MIN{
            return DBL_MIN;
        }
        return Double(p1.y) - getSlope() * Double(p1.x);
    }
    
    func getIntersectionWith(s:Segment) -> Point?{
        let deltaM = getSlope() - s.getSlope();
        if deltaM == 0{
            return nil;
        }
        
        let xIntersection:Double;
        let yIntersection:Double;
        
        if self.getSlope() == DBL_MIN{
            xIntersection = p1.x;
            yIntersection = s.getYIntersection(self, xIntersection: xIntersection);
        }else if s.getSlope() == DBL_MIN{
            xIntersection = s.p1.x;
            yIntersection = self.getYIntersection(s, xIntersection: xIntersection);
        } else{
            let deltaB = s.getYIntercepct() - getYIntercepct();
            xIntersection = deltaB / deltaM;
            yIntersection = self.getYIntersection(s, xIntersection: xIntersection);
        }
        
        
        let p:Point = Point()
        p.x = xIntersection;
        p.y = yIntersection;
        return p;
    }
    
    func getYIntersection(s:Segment, xIntersection:Double) -> Double{
        return getSlope() * xIntersection + getYIntercepct();
    }
}
