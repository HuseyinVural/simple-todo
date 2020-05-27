//
//  Date+Extensions.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

extension Date {
  func dateToStirng(format: String? = nil) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format == nil ? defaultFormat : format
    dateFormatter.locale = Locale.current
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"
    
    if format == nil {
      return datePrefix + dateFormatter.string(from: self)
    } else {
      return dateFormatter.string(from: self)
    }
  }
  
  var defaultFormat: String {
    if datePrefix.isEmpty {
      return "E, MMM d"
    } else {
      return "MMM d"
    }
  }
  
  var datePrefix: String {
    let calendar = Calendar.current
    if calendar.isDateInToday(self) || calendar.isDateInTomorrow(self) {
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .medium
      dateFormatter.doesRelativeDateFormatting = true
      dateFormatter.locale = Locale.current
      return "\(dateFormatter.string(from: self)), "
    } else {
      return ""
    }
  }
}

extension Date {
  var startOfDay: Date {
    return Calendar.current.startOfDay(for: self)
  }
  
  var endOfDay: Date {
    var components = DateComponents()
    components.day = 1
    components.second = -1
    return Calendar.current.date(byAdding: components, to: startOfDay)!
  }
  
  var month: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM"
    dateFormatter.locale = Locale.current
    return dateFormatter.string(from: self)
  }
}
