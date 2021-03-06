//
//  NSDate+Shared.swift
//  Fitness
//
//  Created by Keivan Shahida on 4/25/18.
//  Copyright © 2018 Uplift. All rights reserved.
//

import Foundation

extension Date {
    static public func getNowString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        //2018-10-04T07:00:00
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }

    // MARK: - TIME OF DAY
    static public func getDateFromTime(time: String) -> Date {
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

    static public func convertTimeStringToDate(time: String) -> Date {
        let currDate = Date()
        let timeSections = time.split(separator: ":")
        let date = Calendar.current.date(bySettingHour: Int(timeSections[0]) ?? 0, minute: Int(timeSections[1]) ?? 0, second: Int(timeSections[2]) ?? 0, of: currDate)
        return date ?? currDate
    }

    static public func getDatetimeFromString(datetime: String?) -> Date {
        guard let datetime = datetime else {
            return Date()
        }
        let dateFormatter = DateFormatter()
        //2018-10-04T07:00:00
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        return dateFormatter.date(from: datetime) ?? Date()
    }

    static public func getTimeFromString(datetime: String?) -> Date {
        guard let datetime = datetime else {
            return Date()
        }
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"

        let date = dateFormatter.date(from: datetime) ?? today
        let calendar = Calendar.current
        var dateComponents = DateComponents()

        dateComponents.year = calendar.component(.year, from: today)
        dateComponents.month = calendar.component(.month, from: today)
        dateComponents.day = calendar.component(.day, from: today)
        dateComponents.timeZone = TimeZone.current
        dateComponents.hour = calendar.component(.hour, from: date)
        dateComponents.minute = calendar.component(.minute, from: date)

        return calendar.date(from: dateComponents)!
    }
    
    static public func getDatetimeFromStrings(dateString: String, timeString: String) -> Date {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let time = dateFormatter.date(from: timeString) ?? Date()
        
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.date(from: dateString) ?? Date()
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        dateComponents.year = calendar.component(.year, from: date)
        dateComponents.month = calendar.component(.month, from: date)
        dateComponents.day = calendar.component(.day, from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.hour = calendar.component(.hour, from: time)
        dateComponents.minute = calendar.component(.minute, from: time)
        
        return calendar.date(from: dateComponents)!
    }

    // MARK: - DATE
    static func getStringDate(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }

    // MARK: - MINUTES
    static public func getMinutesFromDuration(duration: String) -> Int {
        var durationMinutes = duration

        if durationMinutes.hasPrefix("0") {
            durationMinutes = durationMinutes.substring(from: String.Index(encodedOffset: 2))
        } else {
            let hours = durationMinutes.substring(to: String.Index(encodedOffset: durationMinutes.count-3))
            durationMinutes = durationMinutes.substring(from: String.Index(encodedOffset: 2))
            durationMinutes = String( Int(hours)!*60 + (Int(durationMinutes) ?? 0))
        }

        return Int(durationMinutes)!
    }

    // MARK: - DAY OF WEEK
    func getIntegerDayOfWeekToday() -> Int {
        return Calendar.current.component(.weekday, from: self) - 1
    }

    func getIntegerDayOfWeekTomorrow() -> Int {
        return Calendar.current.component(.weekday, from: self) % 7
    }

    // MARK: - String
    func getStringOfDatetime(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
