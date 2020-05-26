//
//  TaskDetailViewModel.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import FSCalendar

protocol TaskDetailViewModelable: CalenderPopupDelegate {
  var changedSelectedDataLabel: ((_ date: String) -> Void)? { get set }
  
  func setTaskCategories(category: TaskCategories)
  func setTaskType(type: TaskTypes)
}

class TaskDetailViewModel: TaskDetailViewModelable {
  var changedSelectedDataLabel: ((String) -> Void)?
  
  func setTaskCategories(category: TaskCategories) {
    print(category.title)
  }
  
  func setTaskType(type: TaskTypes) {
    print(type.title)
  }
}

extension TaskDetailViewModel {
  func calendar(_ calender: FSCalendar, selectedDate: Date?) {
    guard let selectedDate = selectedDate else { return }
    changedSelectedDataLabel?(selectedDate.dateToStirng())
  }
}
