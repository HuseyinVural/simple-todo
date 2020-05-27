//
//  TaskListViewModel.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

class TaskListViewModel: BaseTaskListViewModel, TaskListViewModelable {
  var targetDate = Date()
  
  override init() {
    super.init()
    self.tableDelegate = TaskListTableDelegateObjecte(viewModel: self)
    self.tableDataSource = TaskListTableDataSourceObjecte(viewModel: self)
  }
  
  var dateTitle: String {
    return targetDate.dateToStirng()
  }
  
  func loadTask() {
    dataHelper.getAllTask(start: targetDate.startOfDay, end: targetDate.endOfDay) { [weak self] in
      self?.dataLoaded?()
    }
  }
  
  final func doneAction() -> (_ model: Task) -> Void {
    return { [weak self] model in
      DispatchQueue.main.async {
        self?.dataHelper.storeTask(task: model)
      }
    }
  }
}
