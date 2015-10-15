//
//  Segment.swift
//  Point and Segment
//
//  Created by Guy Azran on 10/14/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

class Segment {
    private var _p1:Point?;
    private var _p2:Point?;
    private var _length:Double?;
    private var _isChanged:Bool = false;
    //"!" after the type means that we don't want to use Swift's nil protection for this variable so we have to do all validations ourselves
    //"?" after the type means that we allow this variable to be nil, meaning that it is an "optional"
    
    var p1:Point?{
        get{
            return _p1
        } set{
            _p1 = newValue
            _isChanged = true; //the value of length will be different. this will ensure that when length is called that it will be recalculated
        }
    }
    var p2:Point?{
        get{
            return _p2
        } set{
            _p2 = newValue
            _isChanged = true;
        }
    }
    
    /*
    //length as a function;
    func length() -> Double{
        return p1.distanceFromPoint(p2);
    }
    */
    
    /*
    //length as a computed property
    var length:Double?{
        get{
            //use of conditional unwrap
            if let thePoint1 = p1{
                if let thePoint2 = p2{
                    return thePoint1.distanceFromPoint(thePoint2);
                }
            }
            
            return nil;
        }
    }
    */
    
    //length calculated into a variable in point setters
    private func calcLength(){
        if let thePoint1 = p1{
            if let thePoint2 = p2{
                _length = thePoint1.distanceFromPoint(thePoint2);
            }
        } else{
            _length = nil;
        }
    }
    
    var length:Double?{
        get{
            if _isChanged{ //the value of length will only be calculated if one of the points has changed
                calcLength();
                _isChanged = false;
            }
            return _length;
        }
    }
    
    func getSlope() -> Double{
        return p1!.getSlopeWith(p2!);
    }
    
    func getYIntercepct() -> Double{
        if getSlope() == DBL_MIN{
            return DBL_MIN;
        }
        return Double(p1!.y) - getSlope() * Double(p1!.x);
    }
    
    //my solution
    func getIntersectionWith(s:Segment) -> Point?{
        let deltaM = getSlope() - s.getSlope();
        if deltaM == 0{
            return nil;
        }
        
        let xIntersection:Double;
        let yIntersection:Double;
        
        if self.getSlope() == DBL_MIN{
            xIntersection = p1!.x;
            yIntersection = s.getYIntersection(self, xIntersection: xIntersection);
        }else if s.getSlope() == DBL_MIN{
            xIntersection = s.p1!.x;
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
