//
//  Date+Extensions.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

extension Date {
  func dateToStirng() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = defaultFormat
    dateFormatter.locale = Locale.current
    return datePrefix + dateFormatter.string(from: self)
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
