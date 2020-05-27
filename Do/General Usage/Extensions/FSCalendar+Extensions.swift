//
//  FSCalendar+Extensions.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import FSCalendar

extension FSCalendar {
  var selectedLast: Date? {
    return self.selectedDates.count == 1 ? nil : self.selectedDates.last
  }
}
