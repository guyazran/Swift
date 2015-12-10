//
//  main.swift
//  NSDate
//
//  Created by Guy Azran on 12/10/15.
//  Copyright © 2015 Guy Azran. All rights reserved.
//

import Foundation

enum GregorianEra: Int{
    case BC = 0;
    case AD;
}

let date = NSCalendar.currentCalendar().dateWithEra(GregorianEra.AD.rawValue, year: 2015, month: 12, day: 10, hour: 14, minute: 3, second: 0, nanosecond: 0);
print("date = ", date);

let components = NSCalendar.currentCalendar().componentsInTimeZone(NSTimeZone.localTimeZone(), fromDate: date!);

components.hour = 16

print(components);

