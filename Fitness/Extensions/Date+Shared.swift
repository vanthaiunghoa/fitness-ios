//
//  NSDate+Shared.swift
//  Fitness
//
//  Created by Keivan Shahida on 4/25/18.
//  Copyright © 2018 Keivan Shahida. All rights reserved.
//

import Foundation

extension Date {
    
    // MARK: - TIME OF DAY
    static public func getDateFromTime(time: String) -> Date{
        let index = time.index(of: ":")
        let isPM = time.contains("PM")
        
        let date = Date()
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.year = calendar.component(.year, from: date)
        dateComponents.month = calendar.component(.month, from: date)
        dateComponents.day = calendar.component(.day, from: date)
        dateComponents.timeZone = TimeZone(abbreviation: "EDT")
        
        let hour = Int(String(time.prefix(upTo: index!)))
        dateComponents.hour = isPM ? hour! + 12 : hour
        
        let start = time.index(time.startIndex, offsetBy: 3)
        let end = time.index(time.endIndex, offsetBy: -2)
        let minutes = Int(String(time[start..<end]))
        dateComponents.minute = minutes
        
        return calendar.date(from: dateComponents)!
    }
    
    // MARK: - DAY OF WEEK
    func getIntegerDayOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday! - 1
    }
    
    func getStringDayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
