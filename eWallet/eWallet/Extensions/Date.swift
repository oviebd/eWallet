//
//  Date.swift
//  CryptoApp
//
//  Created by Habibur Rahman on 21/1/24.
//

import Foundation

//REf - https://medium.com/@jpmtech/swiftui-format-dates-and-times-the-easy-way-fc896b25003b

enum DateFormat: String {
    case full = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case y_m_d_h_m =  "yyyy-MM-dd HH:mm"
    case m_d =  "MM-dd"

    
}

extension Date {
    // "2021-03-13T20:49:26.606Z"
//    init(format: String) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = format
//        let date = formatter.date(from: format) ?? Date()
//        self.init(timeInterval: 0, since: date)
//    }

    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
//    
//    private func getDateFormatter(format : String) -> DateFormatter{
//        dateFormatter.dateFormat = format
//       // dateFormatter.timeZone = NSTimeZone(name: "GMT") // this line resolved me the
//    }
//    
    func asDateForChart() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.m_d.rawValue
        let dateString = formatter.string(from: self)
       return dateString

    }

    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }

    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }

    func removeTime() -> Date {
        let components = get(.day, .month, .year)
        let date = Calendar.current.date(from: components) ?? .now
        // print(date)
        return date
    }

    
    func toReadableDateString() -> String {
        return self.formatted(date: .abbreviated, time: .omitted)
    }
    
    func toReadableDateTimeString() -> String {
        return self.formatted(date: .abbreviated, time: .shortened)
    }
    
    func toReadableTimeString() -> String {
        return self.formatted(date: .omitted, time: .shortened)
    }
    
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func updateWith(hour : Int, minutes : Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = self.getYear()
        dateComponents.month = self.getMonth()
        dateComponents.day = self.getDayNumberOfMonth()
        dateComponents.timeZone = TimeZone(abbreviation: "UTC") // Japan Standard Time
        dateComponents.hour = hour
        dateComponents.minute = minutes

        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let someDateTime : Date = userCalendar.date(from: dateComponents)! //?? self
        return someDateTime
    }
    
}

extension Date {
  
    func dayAfter(dayNumber: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: dayNumber, to: self)!
    }

    func dayBefore(dayNumber: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: -dayNumber, to: self)!
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

//    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
//        return calendar.component(component, from: self)
//    }

    func getDayNumberOfMonth() -> Int? {
        return get(.day).day
    }

    func getMonth() -> Int? {
        return get(.month).month
    }

    func getYear() -> Int? {
        return get(.year).year
    }

    func getHour() -> Int? {
        return get(.hour).hour
    }

    func getMinutes() -> Int? {
        return get(.minute).minute
    }

    func getSeconds() -> Int? {
        return get(.second).second
    }
}

//let dateFormatter = DateFormatter()
//   dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//   dateFormatter.timeZone = NSTimeZone(name: "GMT") // this line resolved me the issue of getting one day less than the selected date
//   let startDate:NSDate = dateFormatter.dateFromString(fromdate)!
//   let endDate:NSDate = dateFormatter.dateFromString(todate)!
//   request.predicate = NSPredicate(format: "(date >= %@) AND (date <= %@)", startDate, endDate)
