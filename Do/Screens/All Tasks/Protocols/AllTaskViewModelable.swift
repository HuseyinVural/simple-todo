//
//  AllTaskViewModelable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

protocol AllTaskViewModelable: TaskListable {
  var changeMonth: ((_ name: String) -> Void)? { get set }
  var calendarDelegate: CalendarDelegate? { get set }

  func loadTask(start: Date, end: Date?)
  func setMonth(data: Date?)
  func daysSectionTapActin(section: Int)
}

extension AllTaskViewModelable {
  func loadTask(start: Date) {
    loadTask(start: start, end: nil)
  }
}
