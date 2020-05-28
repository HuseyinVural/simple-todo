//
//  BaseTaskListViewModel.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

class BaseTaskListViewModel: BaseRouter, TaskListable {
  var dataHelper: TaskDataOperation = DataHelper()
  var tableDataSource: TaskTableDataSource?
  var tableDelegate: TaskTableDelegate?
  var fetchControllerDelegate: TaskFetchControllerDelegate?
  
  override init() {
    super.init()
    tableDataSource = AllTaskTableDataSourceObject(viewModel: self)
    fetchControllerDelegate = BaseTaskFetchControllerDelegateObject(viewModel: self)
    dataHelper.taskListFetchController.delegate = self.fetchControllerDelegate
  }
  
  var numberOfSections: Int {
    let number = dataHelper.taskListFetchController.sections?.count ?? 0
    updateEmptyAreaVisibility?(!(number == 0))
    return number
  }
  
  func numberOfRowsInSection(numberOfRowsInSection section: Int) -> Int {
    return dataHelper.taskListFetchController.sections?[section].numberOfObjects ?? 0
  }
  
  func cellModel(indexPath: IndexPath) -> Task {
    return dataHelper.taskListFetchController.object(at: indexPath).dto
  }
  
  func showNewTaskDetail(selectedDate: Date?) {
    let viewController = ViewControllers.taskDetail
    viewController.viewModel.task.date = selectedDate ?? Date()
    self.pushViewController?(viewController)
  }
}
