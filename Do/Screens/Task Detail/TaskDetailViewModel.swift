//
//  TaskDetailViewModel.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import FSCalendar

class TaskDetailViewModel: TaskDetailViewModelable {
  var dataHelper: DataHelper = DataHelper()
  var changedSelectedDataLabel: ((String) -> Void)?

  var task: Task = Task(title: "", date: Date())
  
  var hasTask: Bool = false
  
  var confirmTitle: String {
    return hasTask ? Strings.Buttons.update : Strings.Buttons.save
  }
  
  var title: String {
    return hasTask ? Strings.Titles.create : Strings.Titles.detail
  }
  
  init() {
    DispatchQueue.main.async {
      self.hasTask = self.dataHelper.hasTask(id: self.task.id)
    }
  }
  
  func setTaskCategories(category: TaskCategories) {
    task.taskCategory = category
  }
  
  func setTaskType(type: TaskTypes) {
    task.taskType = type
  }
  
  func save(title: String?, desc: String?, success: () -> Void, error: (_ message: String) -> Void) {
    if let title = title, !title.isEmpty {
      task.title = title
      task.desc = desc
      dataHelper.storeTask(task: task)
      success()
    } else {
      error(Strings.Errors.emptyTitle)
    }
  }
  
  func delete(success: @escaping () -> Void) {
    dataHelper.deleteTask(id: task.id, completion: success)
  }
}

extension TaskDetailViewModel {
  func calendar(_ calender: FSCalendar, selectedDate: Date) {
    changedSelectedDataLabel?(selectedDate.dateToStirng())
    task.date = selectedDate
  }
}
