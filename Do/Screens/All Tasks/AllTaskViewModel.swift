//
//  AllTaskViewModel.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

class AllTaskViewModel: BaseTaskListViewModel, AllTaskViewModelable {
  var changeMonth: ((_ name: String) -> Void)?
  var calendarDelegate: CalendarDelegate?
  
  override init() {
    super.init()
    calendarDelegate = AllTaskFSCalendarDelegate(viewModel: self)
    tableDelegate = AllTaskTableDelegateObject(viewModel: self)
  }
  
  func setMonth(data: Date?) {
    changeMonth?((data ?? Date()).month)
  }

  func loadTask(start: Date = Date(), end: Date? = Date()) {
    dataHelper.getAllTask(start: start.startOfDay, end: end?.endOfDay) { [weak self] in
      self?.dataLoaded?()
    }
  }
  
  func daysSectionTapActin(section: Int) {
    let viewController = ViewControllers.taskList
    viewController.viewModel.targetDate = cellModel(indexPath: IndexPath(row: 0, section: section)).date
    self.pushViewController?(viewController)
  }
}
