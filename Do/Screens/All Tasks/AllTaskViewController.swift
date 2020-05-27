//
//  AllTaskViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import FSCalendar

class AllTaskViewController: BaseViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var monthTitle: UILabel!
  @IBOutlet weak var emptyStateArea: UIView!
  @IBOutlet weak var calendar: FSCalendar!
  
  var viewModel: AllTaskViewModelable = AllTaskViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindActions()
  }
  
  func bindActions() {
    tableView.delegate = viewModel.tableDelegate
    tableView.dataSource = viewModel.tableDataSource
    calendar.delegate = viewModel.calendarDelegate
    
    viewModel.dataLoaded = dataUpdated()
    viewModel.changeMonth = changeMonth()
    viewModel.updateEmptyAreaVisibility = updateEmptyAreaVisibility()
    viewModel.pushViewController = pushViewController()
    viewModel.loadTask(start: Date())
    viewModel.setMonth(data: nil)
  }
  
  final func dataUpdated() -> () -> Void {
    return { [weak self] in
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
  
  final func changeMonth() -> (_ name: String) -> Void {
    return { [weak self] name in
      DispatchQueue.main.async {
        guard let this = self else { return }
        this.monthTitle.text = name
      }
    }
  }
  
  final func updateEmptyAreaVisibility() -> (_ isHidden: Bool) -> Void {
    return { [weak self] isHidden in
      DispatchQueue.main.async {
        guard let self = self else { return }
        self.emptyStateArea.isHidden = isHidden
      }
    }
  }
  
  @IBAction func addNewAction(_ sender: Any) {
    viewModel.showNewTaskDetail(selectedDate: calendar.selectedDates.last)
  }
}
