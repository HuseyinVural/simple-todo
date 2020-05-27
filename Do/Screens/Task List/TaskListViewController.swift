//
//  TaskListViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import CoreData

class TaskListViewController: BaseViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var dateTitle: UILabel!
  
  var viewModel: TaskListViewModelable = TaskListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindActions()
  }
  
  func bindActions() {
    tableView.delegate = viewModel.tableDelegate
    tableView.dataSource = viewModel.tableDataSource
    viewModel.dataLoaded = dataUpdated()
    viewModel.pushViewController = pushViewController()
    viewModel.loadTask()
    DispatchQueue.main.async {
      self.tableView.rowHeight = 100
      self.dateTitle.text = self.viewModel.dateTitle
    }
  }
  
  final func dataUpdated() -> () -> Void {
    return { [weak self] in
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
  
  @IBAction func addNewTask(_ sender: Any) {
    viewModel.showNewTaskDetail(selectedDate: viewModel.targetDate)
  }
}
