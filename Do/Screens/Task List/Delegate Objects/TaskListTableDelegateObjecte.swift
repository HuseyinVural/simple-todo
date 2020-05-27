//
//  TaskListTableDelegate.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskListTableDelegateObjecte: NSObject, TaskTableDelegate {
  unowned var viewModel: TaskListViewModelable
  
  init(viewModel: TaskListViewModelable) {
    self.viewModel = viewModel
    super.init()
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    (cell as? TaskListTaskCell)?.viewModel.doneAction = viewModel.doneAction()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detail = ViewControllers.taskDetail
    detail.viewModel.task = viewModel.cellModel(indexPath: indexPath)
    viewModel.pushViewController?(detail)
  }
}
