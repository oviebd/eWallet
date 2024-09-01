//
//  Date.swift
//  CryptoApp
//
//  Created by Habibur Rahman on 21/1/24.
//

import Foundation

//REf - https://medium.com/@jpmtech/swiftui-format-dates-and-times-the-easy-way-fc896b25003b

enum DateFormat: String {
    case coinGeco = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
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
    
//    func toReadableDateStringWithoutYear() -> String {
//        return self.format: .dateTime.day().month().year())
//    }
   
    func toReadableDateString() -> String {
        return self.formatted(date: .abbreviated, time: .omitted)
    }
    
    func toReadableDateTimeString() -> String {
        return self.formatted(date: .abbreviated, time: .shortened)
    }
    
    func toReadableTimeString() -> String {
        return self.formatted(date: .omitted, time: .shortened)
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
