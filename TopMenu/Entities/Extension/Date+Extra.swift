//
//  Date+Extra.swift
//  Humati
//
//  Created by Tops on 11/16/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

extension Date {
    
    func add(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func add(years: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .year, value: years, to: self)!
    }
    
    func add(months: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .month, value: months, to: self)!
    }
    
    func ageNow() -> Int {
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: self, to: now, options: [])
        let age = calcAge.year
        return age ?? 0
    }
}
