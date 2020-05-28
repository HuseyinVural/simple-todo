//
//  BaseTaskTableDataSourceObject.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class BaseTaskTableDataSourceObject: NSObject, TaskTableDataSource {
  unowned var viewModel: TaskListable
  
  init(viewModel: TaskListable) {
    self.viewModel = viewModel
    super.init()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection(numberOfRowsInSection: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
