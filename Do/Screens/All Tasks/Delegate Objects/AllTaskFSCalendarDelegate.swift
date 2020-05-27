//
//  AllTaskFSCalendarDelegate.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import FSCalendar

class AllTaskFSCalendarDelegate: NSObject, CalendarDelegate {
  
  weak var viewModel: AllTaskViewModelable?
  
  init(viewModel: AllTaskViewModelable) {
    self.viewModel = viewModel
    super.init()
  }
  
  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    viewModel?.loadTask(start: calendar.selectedDates.first ?? Date(), end: calendar.selectedLast)
  }
  
  func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
    viewModel?.loadTask(start: calendar.selectedDates.first ?? Date(), end: calendar.selectedLast)
  }
  
  func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
    viewModel?.setMonth(data: calendar.currentPage)
  }
}
