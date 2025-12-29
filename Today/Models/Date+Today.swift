//
//  Date+Today.swift
//  Today
//
//  Created by Viranaiken Jessy on 29/12/25.
//
import Foundation

extension Date {
    // This will create a shortcut to get a readable string from the date with hours and minutes
    var dateAndTime: String {
        /// Will avoid any date component inside just the hours and minutes
        let timeText = formatted(date: .omitted, time: .shortened)
        if Locale.current.calendar.isDateInToday(self) {
            /// If the date is the current day, return a Formated String with the hours and minutes
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            /// Else it is not the current day, return a different formated String
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@, %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
    // Shortcut to get a formated string from the date with the day
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            /// If current date return formated String
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            /// Else return a different one
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
